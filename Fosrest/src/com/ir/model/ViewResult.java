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
@Table(name="viewResult")
@Transactional
public class ViewResult {
	@Id
	@Column(name="viewResultId")
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int viewResultId;
	
	
	//private String batchCode;
	private int trainingcalendarId;
	public int getTrainingcalendarId() {
		return trainingcalendarId;
	}
	public void setTrainingcalendarId(int trainingcalendarId) {
		this.trainingcalendarId = trainingcalendarId;
	}
	private int marks;
	private int Subject;
	private int traineeId;
	private int trainerId;
	public int getViewResultId() {
		return viewResultId;
	}
	public void setViewResultId(int viewResultId) {
		this.viewResultId = viewResultId;
	}
	
	public int getMarks() {
		return marks;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}

	public int getSubject() {
		return Subject;
	}
	public void setSubject(int subject) {
		Subject = subject;
	}
	
	public int getTraineeId() {
		return traineeId;
	}
	public void setTraineeId(int traineeId) {
		this.traineeId = traineeId;
	}
	public int getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(int trainerId) {
		this.trainerId = trainerId;
	}
}
