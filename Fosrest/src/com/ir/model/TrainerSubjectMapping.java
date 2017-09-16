package com.ir.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="TrainerSubjectMapping")
public class TrainerSubjectMapping {

	@Id
 	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "id_Sequence")
	@SequenceGenerator(name = "id_Sequence", sequenceName = "TRAINERSUBJECTMAPPING_SEQ", allocationSize=1, initialValue=1)
	
 	@Column(name= "id")
 	private int id;
 	
	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="personalinformationtrainer")
	private PersonalInformationTrainer trainerId;
 	private int  subjectId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public PersonalInformationTrainer getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(PersonalInformationTrainer trainerId) {
		this.trainerId = trainerId;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
 	
 	
}
