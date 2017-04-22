package com.ir.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="assessmentQuestions")
public class AssessmentQuestions {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	
	private int assessmentId;
	
	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="UnitMaster")
	private UnitMaster unitCode;
	
	@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="ModuleMaster")
	private ModuleMaster moduleCode;
	
	private int questionNumber;
	private String questionTitle;
	private String questionHint;
	private int noOfOption;

	private String optionOne;
	private String optionTwo;
	private String optionThree;
	private String optionFour;
	private String optionFive;
	private String optionSix;
	private String assessmentType;
	
	private int correctAnswer;

	public UnitMaster getUnitCode() {
		return unitCode;
	}

	public void setUnitCode(UnitMaster unitCode) {
		this.unitCode = unitCode;
	}

	public ModuleMaster getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(ModuleMaster moduleCode) {
		this.moduleCode = moduleCode;
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


	public int getAssessmentId() {
		return assessmentId;
	}

	public void setAssessmentId(int assessmentId) {
		this.assessmentId = assessmentId;
	}

	public String getAssessmentType() {
		return assessmentType;
	}

	public void setAssessmentType(String assessmentType) {
		this.assessmentType = assessmentType;
	}
	
	
	
}
