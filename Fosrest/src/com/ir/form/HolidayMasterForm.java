package com.ir.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class HolidayMasterForm {
	
	@NotNull
	private int holidayId;
	@NotEmpty
	
	private String holidayDate;
	@NotNull
	private String holidayReason;
	
	
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


	@Override
	public String toString() {
		return "StateForm [holidayId=" + holidayId + ", holidayDate=" + holidayDate + ", holidayReason=" + holidayReason + "]";
	}
	
	
	

}
