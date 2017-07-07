package com.ir.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class AssessmentQuestionForm {

	//private int unitCode1,moduleCode1,unitCode2,moduleCode2;
	
	private int subjectCode1,subjectCode2;
	private int designation1,designation2;
	private int trainingType1,trainingType2;
	private int trainingPhase1,trainingPhase2;
	int questionNumber;
	public int getDesignation1() {
		return designation1;
	}

	public void setDesignation1(int designation1) {
		this.designation1 = designation1;
	}

	public int getDesignation2() {
		return designation2;
	}

	public void setDesignation2(int designation2) {
		this.designation2 = designation2;
	}

	public int getTrainingType1() {
		return trainingType1;
	}

	public void setTrainingType1(int trainingType1) {
		this.trainingType1 = trainingType1;
	}

	public int getTrainingType2() {
		return trainingType2;
	}

	public void setTrainingType2(int trainingType2) {
		this.trainingType2 = trainingType2;
	}

	public int getTrainingPhase1() {
		return trainingPhase1;
	}

	public void setTrainingPhase1(int trainingPhase1) {
		this.trainingPhase1 = trainingPhase1;
	}

	public int getTrainingPhase2() {
		return trainingPhase2;
	}

	public void setTrainingPhase2(int trainingPhase2) {
		this.trainingPhase2 = trainingPhase2;
	}

	@NotNull @Size(min=0 , max = 500 , message="Please enter question")
	private String questionTitle;
	/*@NotNull @Size(min=0 , max = 500 , message="Please enter question hint")
	private String questionHint;*/
	@NotNull
	private int noOfOption;

	
	private int id;
	
	@NotNull @Size(min=1 , max = 100 , message="Please enter option One")
	private String optionOne;
	private String optionTwo;
	private String optionThree;
	private String optionFour;
	private String optionFive;
	private String optionSix;
	
	@NotNull
	private int correctAnswer;

	


	public int getSubjectCode1() {
		return subjectCode1;
	}

	public void setSubjectCode1(int subjectCode1) {
		this.subjectCode1 = subjectCode1;
	}

	public int getSubjectCode2() {
		return subjectCode2;
	}

	public void setSubjectCode2(int subjectCode2) {
		this.subjectCode2 = subjectCode2;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}


	public int getQuestionNumber() {
		return questionNumber;
	}

	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}

	public int getNoOfOption() {
		return noOfOption;
	}

	public void setNoOfOption(int noOfOption) {
		this.noOfOption = noOfOption;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOptionOne() {
		return optionOne;
	}

	public void setOptionOne(String optionOne) {
		this.optionOne = optionOne;
	}

	public String getOptionTwo() {
		return optionTwo;
	}

	public void setOptionTwo(String optionTwo) {
		this.optionTwo = optionTwo;
	}

	public String getOptionThree() {
		return optionThree;
	}

	public void setOptionThree(String optionThree) {
		this.optionThree = optionThree;
	}

	public String getOptionFour() {
		return optionFour;
	}

	public void setOptionFour(String optionFour) {
		this.optionFour = optionFour;
	}

	public String getOptionFive() {
		return optionFive;
	}

	public void setOptionFive(String optionFive) {
		this.optionFive = optionFive;
	}

	public String getOptionSix() {
		return optionSix;
	}

	public void setOptionSix(String optionSix) {
		this.optionSix = optionSix;
	}

	public int getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(int correctAnswer) {
		this.correctAnswer = correctAnswer;
	}
	
	


	
	
}
