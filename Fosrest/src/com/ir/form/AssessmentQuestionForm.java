package com.ir.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class AssessmentQuestionForm {

	private int unitCode,moduleCode;
	
	int questionNumber;
	@NotNull @Size(min=0 , max = 500 , message="Please enter question")
	private String questionTitle;
	@NotNull @Size(min=0 , max = 500 , message="Please enter question hint")
	private String questionHint;
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


	


	public int getCourseNameSearch() {
		return courseNameSearch;
	}

	public void setCourseNameSearch(int courseNameSearch) {
		this.courseNameSearch = courseNameSearch;
	}


	
	public int getQuestionNumber() {
		return questionNumber;
	}

	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}

	

	private int courseNameSearch;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

public int getUnitCode() {
		return unitCode;
	}

	public void setUnitCode(int unitCode) {
		this.unitCode = unitCode;
	}

	public int getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(int moduleCode) {
		this.moduleCode = moduleCode;
	}

	/*	
	public String toString(){
		return unitCode;
	}
*/
	public int getNoOfOption() {
		return noOfOption;
	}

	public void setNoOfOption(int noOfOption) {
		this.noOfOption = noOfOption;
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

	public int getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(int correctAnswer) {
		this.correctAnswer = correctAnswer;
	}


	
	
}
