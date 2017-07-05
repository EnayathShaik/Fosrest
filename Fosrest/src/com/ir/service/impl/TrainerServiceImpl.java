package com.ir.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.ir.dao.TrainerDAO;
import com.ir.form.NominateTraineeForm;
import com.ir.form.TrainerRequestForm;
import com.ir.form.UploadAssessmentForm;
import com.ir.model.TrainingCalendar;
import com.ir.service.TrainerService;
@Service
public class TrainerServiceImpl implements TrainerService {

	@Autowired
	@Qualifier("trainerDAO")
	public TrainerDAO trainerDAO;
	
	
	@Override
	@Transactional
	public List<TrainerRequestForm> listTrainerRequest(TrainerRequestForm s) {
		// TODO Auto-generated method stub
		return this.trainerDAO.listTrainerRequest(s);
	}


	@Override
	@Transactional
	public List<TrainingCalendar> listBatchCodeListforTrainer(int trainerId) {
		// TODO Auto-generated method stub
		return this.trainerDAO.listBatchCodeListforTrainer(trainerId);
	}


	@Override
	@Transactional
	public List<UploadAssessmentForm> listofTrainer(int trainerId, String batchCode) {
		// TODO Auto-generated method stub
		return this.trainerDAO.listofTrainer(trainerId,batchCode);
	}


	@Override
	@Transactional
	public String uploadinfo(String data, int trainerId) {
		// TODO Auto-generated method stub
		return this.trainerDAO.uploadinfo(data,trainerId);
	}

	@Override
	@Transactional
	public List<UploadAssessmentForm> listofSubjects(int trainerId, String batchCode) {
		// TODO Auto-generated method stub
		return this.trainerDAO.listofSubjects(trainerId,batchCode);
	}
	
	/*@Override
	@Transactional
	public List<MyCalendarForm> listMyCalendar() {
		// TODO Auto-generated method stub
		return this.trainerDAO.listMyCalendar();
	}*/

}
