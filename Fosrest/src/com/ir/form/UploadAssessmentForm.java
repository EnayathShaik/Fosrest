package com.ir.form;

public class UploadAssessmentForm {
private String batchCode;
private int trainingCalendarId;
private int logindetails;
private String subject;
private int  rollno;

public int getRollno() {
	return rollno;
}
public void setRollno(int rollno) {
	this.rollno = rollno;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public int getLogindetails() {
	return logindetails;
}
public void setLogindetails(int logindetails) {
	this.logindetails = logindetails;
}
private String traineeName;
private double marks;
private String result;

public double getMarks() {
	return marks;
}
public void setMarks(double marks) {
	this.marks = marks;
}

public String getResult() {
	return result;
}
public void setResult(String result) {
	this.result = result;
}
public String getTraineeName() {
	return traineeName;
}
public void setTraineeName(String traineeName) {
	this.traineeName = traineeName;
}

public String getBatchCode() {
	return batchCode;
}
public void setBatchCode(String batchCode) {
	this.batchCode = batchCode;
}
public int getTrainingCalendarId() {
	return trainingCalendarId;
}
public void setTrainingCalendarId(int trainingCalendarId) {
	this.trainingCalendarId = trainingCalendarId;
}
}
