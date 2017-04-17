package com.ir.form;

public class OnlineTrainingForm {
	
	private String trainingType;
	private String trainingPhase;
	private String trainingDuration;
	private String trainingTopic;
	private String TopicModule;
	private String moduleName;
	private String trainingstartdate;
	private String trainingenddate;
	
	
	
	
	
	
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
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
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
