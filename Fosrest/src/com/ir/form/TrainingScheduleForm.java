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
	
	private String modules;
	
	private int chapterId;
	private String chapter;
	private int trainingScheduleId;
	private int day;

	private int day2;
	private String startTime;
	private String endTime;
	private String designation;
	private String trainingType;
	private String trainingPhase;
	private String status;
	
	private String designation2;
	private String trainingType2;
	private String trainingPhase2;
	
	
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
	public String getModules() {
		return modules;
	}
	public void setModules(String modules) {
		this.modules = modules;
	}
	public int getChapterId() {
		return chapterId;
	}
	public void setChapterId(int chapterId) {
		this.chapterId = chapterId;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public int getTrainingScheduleId() {
		return trainingScheduleId;
	}
	public void setTrainingScheduleId(int trainingScheduleId) {
		this.trainingScheduleId = trainingScheduleId;
	}
	public int getDay2() {
		return day2;
	}
	public void setDay2(int day2) {
		this.day2 = day2;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
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
	public String getDesignation2() {
		return designation2;
	}
	public void setDesignation2(String designation2) {
		this.designation2 = designation2;
	}
	public String getTrainingType2() {
		return trainingType2;
	}
	public void setTrainingType2(String trainingType2) {
		this.trainingType2 = trainingType2;
	}
	public String getTrainingPhase2() {
		return trainingPhase2;
	}
	public void setTrainingPhase2(String trainingPhase2) {
		this.trainingPhase2 = trainingPhase2;
	}
	
	
	
	
	
 
}
