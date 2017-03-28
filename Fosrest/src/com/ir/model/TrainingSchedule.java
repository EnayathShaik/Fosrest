package com.ir.model;


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
 * New Table for Unit Master
 */
@Entity
@Table(name="TrainingSchedule")
public class TrainingSchedule {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "trainingScheduleId")
	private int trainingScheduleId;
	private String userType;
	private String trainingType;
	private String trainingPhase;
	private String trainingInstitudeStatus;
	private String trainingStartDate;
	private String trainingEndDate;
	private int trainingPartner;
	private int trainingInstitude;
	@Column(name="isActive", columnDefinition="character varying(10) default 'A'")
	private String isActive;
	
	
	

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public TrainingSchedule() {
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


	public int getTrainingScheduleId() {
		return trainingScheduleId;
	}





	public void setTrainingScheduleId(int trainingScheduleId) {
		this.trainingScheduleId = trainingScheduleId;
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




	
 
}
