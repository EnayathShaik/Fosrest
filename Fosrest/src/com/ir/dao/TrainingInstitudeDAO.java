package com.ir.dao;

import java.util.List;

import com.ir.form.ChangePasswordForm;
import com.ir.form.ContactTrainee;
import com.ir.form.CourseEnrolledUserForm;
import com.ir.form.InstituteMyCalendarForm;
import com.ir.form.MarkAttendanceForm;
import com.ir.form.RegistrationFormTrainee;
import com.ir.form.TrainingRequestForm;
import com.ir.model.AdmitCardForm;
import com.ir.model.CertificateInfo;
import com.ir.model.CheckAadhar;
import com.ir.model.City;
import com.ir.model.CourseName;
import com.ir.model.CourseTrainee;
import com.ir.model.CourseType;
import com.ir.model.District;
import com.ir.model.FeedbackForm;
import com.ir.model.FeedbackMaster;
import com.ir.model.KindOfBusiness;
import com.ir.model.ManageTrainingPartner;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.State;
import com.ir.model.Title;
import com.ir.model.Utility;

public interface TrainingInstitudeDAO {
	

	public List<TrainingRequestForm> listTrainingRequest(TrainingRequestForm  s);
	public List<MarkAttendanceForm> listMarkAttendance();
	public List<InstituteMyCalendarForm> listInstituteMyCalendar();
	
/*	//Dynamic
	public List<UnitMaster> dynListTrainingType();
	
	public List<UnitMaster> dynListUserType();*/
}
