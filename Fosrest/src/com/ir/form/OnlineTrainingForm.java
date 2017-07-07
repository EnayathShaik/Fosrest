package com.ir.form;

public class OnlineTrainingForm {
	
	private String trainingType;
	private String trainingPhase;
	private String trainingDuration;
	private String trainingTopic;
	private String TopicModule;
	private String subjectName;
	private String trainingstartdate;
	private String trainingenddate;
	private String designation;
	
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getTrainingstartdate() {
		return trainingstartdate;
	}
	public void setTrainingstartdate(String trainingstartdate) {
		this.trainingstartdate = trainingstartdate;
	}
	public String getTrainingenddate() {
		return trainingenddate;
	}
	public void setTrainingenddate(String trainingenddate) {
		this.trainingenddate = trainingenddate;
	}
	
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getTopicModule() {
		return TopicModule;
	}
	public void setTopicModule(String topicModule) {
		TopicModule = topicModule;
	}
	public String getTrainingTopic() {
		return trainingTopic;
	}
	public void setTrainingTopic(String trainingTopic) {
		this.trainingTopic = trainingTopic;
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
	public String getTrainingDuration() {
		return trainingDuration;
	}
	public void setTrainingDuration(String trainingDuration) {
		this.trainingDuration = trainingDuration;
	}
	/*@Override
	public String toString() {
		return  trainingType  + trainingPhase ;
	}*/
	@Override
	public String toString() {
		return trainingType + trainingPhase
			 + trainingstartdate + trainingenddate ;
	}
	
	
	
	
}
