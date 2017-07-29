package com.ir.model;

public class CertificateInfo {
	private String certificateID;
	private String name;
	private String trainingStart;
	private String trainingAddress;
	private String issueDate;
	private String trainingPartnerName;

	private String programme;
	private String trainingEnd;
	
	
	
	public String getTrainingStart() {
		return trainingStart;
	}
	public String getProgramme() {
		return programme;
	}
	public void setProgramme(String programme) {
		this.programme = programme;
	}
	public void setTrainingStart(String trainingStart) {
		this.trainingStart = trainingStart;
	}
	public String getTrainingPartnerName() {
		return trainingPartnerName;
	}
	public void setTrainingPartnerName(String trainingPartnerName) {
		this.trainingPartnerName = trainingPartnerName;
	}
	public String getCertificateID() {
		return certificateID;
	}
	public void setCertificateID(String certificateID) {
		this.certificateID = certificateID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getTrainingEnd() {
		return trainingEnd;
	}
	public void setTrainingEnd(String trainingEnd) {
		this.trainingEnd = trainingEnd;
	}
	public String getTrainingAddress() {
		return trainingAddress;
	}
	public void setTrainingAddress(String trainingAddress) {
		this.trainingAddress = trainingAddress;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

}
