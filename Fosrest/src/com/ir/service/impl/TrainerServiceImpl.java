package com.ir.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.ir.dao.TrainerDAO;
import com.ir.form.TrainerRequestForm;

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
	
	/*@Override
	@Transactional
	public List<MyCalendarForm> listMyCalendar() {
		// TODO Auto-generated method stub
		return this.trainerDAO.listMyCalendar();
	}*/

}
