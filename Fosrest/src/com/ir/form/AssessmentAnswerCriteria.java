package com.ir.form;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="assessmentanswers")
public class AssessmentAnswerCriteria {
	
	private int moduleId;
	private int questionId;
	private int questionNumber;
	private int selectedAnswer;
	private int loginId;
	

	public int getModuleId() {
		return moduleId;
	}
	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}
	/**
	 * @return the questionId
	 */
	public int getQuestionId() {
		return questionId;
	}
	/**
	 * @param questionId the questionId to set
	 */
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	/**
	 * @return the questionNumber
	 */
	public int getQuestionNumber() {
		return questionNumber;
	}
	/**
	 * @param questionNumber the questionNumber to set
	 */
	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}
	/**
	 * @return the selectedAnswer
	 */
	public int getSelectedAnswer() {
		return selectedAnswer;
	}
	/**
	 * @param selectedAnswer the selectedAnswer to set
	 */
	public void setSelectedAnswer(int selectedAnswer) {
		this.selectedAnswer = selectedAnswer;
	}
	/**
	 * @return the loginId
	 */
	public int getLoginId() {
		return loginId;
	}
	/**
	 * @param loginId the loginId to set
	 */
	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}
	
	
}
