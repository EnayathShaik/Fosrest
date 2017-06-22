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
	
	private int assessmentQuestionId;
	
	/*@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="UnitMaster")
	private UnitMaster unitCode;
	
	*/@OneToOne (cascade=CascadeType.ALL)  @JoinColumn(name="ModuleMaster")
	private ModuleMaster moduleCode;
	
	private int questionNumber;
	private String questionTitle;
	//private String questionHint;
	private int noOfOption;

	private int designationId;
	private int trainingTypeId;
	private int trainingPhaseId;
	private String optionOne;
	private String optionTwo;
	private String optionThree;
	private String optionFour;
	private String optionFive;
	private String optionSix;
	private String assessmentType;
	
	private int correctAnswer;


	@Column(name="isActive", columnDefinition="character varying(10) default 'Y'")
	private String isActive;
	
	public int getDesignationId() {
	return designationId;
}
public void setDesignationId(int designationId) {
	this.designationId = designationId;
}
public int getTrainingTypeId() {
	return trainingTypeId;
}
public void setTrainingTypeId(int trainingTypeId) {
	this.trainingTypeId = trainingTypeId;
}
public int getTrainingPhaseId() {
	return trainingPhaseId;
}
public void setTrainingPhaseId(int trainingPhaseId) {
	this.trainingPhaseId = trainingPhaseId;
}

	
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	
	
	public ModuleMaster getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(ModuleMaster moduleCode) {
		this.moduleCode = moduleCode;
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


	public int getAssessmentQuestionId() {
		return assessmentQuestionId;
	}
	public void setAssessmentQuestionId(int assessmentQuestionId) {
		this.assessmentQuestionId = assessmentQuestionId;
	}
	public String getAssessmentType() {
		return assessmentType;
	}

	public void setAssessmentType(String assessmentType) {
		this.assessmentType = assessmentType;
	}
	
	
	
}
