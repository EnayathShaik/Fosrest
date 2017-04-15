package com.ir.service.impl;



import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ir.dao.TrainerDAO;


import com.ir.dao.TrainingInstitudeDAO;
import com.ir.form.InstituteMyCalendarForm;
import com.ir.form.MarkAttendanceForm;
import com.ir.form.TrainingRequestForm;
import com.ir.service.TrainerService;
import com.ir.form.MyCalendarForm;
import com.ir.form.TrainerRequestForm;

@Service
public class TrainingInstitudeServiceImpl implements TrainingInstitudeDAO {

	@Autowired
	@Qualifier("trainingInstitudeDAO")
	public TrainingInstitudeDAO trainingInstitudeDAO;

	
/*
	@Override
	public List<MyCalendarForm> listMyCalendar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TrainerRequestForm> listTrainerRequest(TrainerRequestForm s) {
		// TODO Auto-generated method stub
		return null;
	}
	*/
	

	@Override
	@Transactional
	public List<TrainingRequestForm> listTrainingRequest(TrainingRequestForm s) {
		// TODO Auto-generated method stub
		return this.trainingInstitudeDAO.listTrainingRequest(s);
	}

	@Override
	@Transactional
	public List<MarkAttendanceForm> listMarkAttendance() {
		// TODO Auto-generated method stub
		return this.trainingInstitudeDAO.listMarkAttendance();
	}

	@Override
	@Transactional
	public List<InstituteMyCalendarForm> listInstituteMyCalendar() {
		// TODO Auto-generated method stub
		return this.trainingInstitudeDAO.listInstituteMyCalendar();
	}
	/*	
	@Override
	@Transactional
	public List<UnitMaster> dynListTrainingType() {
		// TODO Auto-generated method stub
		return  this.traineeDAO.dynListTrainingType();
	}

	@Override
	@Transactional
	public List<UnitMaster> dynListUserType() {
		// TODO Auto-generated method stub
		return this.traineeDAO.dynListUserType();
	}*/
	

}
