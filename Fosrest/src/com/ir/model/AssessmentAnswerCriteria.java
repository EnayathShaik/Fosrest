package com.ir.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="assessmentanswers")
public class AssessmentAnswerCriteria {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name= "assessmentAnswersId")
	private int assessmentAnswersId;
	
	private int subjectId;
	private int questionId;
	private int questionNumber;
	private int selectedAnswer;
	
	
	
	public int getAssessmentAnswersId() {
		return assessmentAnswersId;
	}
	public void setAssessmentAnswersId(int assessmentAnswersId) {
		this.assessmentAnswersId = assessmentAnswersId;
	}
	@Override
	public String toString() {
		return "AssessmentAnswerCriteria [subjectId=" + subjectId + ", questionId=" + questionId + ", questionNumber="
				+ questionNumber + ", selectedAnswer=" + selectedAnswer + ", loginId=" + loginId + "]";
	}
	private int loginId;
	

	
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
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
