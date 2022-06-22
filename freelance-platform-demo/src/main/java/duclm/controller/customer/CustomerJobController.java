package duclm.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import duclm.domain.Field;
import duclm.domain.Job;
import duclm.domain.Tech;
import duclm.domain.User;
import duclm.model.FieldDto;
import duclm.model.JobDto;
import duclm.model.TechDto;
import duclm.model.UserDto;
import duclm.repository.FieldRepository;
import duclm.repository.JobRepository;
import duclm.repository.TechRepository;
import duclm.service.UserService;
import duclm.service.FieldService;
import duclm.service.JobService;
import duclm.service.StorageService;
import duclm.service.TechService;

@Controller
@RequestMapping("customer/jobs")
public class CustomerJobController {
	@Autowired
	JobService jobService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	FieldService fieldService;
	
	@Autowired
	TechService techService;
	
	@Autowired
	HttpSession session;
	
	@ModelAttribute("fields")
	public List<FieldDto> getFields(){
		return fieldService.findAll().stream().map(item->{
			FieldDto dto = new FieldDto();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).toList();
	}
	
	@ModelAttribute("techs")
	public List<TechDto> getTechs() {
		return techService.findAll().stream().map(item->{
			TechDto dto = new TechDto();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).toList();
	}
	
	@ModelAttribute("scopes")
	public List<String> getScopes(){
		return Arrays.asList("Large","Medium","Small");
	}
	
	@ModelAttribute("durations")
	public List<String> getDurations(){
		return Arrays.asList("Less than 1 month","1 to 3 months","3 to 6 months","More than 6 months");
	}
	
	@RequestMapping("")
	public String list(ModelMap model) {
		Long userId = Long.valueOf(session.getAttribute("userid").toString());
		List<Job> list = jobService.findAllByUserId(userId);
		
		model.addAttribute("myjobs", list);
		
		return "customer/jobs/mylist";
	}
	
	@GetMapping("add")
	public String add(Model model) {
		JobDto dto = new JobDto();
		model.addAttribute("job", dto);
		
		return "customer/jobs/addNew";
	}
	
	@PostMapping("save")
	public ModelAndView saveJob(ModelMap model,
			@Valid @ModelAttribute("job") JobDto dto,
			@RequestParam("techChecked") String techChecked,
			BindingResult result) {
		
		if(result.hasErrors()) {
			return new ModelAndView("admin/products/addOrEdit");
		}
		
		String[] stringArray = techChecked.split(",");
		List<String> techCheckedList = Arrays.asList(stringArray);
		
		Job entity = new Job();
		BeanUtils.copyProperties(dto, entity);
		
		for (String tech : techCheckedList) {		
			entity.getTechs().add(techService.findByName(tech));
		}
		
		entity.setField(fieldService.findById(dto.getFieldId()).get());
		
		Long userId = Long.valueOf(session.getAttribute("userid").toString());
		User currentUser = userService.getById(userId);
		entity.setUser(currentUser);
		
		jobService.save(entity);
		
		model.addAttribute("message", "Job is saved!");
		
		return new ModelAndView("forward:/customer/jobs",model);
	}
	
	@GetMapping("detail/{id}")
	public ModelAndView detail(ModelMap model, @PathVariable("id") Long jobId) {
		Long userId = Long.valueOf(session.getAttribute("userid").toString());
		Optional<Job> opt = jobService.findById(jobId);
		JobDto dto = new JobDto();
		if(opt.isPresent()) {
			Job entity = opt.get();
			
			if(entity.getUser().getUserId()!=userId) {
				model.addAttribute("message", "You can only edit your own job!");
				return new ModelAndView("forward:/customer/jobs", model);
			}
			
			BeanUtils.copyProperties(entity, dto);
			
			model.addAttribute("techList", entity.getTechs().toArray());
			model.addAttribute("jobField", entity.getField().getName());
			model.addAttribute("job", dto);
			
			return new ModelAndView("customer/jobs/detail", model);
		}
		
		model.addAttribute("message", "Job is not exist");
		return new ModelAndView("forward:/customer/jobs", model);
	}
	
	@GetMapping("edit/{jobId}")
	public ModelAndView edit(ModelMap model, @PathVariable("jobId") Long jobId) {
		Long userId = Long.valueOf(session.getAttribute("userid").toString());
		Optional<Job> opt = jobService.findById(jobId);
		JobDto dto = new JobDto();
		if(opt.isPresent()) {
			Job entity = opt.get();
			
			if(entity.getUser().getUserId()!=userId) {
				model.addAttribute("message", "You can only edit your own job!");
				return new ModelAndView("forward:/customer/jobs", model);
			}
			
			BeanUtils.copyProperties(entity, dto);
			dto.setFieldId(entity.getField().getFieldId());
			
			List<String> techs = new ArrayList<String>();
			Set<Tech> techsSet = entity.getTechs();
			for (Tech tech : techsSet) {
				techs.add(tech.getName());
			}
			dto.setTechs(techs);
			model.addAttribute("job", dto);
			
			return new ModelAndView("customer/jobs/editJob", model);
		}
		
		model.addAttribute("message", "Job is not exist");
		return new ModelAndView("forward:/customer/jobs", model);
	}
	
	@GetMapping("delete/{jobId}")
	public ModelAndView delete(ModelMap model,@PathVariable("jobId") Long jobId) throws IOException {
		
		Optional<Job> opt = jobService.findById(jobId);
		
		if(opt.isPresent()) {
			jobService.saveWithStatus0(opt.get());
			
			model.addAttribute("message", "Job is deleted!");
		} else {
			model.addAttribute("message", "Job is not found!");
		}
		
		return new ModelAndView("forward:/customer/jobs",model);
	}
}
