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
@Table(name="nomineetrainee")
public class NomineeTrainee {

	
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "id_Sequence")
	@SequenceGenerator(name = "id_Sequence", sequenceName = "NOMINEETRAINEE_SEQ", allocationSize=1, initialValue=1)
	private int id;
	

	
	private int loginDetails;
	
	private int rollSeqNo;
	private String rollNo;
	private String status;
	private String traineeName;
	private int trainingscheduleid;
	@Column(columnDefinition="varchar(1) default 'N'")
	private String certificateStatus;
	private int score;
	
	private String certificateID;
	
	@Column(columnDefinition="int default 0")
	private int certificateSeqNo; 
	private String issueDate;
	
	

	public String getCertificateID() {
		return certificateID;
	}
	public void setCertificateID(String certificateID) {
		this.certificateID = certificateID;
	}
	public int getCertificateSeqNo() {
		return certificateSeqNo;
	}
	public void setCertificateSeqNo(int certificateSeqNo) {
		this.certificateSeqNo = certificateSeqNo;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getCertificateStatus() {
		return certificateStatus;
	}
	public void setCertificateStatus(String certificateStatus) {
		this.certificateStatus = certificateStatus;
	}
	public int getLoginDetails() {
		return loginDetails;
	}
	public void setLoginDetails(int loginDetails) {
		this.loginDetails = loginDetails;
	}
	public int getRollSeqNo() {
		return rollSeqNo;
	}
	public void setRollSeqNo(int rollSeqNo) {
		this.rollSeqNo = rollSeqNo;
	}

	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTraineeName() {
		return traineeName;
	}
	public void setTraineeName(String traineeName) {
		this.traineeName = traineeName;
	}
	public int getTrainingscheduleid() {
		return trainingscheduleid;
	}
	public void setTrainingscheduleid(int trainingscheduleid) {
		this.trainingscheduleid = trainingscheduleid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
	
	
	
}
