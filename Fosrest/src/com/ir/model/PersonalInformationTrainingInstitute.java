package com.ir.model;
import java.sql.Date;

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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;



@Entity
@Table(name="personalinformationtrainingInstitute")
public class PersonalInformationTrainingInstitute {
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "id_Sequence")
	@SequenceGenerator(name = "id_Sequence", sequenceName = "PERSONALINFOTRAINIGINSTITUTE_SEQ", allocationSize=1, initialValue=1)
	private int id;
	

	private String userType;
	

	
	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="loginDetails")
	private LoginDetails loginDetails;
	
	
	public LoginDetails getLoginDetails() {
		return loginDetails;
	}

	public void setLoginDetails(LoginDetails loginDetails) {
		this.loginDetails = loginDetails;
	}

	/*private String empID;
	
	
	
	 public String getEmpID() {
		return empID;
	}

	public void setEmpID(String empID) {
		this.empID = empID;
	}*/



	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}



	private String title;
	
	
	@NotNull
	
	@Size(min=1, max=50 , message="enter your Training Center Name")
	private String trainingCenterName;

	private int trainingPartnerName;
	


	 @Email
	private String Email;
	

	@Size(max=10 , message = "enter your mobile Number")
	private String mobile;
	



	private String pan;
	
	private String firstName;
	private String middleName;
	private String lastName;
	
	
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}



	@NotNull
	@Size(min=1, max=100 , message="enter your correspondenceAddress1")
	private String correspondenceAddress1;
	/*@NotNull
	@Size(min=1, max=100 , message="enter your correspondenceAddress1")*/
	private String correspondenceAddress2;

	
	private String correspondenceState;
	
	private String correspondenceCity;
	@NotNull @Size(min=6, max=6 , message="* enter your correspondencePincode ")
	private String correspondencePincode;


	/*private String residentialDistrict;*/
	@NotNull


	private String correspondenceDistrict;

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}



	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		this.Email = email;
	}

	

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCorrespondenceAddress1() {
		return correspondenceAddress1;
	}

	public void setCorrespondenceAddress1(String correspondenceAddress1) {
		this.correspondenceAddress1 = correspondenceAddress1;
	}

	public String getCorrespondenceAddress2() {
		return correspondenceAddress2;
	}

	public void setCorrespondenceAddress2(String correspondenceAddress2) {
		this.correspondenceAddress2 = correspondenceAddress2;
	}

	public String getCorrespondenceState() {
		return correspondenceState;
	}

	public void setCorrespondenceState(String correspondenceState) {
		this.correspondenceState = correspondenceState;
	}

	public String getCorrespondenceCity() {
		return correspondenceCity;
	}

	public void setCorrespondenceCity(String correspondenceCity) {
		this.correspondenceCity = correspondenceCity;
	}

	public String getCorrespondencePincode() {
		return correspondencePincode;
	}

	public void setCorrespondencePincode(String correspondencePincode) {
		this.correspondencePincode = correspondencePincode;
	}

	/*public String getResidentialDistrict() {
		return residentialDistrict;
	}

	public void setResidentialDistrict(String residentialDistrict) {
		this.residentialDistrict = residentialDistrict;
	}*/

	public String getCorrespondenceDistrict() {
		return correspondenceDistrict;
	}

	public void setCorrespondenceDistrict(String correspondenceDistrict) {
		this.correspondenceDistrict = correspondenceDistrict;
	}

	
	
	private int steps;

	public int getSteps() {
		return steps;
	}

	public void setSteps(int steps) {
		this.steps = steps;
	}
		
	private int sessWishToConduct;
	
	
	public int getSessWishToConduct() {
		return sessWishToConduct;
	}

	public void setSessWishToConduct(int sessWishToConduct) {
		this.sessWishToConduct = sessWishToConduct;
	}

	
	private String trainingType;
	
	private int seatingCapacity;
	
	
	
	public int getSeatingCapacity() {
		return seatingCapacity;
	}

	public void setSeatingCapacity(int seatingCapacity) {
		this.seatingCapacity = seatingCapacity;
	}

	public String getTrainingCenterName() {
		return trainingCenterName;
	}

	public void setTrainingCenterName(String trainingCenterName) {
		this.trainingCenterName = trainingCenterName;
	}

	public int getTrainingPartnerName() {
		return trainingPartnerName;
	}

	public void setTrainingPartnerName(int trainingPartnerName) {
		this.trainingPartnerName = trainingPartnerName;
	}

	public String getTrainingType() {
		return trainingType;
	}

	public void setTrainingType(String trainingType) {
		this.trainingType = trainingType;
	}

	
	private int noOfInHouseTrainer;
	
	private int noOfYearExp;
	
	private boolean availableTVProjector;
	
	private boolean availableInHouseTrainer;
	
	
	
	
	
	public int getNoOfInHouseTrainer() {
		return noOfInHouseTrainer;
	}

	public void setNoOfInHouseTrainer(int noOfInHouseTrainer) {
		this.noOfInHouseTrainer = noOfInHouseTrainer;
	}

	public int getNoOfYearExp() {
		return noOfYearExp;
	}

	public void setNoOfYearExp(int noOfYearExp) {
		this.noOfYearExp = noOfYearExp;
	}

	public boolean isAvailableTVProjector() {
		return availableTVProjector;
	}

	public void setAvailableTVProjector(boolean availableTVProjector) {
		this.availableTVProjector = availableTVProjector;
	}

	public boolean isAvailableInHouseTrainer() {
		return availableInHouseTrainer;
	}

	public void setAvailableInHouseTrainer(boolean availableInHouseTrainer) {
		this.availableInHouseTrainer = availableInHouseTrainer;
	}

	private String tpName;
	
	public String getTpName() {
		return tpName;
	}

	public void setTpName(String tpName) {
		this.tpName = tpName;
	}

	@Override
	public String toString() {
		return trainingCenterName;
	}

	
	
}
