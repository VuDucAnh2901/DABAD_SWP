package com.example.demoS.entity;
// Generated Jun 15, 2022, 11:29:00 AM by Hibernate Tools 3.6.2.Final


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Company generated by hbm2java
 */
@Entity
@Table(name = "Company")
public class Company  {

	private long id;
	private String name;
	private String location;
	private Set<CustomerAccount> customerAccounts = new HashSet<CustomerAccount>(0);

	public Company() {
	}

	public Company(long id, String name, String location) {
		this.id = id;
		this.name = name;
		this.location = location;
	}

	public Company(long id, String name, String location, Set<CustomerAccount> customerAccounts) {
		this.id = id;
		this.name = name;
		this.location = location;
		this.customerAccounts = customerAccounts;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false)
	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "Name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Location", nullable = false)
	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "company")
	public Set<CustomerAccount> getCustomerAccounts() {
		return this.customerAccounts;
	}

	public void setCustomerAccounts(Set<CustomerAccount> customerAccounts) {
		this.customerAccounts = customerAccounts;
	}

}
