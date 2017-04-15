package com.ir.form;

import java.util.Date;

public class TrainingRequestForm {

	
	private int srNo,noE;
	private String trainingType,userType,trainingStatus;
	private String startDate,endDate;
	private String acceptReq,cancelRej,updateHis;
	public int getSrNo() {
		return srNo;
	}
	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}
	public int getNoE() {
		return noE;
	}
	public void setNoE(int noE) {
		this.noE = noE;
	}
	public String getTrainingType() {
		return trainingType;
	}
	public void setTrainingType(String trainingType) {
		this.trainingType = trainingType;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getTrainingStatus() {
		return trainingStatus;
	}
	public void setTrainingStatus(String trainingStatus) {
		this.trainingStatus = trainingStatus;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getAcceptReq() {
		return acceptReq;
	}
	public void setAcceptReq(String acceptReq) {
		this.acceptReq = acceptReq;
	}
	public String getCancelRej() {
		return cancelRej;
	}
	public void setCancelRej(String cancelRej) {
		this.cancelRej = cancelRej;
	}
	public String getUpdateHis() {
		return updateHis;
	}
	public void setUpdateHis(String updateHis) {
		this.updateHis = updateHis;
	}
	
}
