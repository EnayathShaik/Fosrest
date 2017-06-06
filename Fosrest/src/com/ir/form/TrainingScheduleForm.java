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
	public String getTrainingInstitudeStatus() {
		return trainingInstitudeStatus;
	}
	public void setTrainingInstitudeStatus(String trainingInstitudeStatus) {
		this.trainingInstitudeStatus = trainingInstitudeStatus;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}

	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
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
	private int trainingScheduleId;
	private String userType;
	
	private String trainingInstitudeStatus;
	private int day;
	private String unitName;
	private String moduleName;
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
	private String chapter;
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	private String designation;
	private String trainingType;
	private String trainingPhase;
	private String status;
	private String courseName;
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
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
	
	
 
}
