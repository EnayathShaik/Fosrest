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

public class TrainingClosureForm {
	
	private int id;
	private String userType;
	private String trainingType;
    private String trainingInstitute;
	private String status;
	private String trainingDate;
	
	
	
	

	public TrainingClosureForm() {
		super();
		// TODO Auto-generated constructor stub
	}


	

	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
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

	

	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}


	public String getTrainingInstitute() {
		return trainingInstitute;
	}




	public void setTrainingInstitute(String trainingInstitute) {
		this.trainingInstitute = trainingInstitute;
	}




	public String getTrainingDate() {
		return trainingDate;
	}




	public void setTrainingDate(String trainingDate) {
		this.trainingDate = trainingDate;
	}




	


	

}

	