package com.ir.form.common;

import java.util.List;

public class AssessmentEvaluationForm {

	/**Course name for which the assessment has been processing */
	//public int moduleId;
	private List<Integer> moduleId;
	/**List of questions id */
	public List<Integer> assessmentQuestionsList;


	public List<Integer> getModuleId() {
		return moduleId;
	}

	public void setModuleId(List<Integer> moduleId) {
		this.moduleId = moduleId;
	}

	/**
	 * @return the assessmentQuestionsList
	 */
	public List<Integer> getAssessmentQuestionsList() {
		return assessmentQuestionsList;
	}

	/**
	 * @param assessmentQuestionsList the assessmentQuestionsList to set
	 */
	public void setAssessmentQuestionsList(List<Integer> assessmentQuestionsList) {
		this.assessmentQuestionsList = assessmentQuestionsList;
	}
	
}
