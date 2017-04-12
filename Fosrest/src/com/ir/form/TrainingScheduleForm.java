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
	
	private int trainingScheduleId;
	private String userType;
	private String trainingType;
	private String trainingPhase;
	private String trainingInstitudeStatus;
	private int day;
	private String unit;
	private String module;
	private String duration;
	private String trainingStartDate;
	private String trainingEndDate;
	private int trainingPartner;
	private int trainingInstitude;
	private int state;
	private int trainer_id;
	private int training_institude_id;
	private String trainer_status;
	private String training_institude_status;
	private int unitId;
	private int moduleId;
	
	
	
	
	public int getUnitId() {
		return unitId;
	}




	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}




	public int getModuleId() {
		return moduleId;
	}




	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}




	public TrainingScheduleForm() {
		super();
		// TODO Auto-generated constructor stub
	}


	

	public int getTrainingScheduleId() {
		return trainingScheduleId;
	}




	public void setTrainingScheduleId(int trainingScheduleId) {
		this.trainingScheduleId = trainingScheduleId;
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




	public String getTrainingInstitudeStatus() {
		return trainingInstitudeStatus;
	}




	public void setTrainingInstitudeStatus(String trainingInstitudeStatus) {
		this.trainingInstitudeStatus = trainingInstitudeStatus;
	}




	public String getTrainingStartDate() {
		return trainingStartDate;
	}




	public void setTrainingStartDate(String trainingStartDate) {
		this.trainingStartDate = trainingStartDate;
	}




	public String getTrainingEndDate() {
		return trainingEndDate;
	}




	public void setTrainingEndDate(String trainingEndDate) {
		this.trainingEndDate = trainingEndDate;
	}




	public int getTrainingPartner() {
		return trainingPartner;
	}




	public void setTrainingPartner(int trainingPartner) {
		this.trainingPartner = trainingPartner;
	}




	public int getTrainingInstitude() {
		return trainingInstitude;
	}




	public void setTrainingInstitude(int trainingInstitude) {
		this.trainingInstitude = trainingInstitude;
	}




	public int getState() {
		return state;
	}




	public void setState(int state) {
		this.state = state;
	}




	public int getTrainer_id() {
		return trainer_id;
	}




	public void setTrainer_id(int trainer_id) {
		this.trainer_id = trainer_id;
	}




	public int getTraining_institude_id() {
		return training_institude_id;
	}




	public void setTraining_institude_id(int training_institude_id) {
		this.training_institude_id = training_institude_id;
	}




	public String getTrainer_status() {
		return trainer_status;
	}




	public void setTrainer_status(String trainer_status) {
		this.trainer_status = trainer_status;
	}




	public String getTraining_institude_status() {
		return training_institude_status;
	}




	public void setTraining_institude_status(String training_institude_status) {
		this.training_institude_status = training_institude_status;
	}


	
 
}
