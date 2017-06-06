package com.ir.model;
import java.util.Date;

import javax.persistence.CascadeType;
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
import javax.transaction.Transactional;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="trainingPhase")
@Transactional
public class TrainingPhase {


	@Id
	@Column(name="trainingPhaseId")
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int trainingPhaseId;
	

	@Column(name="trainingPhaseName")
	@NotEmpty(message="Please selct your business type !")
	private String trainingPhaseName;

	

	public TrainingPhase() {
		
	}
	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="trainingType")
	private TrainingType trainingType;
	public TrainingType getTrainingType() {
		return trainingType;
	}


	public void setTrainingType(TrainingType trainingType) {
		this.trainingType = trainingType;
	}


	public TrainingPhase(int trainingPhaseId, String trainingPhaseName) {
		super();
		this.trainingPhaseId = trainingPhaseId;
		this.trainingPhaseName = trainingPhaseName;
	}


	public int getTrainingPhaseId() {
		return trainingPhaseId;
	}


	@Override
	public String toString() {
		return "trainingPhaseId=" + trainingPhaseId + ", trainingPhaseName=" + trainingPhaseName
				 ;
	}


	public void setTrainingPhaseId(int trainingPhaseId) {
		this.trainingPhaseId = trainingPhaseId;
	}


	public String getTrainingPhaseName() {
		return trainingPhaseName;
	}


	public void setTrainingPhaseName(String trainingPhaseName) {
		this.trainingPhaseName = trainingPhaseName;
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
