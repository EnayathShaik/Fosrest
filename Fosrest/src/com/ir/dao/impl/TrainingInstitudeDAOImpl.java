package com.ir.dao.impl;

import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ir.constantes.Constantes;
import com.ir.constantes.TableLink;
import com.ir.dao.AdminDAO;
import com.ir.dao.TraineeDAO;
import com.ir.dao.TrainerDAO;
import com.ir.dao.TrainingInstitudeDAO;
import com.ir.form.ChangePasswordForm;
import com.ir.form.ContactTrainee;
import com.ir.form.CourseEnrolledUserForm;
import com.ir.form.RegistrationFormTrainee;
import com.ir.model.AdmitCardForm;
import com.ir.model.CertificateInfo;
import com.ir.model.CheckAadhar;
import com.ir.model.City;
import com.ir.model.ContactTraineee;
import com.ir.model.CourseEnrolledUser;
import com.ir.model.CourseName;
import com.ir.model.CourseTrainee;
import com.ir.model.CourseType;
import com.ir.model.District;
import com.ir.model.FeedbackForm;
import com.ir.model.FeedbackMaster;
import com.ir.model.KindOfBusiness;
import com.ir.model.LoginDetails;
import com.ir.model.ManageTrainingPartner;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.State;
import com.ir.model.Title;
import com.ir.model.TrainingCalendar;
import com.ir.model.Utility;
import com.ir.service.PageLoadService;
import com.ir.util.ChangePasswordUtility;
import com.ir.util.EncryptionPasswordANDVerification;
import com.ir.util.PasswordGenerator;
import com.ir.util.SendContectMail;
import com.zentech.logger.ZLogger;

@Service
public class TrainingInstitudeDAOImpl implements TrainingInstitudeDAO {

	@Autowired
	@Qualifier("sessionFactory")
	public SessionFactory sessionFactory;

	@Autowired
	@Qualifier("changePasswordUtility")
	public ChangePasswordUtility changePasswordUtility;
	
	@Autowired
	@Qualifier("pageLoadService")
	PageLoadService pageLoadService;

	
	
}
