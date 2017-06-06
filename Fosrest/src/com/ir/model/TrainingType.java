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
import javax.transaction.Transactional;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="trainingType")
@Transactional

public class TrainingType {
	@Id
	@Column(name="trainingTypeId")
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int trainingTypeId;
	
	@Column(name="trainingTypeName")
	@NotEmpty(message="Please selct your business type !")
	private String trainingTypeName;

	
	public TrainingType() {
		
	}

	public TrainingType(int trainingTypeId, String trainingTypeName) {
		super();
		this.trainingTypeId = trainingTypeId;
		this.trainingTypeName = trainingTypeName;
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

	public int getTrainingTypeId() {
		return trainingTypeId;
	}

	public void setTrainingTypeId(int trainingTypeId) {
		this.trainingTypeId = trainingTypeId;
	}

	public String getTrainingTypeName() {
		return trainingTypeName;
	}

	public void setTrainingTypeName(String trainingTypeName) {
		this.trainingTypeName = trainingTypeName;
	}
	
}
