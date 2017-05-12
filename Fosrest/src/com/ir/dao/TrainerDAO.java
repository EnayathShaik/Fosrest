package com.ir.dao;

import java.util.List;

import com.ir.form.TrainerRequestForm;

public interface TrainerDAO {
	public List<TrainerRequestForm> listTrainerRequest(TrainerRequestForm s);

	//public List<MyCalendarForm> listMyCalendar();

}
