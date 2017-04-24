package com.ir.form;

public class GetScoreCardForm {
	
	private int id;
	private String trainingType;
	private String trainingPhase;
	private String trainingDate;
	private String Unit;
	private Double Score;
	private String trainingTopic;
	
	
	
	
	public Double getScore() {
		return Score;
	}
	public void setScore(Double score) {
		Score = score;
	}
	public String getTrainingTopic() {
		return trainingTopic;
	}
	public void setTrainingTopic(String trainingTopic) {
		this.trainingTopic = trainingTopic;
	}
	public String getUnit() {
		return Unit;
	}
	public void setUnit(String unit) {
		Unit = unit;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTrainingType() {
		return trainingType;
	}
	public void setTrainingType(String trainingType) {
		this.trainingType = trainingType;
	}
	public String getTrainingPhase() {
		return trainingPhase;
	}
	public void setTrainingPhase(String trainingPhase) {
		this.trainingPhase = trainingPhase;
	}
	public String getTrainingDate() {
		return trainingDate;
	}
	public void setTrainingDate(String trainingDate) {
		this.trainingDate = trainingDate;
	}
	
	

}
