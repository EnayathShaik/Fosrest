package com.ir.form;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

public class FotestAssessmentQuestionsForm {



	private int id;
	private String optionOne;
	private String optionTwo;
	private String optionThree;
	private String optionFour;
	private String optionFive;
	private String optionSix;

	private int correctAnswer;
	private int courseNameSearch;
	
	private String trainingName;
	private String assessmentType;

	int questionNumber;
	private String questionTitle;
	public String getTrainingName() {
		return trainingName;
	}
	public void setTrainingName(String trainingName) {
		this.trainingName = trainingName;
	}
	public String getAssessmentType() {
		return assessmentType;
	}
	public void setAssessmentType(String assesmentType) {
		this.assessmentType = assesmentType;
	}
	public int getQuestionNumber() {
		return questionNumber;
	}
	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionHint() {
		return questionHint;
	}
	public void setQuestionHint(String questionHint) {
		this.questionHint = questionHint;
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
	public int getCourseNameSearch() {
		return courseNameSearch;
	}
	public void setCourseNameSearch(int courseNameSearch) {
		this.courseNameSearch = courseNameSearch;
	}
	private String questionHint;
	private int noOfOption;

	
	
}
	

