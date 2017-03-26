package com.ir.form;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;



/**
 * @author Jyoti Mekal
 *
 * New Form for Training Schedule
 */

public class TrainingScheduleForm {
	
	
	private String userType;
	private String trainingType;
	private String trainingPhase;
	private String status;
	private int day;
	private String unit;
	private String module;
	private String duration;
	
	
	
	

	public TrainingScheduleForm() {
		super();
		// TODO Auto-generated constructor stub
	}


	

	public String getUserType() {
		return userType;
	}



	public void setUserType(String userType) {
		this.userType = userType;
	}



	public String getTrainingType() {
		return trainingType;
	}



	public void setTrainingType(String trainingType) {
		this.trainingType = trainingType;
	}



	public String getTrainingPhase() {
		return trainingPhase;
	}



	public void setTrainingPhase(String trainingPhase) {
		this.trainingPhase = trainingPhase;
	}



	

	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}




	public int getDay() {
		return day;
	}




	public void setDay(int day) {
		this.day = day;
	}




	public String getUnit() {
		return unit;
	}




	public void setUnit(String unit) {
		this.unit = unit;
	}




	public String getModule() {
		return module;
	}




	public void setModule(String module) {
		this.module = module;
	}




	public String getDuration() {
		return duration;
	}




	public void setDuration(String duration) {
		this.duration = duration;
	}


	
 
}
