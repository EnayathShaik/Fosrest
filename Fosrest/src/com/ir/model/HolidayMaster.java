package com.ir.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="HolidayMaster")
public class HolidayMaster {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "holidayId")
	private int holidayId;
	private String holidayDate;
	private String holidayReason;
	

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
