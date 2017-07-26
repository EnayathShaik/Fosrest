package com.ir.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;


@Entity @Table(name="trainingCalendar")
public class TrainingCalendar {
	
	@Id @GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int trainingCalendarId;
	
			private String trainingType;
			private String trainingPhase;
			private String designation;
			private int stateId;
			
			@CreationTimestamp
			@Temporal(TemporalType.TIMESTAMP)
			@Column(name = "create_date")
			private Date createDate;

			@UpdateTimestamp
			@Temporal(TemporalType.TIMESTAMP)
			@Column(name = "modify_date")
			private Date modifyDate;
			
			
			
			public int getStateId() {
				return stateId;
			}
			public void setStateId(int stateId) {
				this.stateId = stateId;
			}
			public Date getCreateDate() {
				return createDate;
			}
			public void setCreateDate(Date createDate) {
				this.createDate = createDate;
			}
			public Date getModifyDate() {
				return modifyDate;
			}
			public void setModifyDate(Date modifyDate) {
				this.modifyDate = modifyDate;
			}
			public String getTrainingInstitute() {
				return trainingInstitute;
			}
			public void setTrainingInstitute(String trainingInstitute) {
				this.trainingInstitute = trainingInstitute;
			}
			private String trainingInstitute;
			//private String trainerName;
			private String totalduration;
			public String getTotalduration() {
				return totalduration;
			}
			public void setTotalduration(String totalduration) {
				this.totalduration = totalduration;
			}
			private String totalDays;
			public String getTotalDays() {
				return totalDays;
			}
			public void setTotalDays(String totalDays) {
				this.totalDays = totalDays;
			}
			private String trainingStartDate;
			private String trainingEndDate;
		
			public String getTrainingEndDate() {
				return trainingEndDate;
			}
			public void setTrainingEndDate(String trainingEndDate) {
				this.trainingEndDate = trainingEndDate;
			}
			public String getScheduleCode() {
				return scheduleCode;
			}
			public void setScheduleCode(String scheduleCode) {
				this.scheduleCode = scheduleCode;
			}
			private String isActive;
			private String batchCode;
			private String scheduleCode;
		
			
			
			public String getBatchCode() {
				return batchCode;
			}
			public void setBatchCode(String batchCode) {
				this.batchCode = batchCode;
			}
			public String getIsActive() {
				return isActive;
			}
			public void setIsActive(String isActive) {
				this.isActive = isActive;
			}
			public int getTrainingCalendarId() {
				return trainingCalendarId;
			}
			public void setTrainingCalendarId(int trainingCalendarId) {
				this.trainingCalendarId = trainingCalendarId;
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
			public String getDesignation() {
				return designation;
			}
			public void setDesignation(String designation) {
				this.designation = designation;
			}
	
			public String getTrainingStartDate() {
				return trainingStartDate;
			}
			public void setTrainingStartDate(String trainingStartDate) {
				this.trainingStartDate = trainingStartDate;
			}
			
}
