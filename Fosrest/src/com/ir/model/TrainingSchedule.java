package com.ir.model;


import java.util.Date;
import java.util.List;

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
	private String designation;
	private String trainingType;
	private String trainingPhase;
	private String scheduleCode;
	
	private String totalDuration;

	public String getTotalDuration() {
		return totalDuration;
	}
	public void setTotalDuration(String totalDuration) {
		this.totalDuration = totalDuration;
	}

	private int days;
	public int getDays() {
return days;
}
public void setDays(int days) {
this.days = days;
}


	public String getScheduleCode() {
		return scheduleCode;
	}

	public void setScheduleCode(String scheduleCode) {
		this.scheduleCode = scheduleCode;
	}

	private String subjects;// is unitId

@CreationTimestamp
@Temporal(TemporalType.TIMESTAMP)
@Column(name = "create_date")
private Date createDate;

@UpdateTimestamp
@Temporal(TemporalType.TIMESTAMP)
@Column(name = "modify_date")
private Date modifyDate;

@Column(columnDefinition="int default 0")
private int seqNo;

@Column(name="isActive", columnDefinition="character varying(10) default 'A'")
private String isActive;


private String status;


public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}


	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}



	

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



	public String getSubjects() {
		return subjects;
	}

	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}

	public int getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
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


	
 
}
