package com.ir.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ir.dao.TraineeDAO;
import com.ir.dao.TrainerDAO;
import com.ir.form.ChangePasswordForm;
import com.ir.form.ContactTrainee;
import com.ir.form.CourseEnrolledUserForm;
import com.ir.form.MyCalendarForm;
import com.ir.form.RegistrationFormTrainee;
import com.ir.form.TrainerRequestForm;
import com.ir.model.AdmitCardForm;
import com.ir.model.CertificateInfo;
import com.ir.model.CheckAadhar;
import com.ir.model.CourseName;
import com.ir.model.CourseTrainee;
import com.ir.model.CourseType;
import com.ir.model.FeedbackForm;
import com.ir.model.FeedbackMaster;
import com.ir.model.ManageTrainingPartner;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.State;
import com.ir.model.Utility;
import com.ir.service.TraineeService;
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
	public List<MyCalendarForm> listMyCalendar() {
		// TODO Auto-generated method stub
		return this.trainerDAO.listMyCalendar();
	}


	/*@Override
	@Transactional
	public List<UnitMaster> listTrainingType() {
		return this.trainerDAO.listTrainingType();
	}

	@Override
	@Transactional
	public List<UnitMaster> listUserType() {
		// TODO Auto-generated method stub
		return this.trainerDAO.listUserType();
	}
	
	@Override
	@Transactional
	public List<UnitMaster> listStatusType() {
		// TODO Auto-generated method stub
		return this.trainerDAO.listStatusType();
	}*/

}
