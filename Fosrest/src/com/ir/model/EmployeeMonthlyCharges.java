package com.ir.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;




@Entity
@Table(name="EmployeeMonthlyCharges")
public class EmployeeMonthlyCharges {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "id")
	private int id;
	
	
	private String resource;
	
	
	private String skill;
	
	private String quantity;
	private String unit;
	private String reporting;
	private String unitPrice;
	private String amount;
	

	public EmployeeMonthlyCharges() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getResource() {
		return resource;
	}


	public void setResource(String resource) {
		this.resource = resource;
	}


	public String getSkill() {
		return skill;
	}


	public void setSkill(String skill) {
		this.skill = skill;
	}


	public String getQuantity() {
		return quantity;
	}


	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}


	public String getUnit() {
		return unit;
	}


	public void setUnit(String unit) {
		this.unit = unit;
	}


	public String getReporting() {
		return reporting;
	}


	public void setReporting(String reporting) {
		this.reporting = reporting;
	}


	public String getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}

	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="customerid")
	private CustomerMaster customer;


	public CustomerMaster getCustomer() {
		return customer;
	}


	public void setCustomer(CustomerMaster customer) {
		this.customer = customer;
	}
	
 
	
	
	
}
