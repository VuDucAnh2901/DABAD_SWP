package duclm;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import duclm.config.StorageProperties;
import duclm.service.StorageService;


@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class FreelancePlatformDemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(FreelancePlatformDemoApplication.class, args);
	}
	
	@Bean
	CommandLineRunner init(StorageService storageService) {
		return(args->{
			storageService.init();
		});
	}
}
