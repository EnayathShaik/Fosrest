package com.ir.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;




@Entity
@Table(name="CustomerMaster")
public class CustomerMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "customerId")
	private int customerId;
	
	@NotEmpty(message = "Please enter Name .")
	private String name;
	
	@NotEmpty(message="Holiday Reasons not be Address.")
	private String address;
	

	public CustomerMaster() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}



	
	

	
	
	
 
}
