package com.ir.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.ir.model.trainee.TraineeAssessmentEvaluation;

@Entity
@Table (name="OnlineAssessmentSubjectsScore")
public class OnlineAssessmentSubjectsScore {

	@Id
		@GeneratedValue(strategy=GenerationType.SEQUENCE)
		private int subjectScoreid;
	
	private int subjectId;
	private double subjectScore;
	
	
	private int assessmentResultId;

	public int getSubjectScoreid() {
		return subjectScoreid;
	}

	public void setSubjectScoreid(int subjectScoreid) {
		this.subjectScoreid = subjectScoreid;
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public double getSubjectScore() {
		return subjectScore;
	}

	public void setSubjectScore(double subjectScore) {
		this.subjectScore = subjectScore;
	}

	public int getAssessmentResultId() {
		return assessmentResultId;
	}

	public void setAssessmentResultId(int assessmentResultId) {
		this.assessmentResultId = assessmentResultId;
	}
	
}
