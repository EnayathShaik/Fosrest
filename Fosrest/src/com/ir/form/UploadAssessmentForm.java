package com.ir.form;

public class UploadAssessmentForm {
private String BatchCode;
private int trainingCalendarId;
private String traineeName;
private double marks;
private String Result;

public double getMarks() {
	return marks;
}
public void setMarks(double marks) {
	this.marks = marks;
}
public String getResult() {
	return Result;
}
public void setResult(String result) {
	Result = result;
}
public String getTraineeName() {
	return traineeName;
}
public void setTraineeName(String traineeName) {
	this.traineeName = traineeName;
}
public String getBatchCode() {
	return BatchCode;
}
public void setBatchCode(String batchCode) {
	BatchCode = batchCode;
}
public int getTrainingCalendarId() {
	return trainingCalendarId;
}
public void setTrainingCalendarId(int trainingCalendarId) {
	this.trainingCalendarId = trainingCalendarId;
}
}
