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
@Table(name="mappingmastertrainer")
@Transactional
public class MappingMasterTrainer {
	@Id
	@Column(name="Id")
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int Id;
	
	@Column(name="firstName")
	private String firstName;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name="State")
	@NotEmpty(message="Please selct your business type !")
	private String state;
	

	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="personalinformationtrainer")
	private PersonalInformationTrainer trainerId;

	public PersonalInformationTrainer getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(PersonalInformationTrainer trainerId) {
		this.trainerId = trainerId;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}




	
}
