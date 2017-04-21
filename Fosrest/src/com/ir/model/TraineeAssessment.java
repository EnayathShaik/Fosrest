package com.ir.model;

import java.util.List;

/** 
 * Bean for processing data for Online assessment of trainee
 * @author user
 *
 */
public class TraineeAssessment {
	
	/** Name of the course for which assessment is submitting **/

	private int moduleId;
	private List<AssessmentQuestions> listAssessmentQuestion; 
	private int totalQuestions;
	private String loginId;

	
	/**
	 * @return the listAssessmentQuestion
	 */
	public List<AssessmentQuestions> getListAssessmentQuestion() {
		return listAssessmentQuestion;
	}

	/**
	 * @param listAssessmentQuestion the listAssessmentQuestion to set
	 */
	public void setListAssessmentQuestion(List<AssessmentQuestions> listAssessmentQuestion) {
		this.listAssessmentQuestion = listAssessmentQuestion;
	}

	/**
	 * @return the totalQuestions
	 */
	public int getTotalQuestions() {
		return totalQuestions;
	}

	/**
	 * @param totalQuestions the totalQuestions to set
	 */
	public void setTotalQuestions(int totalQuestions) {
		this.totalQuestions = totalQuestions;
	}

	/**
	 * @return the loginId
	 */
	public String getLoginId() {
		return loginId;
	}

	/**
	 * @param loginId the loginId to set
	 */
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}



	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

}
