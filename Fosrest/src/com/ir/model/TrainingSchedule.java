package com.ir.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;



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
	private int state;
	private int trainer_id;
	private int training_institude_id;
	private String trainer_status;
	private String training_institude_status;
	private String batchCode;
	@Column(columnDefinition="int default 0")
	private int seqNo;
	
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

	
	private int unitId;
	private int moduleId;
  

public String getBatchCode() {
		return batchCode;
	}
public void setBatchCode(String batchCode) {
	this.batchCode = batchCode;
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

	

	public int getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}

	

	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date")
	private Date createDate;

	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modify_date")
	private Date modifyDate;




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


	
 
}
