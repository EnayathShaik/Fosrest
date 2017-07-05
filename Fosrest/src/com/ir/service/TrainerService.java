package com.ir.service;

import java.util.List;

import com.ir.form.NominateTraineeForm;
import com.ir.form.TrainerRequestForm;
import com.ir.form.UploadAssessmentForm;
import com.ir.model.TrainingCalendar;



public interface TrainerService {
	
	public List<TrainerRequestForm> listTrainerRequest(TrainerRequestForm s);

	public List<TrainingCalendar> listBatchCodeListforTrainer(int trainerId);

	public List<UploadAssessmentForm> listofTrainer(int trainerId, String batchCode);

	public String uploadinfo(String data, int trainerId);

	public List<UploadAssessmentForm> listofSubjects(int trainerId, String batchCode);

	

	



	

	

	


	//public List<MyCalendarForm> listMyCalendar();


	
	
}
