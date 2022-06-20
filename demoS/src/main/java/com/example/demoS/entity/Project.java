package com.example.demoS.entity;
// Generated Jun 15, 2022, 11:29:00 AM by Hibernate Tools 3.6.2.Final



import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * Project generated by hbm2java
 */
@Entity
@Table(name = "Project")
public class Project {

	private long id;
	private CustomerAccount customerAccount;
	private Field field;
	private String title;
	private String description;
	private String duration;
	private String scope;
	private int hrsPerWeek;
	private int maximumBudget;
	private int status;
	private String createDate;
	private String updateDate;
	private Set<Apply> applies = new HashSet<Apply>(0);

	public Project() {
	}

	public Project(long id, Field field, String title, String description, String duration,
			String scope, int hrsPerWeek, int maximumBudget, int status) {
		this.id = id;
		this.field = field;
		this.title = title;
		this.description = description;
		this.duration = duration;
		this.scope = scope;
		this.hrsPerWeek = hrsPerWeek;
		this.maximumBudget = maximumBudget;
		this.status = status;
	}

	public Project(long id, CustomerAccount customerAccount, Field field, String title, String description,
			String duration, String scope, int hrsPerWeek, int maximumBudget, int status, String createDate,
			String updateDate, Set<Apply> applies) {
		this.id = id;
		this.customerAccount = customerAccount;
		this.field = field;
		this.title = title;
		this.description = description;
		this.duration = duration;
		this.scope = scope;
		this.hrsPerWeek = hrsPerWeek;
		this.maximumBudget = maximumBudget;
		this.status = status;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.applies = applies;
	}

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CustomerID")
	public CustomerAccount getCustomerAccount() {
		return this.customerAccount;
	}

	public void setCustomerAccount(CustomerAccount customerAccount) {
		this.customerAccount = customerAccount;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FieldID", nullable = false)
	public Field getField() {
		return this.field;
	}

	public void setField(Field field) {
		this.field = field;
	}

	@Column(name = "Title", nullable = false)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "Description", nullable = false)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "Duration", nullable = false)
	public String getDuration() {
		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	@Column(name = "Scope", nullable = false)
	public String getScope() {
		return this.scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}

	@Column(name = "HrsPerWeek", nullable = false)
	public int getHrsPerWeek() {
		return this.hrsPerWeek;
	}

	public void setHrsPerWeek(int hrsPerWeek) {
		this.hrsPerWeek = hrsPerWeek;
	}

	@Column(name = "MaximumBudget", nullable = false)
	public int getMaximumBudget() {
		return this.maximumBudget;
	}

	public void setMaximumBudget(int maximumBudget) {
		this.maximumBudget = maximumBudget;
	}

	@Column(name = "Status", nullable = false)
	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


	@Column(name = "CreateDate", length = 10)
	public String getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	@Column(name = "UpdateDate", length = 10)
	public String getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "project")
	public Set<Apply> getApplies() {
		return this.applies;
	}

	public void setApplies(Set<Apply> applies) {
		this.applies = applies;
	}

}
