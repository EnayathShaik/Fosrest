package com.ir.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;




@Entity
@Table(name="TrainingPartner")
public class TrainingPartner {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "trainingPartnerId")
	private int trainingPartnerId;
	
	@NotEmpty(message = "Please enter Training Partner .")
	private String trainingPartnerName;
	
	@NotEmpty(message="Website  Link can not be blank.")
	private String tpWebLink;
	
	private String status;
	
	
	public TrainingPartner() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getTrainingPartnerId() {
		return trainingPartnerId;
	}


	public void setTrainingPartnerId(int trainingPartnerId) {
		this.trainingPartnerId = trainingPartnerId;
	}





	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getTrainingPartnerName() {
		return trainingPartnerName;
	}


	public void setTrainingPartnerName(String trainingPartnerName) {
		this.trainingPartnerName = trainingPartnerName;
	}


	public String getTpWebLink() {
		return tpWebLink;
	}


	public void setTpWebLink(String tpWebLink) {
		this.tpWebLink = tpWebLink;
	}


	

	
	
	
 
}
