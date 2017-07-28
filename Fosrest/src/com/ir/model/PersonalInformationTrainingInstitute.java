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
	private int createdBy;
	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="loginDetails")
	private LoginDetails loginDetails;
	private String title;
	private int noOfPC;
	@NotNull
	@Size(min=1, max=50 , message="enter your Training Center Name")
	private String trainingCenterName;
	@Email
	private String Email;
	@Size(max=10 , message = "enter your mobile Number")
	private String mobile;
	private String firstName;
	private String middleName;
	private String lastName;
	@NotNull
	@Size(min=1, max=100 , message="enter your correspondenceAddress1")
	private String correspondenceAddress1;
	private String correspondenceAddress2;
	private String correspondenceState;
	private String correspondenceCity;
	@NotNull @Size(min=6, max=6 , message="* enter your correspondencePincode ")
	private String correspondencePincode;
	@NotNull
	private String correspondenceDistrict;
	private int steps;
	private int seatingCapacity;
	private int noOfInHouseTrainer;
	private boolean availableTVProjector;
	
	private boolean availableInHouseTrainer;
	private String logId;
	private String Status;
	private boolean lcd;
	private boolean laptop;
	private boolean projector;
	private boolean printer;
	private boolean photoCopier;
	private boolean whiteBoard;
	private boolean powerBackup;
	private boolean trTool;
	private boolean internetFacility;
	private boolean light;
	private boolean sound;
	private boolean ac;
	private boolean fssaiLab;
	private boolean transport;
	private String lastYearTrainings;
	private String lastYearParticipants;
	private boolean conHall;
	private String noOfHall;
	private String perHall;
	private String hostelRooms;
	private boolean mess;
	private boolean powerHostel;
	private boolean hostel;

	
	




	public int getId() {
	return id;
}




public void setId(int id) {
	this.id = id;
}




public int getCreatedBy() {
	return createdBy;
}




public void setCreatedBy(int createdBy) {
	this.createdBy = createdBy;
}




public LoginDetails getLoginDetails() {
	return loginDetails;
}




public void setLoginDetails(LoginDetails loginDetails) {
	this.loginDetails = loginDetails;
}




public String getTitle() {
	return title;
}




public void setTitle(String title) {
	this.title = title;
}




public int getNoOfPC() {
	return noOfPC;
}




public void setNoOfPC(int noOfPC) {
	this.noOfPC = noOfPC;
}




public String getTrainingCenterName() {
	return trainingCenterName;
}




public void setTrainingCenterName(String trainingCenterName) {
	this.trainingCenterName = trainingCenterName;
}




public String getEmail() {
	return Email;
}




public void setEmail(String email) {
	Email = email;
}




public String getMobile() {
	return mobile;
}




public void setMobile(String mobile) {
	this.mobile = mobile;
}




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




public String getCorrespondenceDistrict() {
	return correspondenceDistrict;
}




public void setCorrespondenceDistrict(String correspondenceDistrict) {
	this.correspondenceDistrict = correspondenceDistrict;
}




public int getSteps() {
	return steps;
}




public void setSteps(int steps) {
	this.steps = steps;
}




public int getSeatingCapacity() {
	return seatingCapacity;
}




public void setSeatingCapacity(int seatingCapacity) {
	this.seatingCapacity = seatingCapacity;
}




public int getNoOfInHouseTrainer() {
	return noOfInHouseTrainer;
}




public void setNoOfInHouseTrainer(int noOfInHouseTrainer) {
	this.noOfInHouseTrainer = noOfInHouseTrainer;
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




public String getLogId() {
	return logId;
}




public void setLogId(String logId) {
	this.logId = logId;
}




public String getStatus() {
	return Status;
}




public void setStatus(String status) {
	Status = status;
}


public boolean isLcd() {
	return lcd;
}




public void setLcd(boolean lcd) {
	this.lcd = lcd;
}




public boolean isLaptop() {
	return laptop;
}




public void setLaptop(boolean laptop) {
	this.laptop = laptop;
}




public boolean isProjector() {
	return projector;
}




public void setProjector(boolean projector) {
	this.projector = projector;
}




public boolean isPrinter() {
	return printer;
}




public void setPrinter(boolean printer) {
	this.printer = printer;
}




public boolean isPhotoCopier() {
	return photoCopier;
}




public void setPhotoCopier(boolean photoCopier) {
	this.photoCopier = photoCopier;
}




public boolean isWhiteBoard() {
	return whiteBoard;
}




public void setWhiteBoard(boolean whiteBoard) {
	this.whiteBoard = whiteBoard;
}




public boolean isPowerBackup() {
	return powerBackup;
}




public void setPowerBackup(boolean powerBackup) {
	this.powerBackup = powerBackup;
}




public boolean isTrTool() {
	return trTool;
}




public void setTrTool(boolean trTool) {
	this.trTool = trTool;
}




public boolean isInternetFacility() {
	return internetFacility;
}




public void setInternetFacility(boolean internetFacility) {
	this.internetFacility = internetFacility;
}




public boolean isLight() {
	return light;
}




public void setLight(boolean light) {
	this.light = light;
}




public boolean isSound() {
	return sound;
}




public void setSound(boolean sound) {
	this.sound = sound;
}




public boolean isAc() {
	return ac;
}




public void setAc(boolean ac) {
	this.ac = ac;
}




public String getLastYearTrainings() {
	return lastYearTrainings;
}




public void setLastYearTrainings(String lastYearTrainings) {
	this.lastYearTrainings = lastYearTrainings;
}




public String getLastYearParticipants() {
	return lastYearParticipants;
}




public void setLastYearParticipants(String lastYearParticipants) {
	this.lastYearParticipants = lastYearParticipants;
}





public String getNoOfHall() {
	return noOfHall;
}




public void setNoOfHall(String noOfHall) {
	this.noOfHall = noOfHall;
}




public String getPerHall() {
	return perHall;
}




public void setPerHall(String perHall) {
	this.perHall = perHall;
}




public String getHostelRooms() {
	return hostelRooms;
}




public void setHostelRooms(String hostelRooms) {
	this.hostelRooms = hostelRooms;
}


	
	
	public boolean isFssaiLab() {
	return fssaiLab;
}




public void setFssaiLab(boolean fssaiLab) {
	this.fssaiLab = fssaiLab;
}




public boolean isTransport() {
	return transport;
}




public void setTransport(boolean transport) {
	this.transport = transport;
}




public boolean isConHall() {
	return conHall;
}




public void setConHall(boolean conHall) {
	this.conHall = conHall;
}




public boolean isMess() {
	return mess;
}




public void setMess(boolean mess) {
	this.mess = mess;
}




public boolean isPowerHostel() {
	return powerHostel;
}




public void setPowerHostel(boolean powerHostel) {
	this.powerHostel = powerHostel;
}




public boolean isHostel() {
	return hostel;
}




public void setHostel(boolean hostel) {
	this.hostel = hostel;
}




	@Override
	public String toString() {
		return trainingCenterName;
	}

}
