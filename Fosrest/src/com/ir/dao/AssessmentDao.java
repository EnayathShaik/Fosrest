package com.ir.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import com.ir.bean.common.IntStringBean;
import com.ir.model.AssessmentAnswerCriteria;
import com.ir.model.AssessmentQuestion_old;
import com.ir.model.AssessmentQuestions;
import com.ir.model.CourseName;
import com.ir.model.CourseType;
import com.ir.model.trainee.TraineeAssessmentEvaluation;

public interface AssessmentDao {
	
	public List<AssessmentQuestions> getAssessmentQuestions(int logid, List<Integer> subIds);
	public String saveAssessment(List<AssessmentAnswerCriteria> answerCriterias);
	public List<CourseType> courseTypes();
	public List<CourseName> courseNames();
	public List<IntStringBean> getTrainingPartners(int assessorId);
	public List<AssessmentQuestions> getAssessmentAnswers(List<Integer> lst, List<Integer> questions);
	public int saveTraineeAssessmentEvaluation(TraineeAssessmentEvaluation traineeAssessmentEvaluation);
	public List<CourseType> courseTypeList();
	public List searchAssessorCalendar(String data);
	public List viewAssessmentAgencyCalendar(String data);
	public List searchAssessorTraineesForResults(String data);
	public String updateTraineeAssessmentResult(String data);
	public String updateTraineeAssessmentResultOnline(Integer userID,String result,String comment);
	
	public List searchDataAssessmentAgency(String data);
	
	public List editMAA(String data);
	
	public String updateMAA(String data);
	public TraineeAssessmentEvaluation evaluate(TreeMap<Integer, Integer> questions, List<AssessmentQuestions> answers,
			List<Integer> lst,int loginIdUniuqe);
}
