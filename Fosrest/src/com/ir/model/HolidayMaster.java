package com.ir.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;




@Entity
@Table(name="HolidayMaster")
public class HolidayMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "holidayId")
	private int holidayId;
	
	@NotEmpty(message = "Please enter holidayDate .")
	private String holidayDate;
	
	@NotEmpty(message="Holiday Reasons not be blank.")
	 
	private String holidayReason;
	
	@Column(name="isActive", columnDefinition="character varying(10) default 'Y'")
	private String isActive;
	
	
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	

	public HolidayMaster() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getHolidayId() {
		return holidayId;
	}


	public void setHolidayId(int holidayId) {
		this.holidayId = holidayId;
	}

	@NotNull
	public String getHolidayDate() {
		return holidayDate;
	}


	public void setHolidayDate(String holidayDate) {
		this.holidayDate = holidayDate;
	}


	public String getHolidayReason() {
		return holidayReason;
	}


	public void setHolidayReason(String holidayReason) {
		this.holidayReason = holidayReason;
	}

	

	
	
	
 
}
