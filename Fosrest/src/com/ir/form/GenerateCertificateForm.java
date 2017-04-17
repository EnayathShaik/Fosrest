package com.ir.form;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;



public class GenerateCertificateForm {
	
    private String trainingType;
    private String trainingPartner;
	private String trainingInstitute;
	private String trainingDate;
	private String traineeName;
	private String attendanceStatus;
	private String certificateStatus;
	private String generateCertificate;
	private int batchCode;
	
	private int id;
	
	
	
	public int getBatchCode() {
		return batchCode;
	}
	public void setBatchCode(int batchCode) {
		this.batchCode = batchCode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTraineeName() {
		return traineeName;
	}
	public void setTraineeName(String traineeName) {
		this.traineeName = traineeName;
	}
	public String getAttendanceStatus() {
		return attendanceStatus;
	}
	public void setAttendanceStatus(String attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}
	public String getCertificateStatus() {
		return certificateStatus;
	}
	public void setCertificateStatus(String certificateStatus) {
		this.certificateStatus = certificateStatus;
	}
	public String getGenerateCertificate() {
		return generateCertificate;
	}
	public void setGenerateCertificate(String generateCertificate) {
		this.generateCertificate = generateCertificate;
	}
	public String getTrainingType() {
		return trainingType;
	}
	public void setTrainingType(String trainingType) {
		this.trainingType = trainingType;
	}
	public String getTrainingPartner() {
		return trainingPartner;
	}
	public void setTrainingPartner(String trainingPartner) {
		this.trainingPartner = trainingPartner;
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
