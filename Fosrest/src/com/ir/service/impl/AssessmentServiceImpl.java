package com.ir.service.impl;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.mail.Session;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ir.bean.common.IntStringBean;
import com.ir.dao.AssessmentDao;
import com.ir.model.AssessmentAnswerCriteria;
import com.ir.model.AssessmentQuestion_old;
import com.ir.model.AssessmentQuestions;
import com.ir.model.CourseName;
import com.ir.model.CourseType;
import com.ir.model.trainee.TraineeAssessmentEvaluation;
import com.ir.service.AssessmentService;

@Service("AssessmentService")
public class AssessmentServiceImpl implements AssessmentService {

	@Autowired(required=true)
	@Qualifier(value="assessmentDao")
	private AssessmentDao assessmentDao;
	@Override
	@Transactional
	public List<AssessmentQuestions> getAssessmentQuestions( List<Integer> subIds) {
//		AssessmentDaoImpl assessmentDao = new AssessmentDaoImpl();
		final List<AssessmentQuestions> listAssessmetQustions = assessmentDao.getAssessmentQuestions( subIds);
		return listAssessmetQustions;
	}
	@Override
	@Transactional
	public String saveAssessment(List<AssessmentAnswerCriteria> assessmentAnswerCriterias){
		String result = assessmentDao.saveAssessment(assessmentAnswerCriterias);
		return result;
	}
	
	@Override
	@Transactional
	public List<CourseType> courseTypes() {
		List<CourseType> courseTypeList = assessmentDao.courseTypes();
		return courseTypeList;
	}
	
	
	@Override
	@Transactional
	public List<CourseName> courseNames() {
		List<CourseName> courseNameList = assessmentDao.courseNames();
		return courseNameList;
	}
	@Override
	@Transactional
	public List<IntStringBean> getTrainingPartners(int assessorId){
		List<IntStringBean> trainingPartners = assessmentDao.getTrainingPartners(assessorId);
		return trainingPartners;
	}

	@Override
	@Transactional
	public List<AssessmentQuestions> getAssessmentAnswers(List<Integer> lst, List<Integer> questions) {
		// TODO Auto-generated method stub
		List<AssessmentQuestions> answersList = assessmentDao.getAssessmentAnswers(lst, questions);
		return answersList;
	}

	@Override
	@Transactional
	public TraineeAssessmentEvaluation evaluate(TreeMap<Integer,Integer> questions ,List<AssessmentQuestions> answers, List <Integer> lst,int loginIdUniuqe){
		TraineeAssessmentEvaluation evaluate = assessmentDao.evaluate(questions,answers,lst,loginIdUniuqe);
		return evaluate;
	}
	@Override
	@Transactional
	public int saveTraineeAssessmentEvaluation(TraineeAssessmentEvaluation traineeAssessmentEvaluation){
		int assessmentId = assessmentDao.saveTraineeAssessmentEvaluation(traineeAssessmentEvaluation);
		return assessmentId;
	}

	
	@Override
	@Transactional
	public List<CourseType> courseTypeList() {
		List<CourseType> courseTypeList = assessmentDao.courseTypeList();
		return courseTypeList;
	}
	
	//searchAssessorCalendar
	
	@Override
	@Transactional
	public List searchAssessorCalendar(String data) {
		List courseTypeList = assessmentDao.searchAssessorCalendar(data);
		return courseTypeList;
	}
	
	//viewAssessmentAgencyCalendar
	
	
	@Override
	@Transactional
	public List viewAssessmentAgencyCalendar(String data) {
		List courseTypeList = assessmentDao.viewAssessmentAgencyCalendar(data);
		return courseTypeList;
	}
	
	//searchAssessorTraineesForResults
	
	@Override
	@Transactional
	public List searchAssessorTraineesForResults(String data) {
		List courseTypeList = assessmentDao.searchAssessorTraineesForResults(data);
		return courseTypeList;
	}
	
	//updateTraineeAssessmentResult
	
	@Override
	@Transactional
	public String updateTraineeAssessmentResult(String data) {
		String courseTypeList = assessmentDao.updateTraineeAssessmentResult(data);
		return courseTypeList;
	}
	
	@Override
	@Transactional
	public String updateTraineeAssessmentResultOnline(Integer userID,String result,String comment) {
		String courseTypeList = assessmentDao.updateTraineeAssessmentResultOnline(userID,result,comment);
		return courseTypeList;
	}
	
	//searchDataAssessmentAgency
	@Override
	@Transactional
	public List searchDataAssessmentAgency(String data) {
		List courseTypeList = assessmentDao.searchDataAssessmentAgency(data);
		return courseTypeList;
	}
	
	//editMAA
	
	@Override
	@Transactional
	public List editMAA(String data) {
		List courseTypeList = assessmentDao.editMAA(data);
		return courseTypeList;
	}
	
	//updateMAA
	
	@Override
	@Transactional
	public String updateMAA(String data) {
		String courseTypeList = assessmentDao.updateMAA(data);
		return courseTypeList;
	}
}
