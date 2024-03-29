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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

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
	private int trainingCalendarId;
	private int nominatedBy;
	//private int loginId;
	private int assignedByTrainer;

	/*private String trainingStartDate2;
	
	public String getTrainingStartDate2() {
		return trainingStartDate2;
	}

	public void setTrainingStartDate2(String trainingStartDate2) {
		this.trainingStartDate2 = trainingStartDate2;
	}*/

	public int getAssignedByTrainer() {
		return assignedByTrainer;
	}

	public void setAssignedByTrainer(int assignedByTrainer) {
		this.assignedByTrainer = assignedByTrainer;
	}
	public int getNominatedBy() {
		return nominatedBy;
	}
	public void setNominatedBy(int nominatedBy) {
		this.nominatedBy = nominatedBy;
	}
	public int getTrainingCalendarId() {
		return trainingCalendarId;
	}
	public void setTrainingCalendarId(int trainingCalendarId) {
		this.trainingCalendarId = trainingCalendarId;
	}


	@Column(columnDefinition="varchar(1) default 'N'")
	private String certificateStatus;
	private int score;
	
	private String certificateID;
	
	@Column(columnDefinition="int default 0")
	private int certificateSeqNo; 
	private String issueDate;
	
	private String result;
	

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

	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
}
