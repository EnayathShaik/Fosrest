package com.ir.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ir.dao.TrainerDAO;


import com.ir.dao.TrainingInstitudeDAO;
import com.ir.form.MyCalendarForm;
import com.ir.form.TrainerRequestForm;
import com.ir.service.TrainerService;
@Service
public class TrainingInstitudeServiceImpl implements TrainerService {

	@Autowired
	@Qualifier("trainingInstitudeDAO")
	public TrainingInstitudeDAO trainingInstitudeDAO;

	

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
	
	

}
