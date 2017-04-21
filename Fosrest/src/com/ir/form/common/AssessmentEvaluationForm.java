package com.ir.form.common;

import java.util.List;

public class AssessmentEvaluationForm {

	/**Course name for which the assessment has been processing */
	public String moduleId;
	
	/**List of questions id */
	public List<Integer> assessmentQuestionsList;






	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
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
