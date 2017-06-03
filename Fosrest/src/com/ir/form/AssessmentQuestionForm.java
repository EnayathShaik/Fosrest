package com.ir.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class AssessmentQuestionForm {

	private int unitCode1,moduleCode1,unitCode2,moduleCode2;
	
	int questionNumber;
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

	public int getUnitCode1() {
		return unitCode1;
	}

	public void setUnitCode1(int unitCode1) {
		this.unitCode1 = unitCode1;
	}

	public int getModuleCode1() {
		return moduleCode1;
	}

	public void setModuleCode1(int moduleCode1) {
		this.moduleCode1 = moduleCode1;
	}

	public int getUnitCode2() {
		return unitCode2;
	}

	public void setUnitCode2(int unitCode2) {
		this.unitCode2 = unitCode2;
	}

	public int getModuleCode2() {
		return moduleCode2;
	}

	public void setModuleCode2(int moduleCode2) {
		this.moduleCode2 = moduleCode2;
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
