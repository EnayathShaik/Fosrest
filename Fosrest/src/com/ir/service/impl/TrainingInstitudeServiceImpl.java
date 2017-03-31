package com.ir.service.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ir.dao.TrainerDAO;


import com.ir.dao.TrainingInstitudeDAO;
import com.ir.service.TrainerService;
@Service
public class TrainingInstitudeServiceImpl implements TrainerService {

	@Autowired
	@Qualifier("trainingInstitudeDAO")
	public TrainingInstitudeDAO trainingInstitudeDAO;
	
	

}
