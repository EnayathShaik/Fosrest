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
import com.ir.form.InstituteMyCalendarForm;
import com.ir.form.MarkAttendanceForm;
import com.ir.form.RegistrationFormTrainee;
import com.ir.form.TrainingRequestForm;
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
import com.ir.model.UnitMaster;
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

	

	@Override
	public List<TrainingRequestForm> listTrainingRequest(TrainingRequestForm s) {
		System.out.println("inside listTrainRequest");
		TrainingRequestForm bean;
		List<TrainingRequestForm> list = new ArrayList<TrainingRequestForm>();
		Session session = this.sessionFactory.getCurrentSession();

		//String tDate=s.getTrainingDate().substring(0, 9);
		
//System.out.println("in instituteDAO "+s.getTrainingDate());
	//	List<Object[]> lst = session.createSQLQuery("select cast('1' as int) as srNo, cast('Refresher' as varchar(20)) as trainingType ,cast('type' as varchar(40)) as userType,cast('26-03-2017' as varchar(40)) as startDate,cast('26-03-2017' as varchar(40)) as endDate,cast('12' as int) as noE,cast('tanstat' as varchar(20)) as trainingStatus, cast('uphis' as varchar(20)) as updateHis").list();
List<Object[]> mccList  = session.createSQLQuery("select * from trainingschedule where trainingtype like '"+s.getTrainingType()+"' and usertype ='"+s.getUserType()+"' and traininginstitudestatus='"+s.getTrainingStatus()+"' and cast(trainingenddate as varchar(100) ) ='"+s.getEndDate()+"' and cast(trainingstartdate as varchar(100))='"+s.getStartDate()+"'") .list();	
//List<Object[]> mccList  = session.createSQLQuery("select * from trainingschedule where trainingtype like '"+s.getTrainingType()+"' and usertype ='"+s.getUserType()+"' and traininginstitudestatus='"+s.getTrainingStatus()+"'") .list();
for (Object[] li : mccList ) { 
	 bean= new TrainingRequestForm();
			
			bean.setTrainingType((String) li[16]);
			bean.setUserType((String) li[20]);

			bean.setStartDate((String) li[15]);
			bean.setEndDate((String) li[10]);
			
			bean.setTrainingStatus((String) li[12]);
			System.out.println(bean);
			list.add(bean);
		}
System.out.println("list "+list);
		return list;
	}

	@Override
	public List<MarkAttendanceForm> listMarkAttendance() {
		// TODO Auto-generated method stub
		System.out.println("inside listMarkAttendance");
		MarkAttendanceForm bean = new MarkAttendanceForm();
		List<MarkAttendanceForm> list = new ArrayList<MarkAttendanceForm>();
		System.out.println("csss" +sessionFactory.getCurrentSession());
		Session session = sessionFactory.getCurrentSession();
		System.out.println("csss ");
		//List<Object[]> lst = session.createSQLQuery("select cast('Refresher' as varchar(20)) as trainingType ,cast('26-03-2017' as varchar(40)) as trainingDate, cast('Adlab' as varchar(20)) as trainingPartner , cast('Adlab' as varchar(20) ) as trainingInstitute,cast('Mr.Anuj' as varchar(40)) as traineeName,cast('pending' as varchar(40)) as attendanceStatus,cast('pending' as varchar(40)) as certificateStatus,cast('pending' as varchar(40)) as generateCertificate").list();

		List<Object[]> lst = session.createSQLQuery("select cast('1' as int) as srNo, cast('Refresher' as varchar(20)) as trainingType ,cast('type' as varchar(40)) as userType,cast('26-03-2017' as varchar(40)) as trainingDate,cast('12:09' as varchar(40)) as startTime,cast('partName' as varchar(20)) as participantName").list();//, cast('7t5875858' as varchar(20)) as aadharNo,cast('uphis' as varchar(20)) as attendance")
		for (Object[] li : lst ) { 
			
			System.out.println(li[0].toString()+li[2]+li[3]);
			bean.setSrNo((int) li[0]);
			bean.setTrainingType((String) li[1]);
			bean.setUserType((String) li[2]);
			bean.setTrainingDate((String) li[3]);
			bean.setStartTime((String) li[4]);
			bean.setParticipantName((String) li[5]);
			
			//bean.setAccept((String) li[7]);
			//bean.setCancel(cancel);
			
			list.add(bean);
		}
System.out.println("list "+list);
		return list;
	}

	@Override
	public List<InstituteMyCalendarForm> listInstituteMyCalendar() {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				System.out.println("inside listInstituteMyCalendar");
				InstituteMyCalendarForm bean = new InstituteMyCalendarForm();
				List<InstituteMyCalendarForm> list = new ArrayList<InstituteMyCalendarForm>();
				System.out.println("csss" +sessionFactory.getCurrentSession());
				Session session = sessionFactory.getCurrentSession();
				System.out.println("csss");
				//List<Object[]> lst = session.createSQLQuery("select cast('Refresher' as varchar(20)) as trainingType ,cast('26-03-2017' as varchar(40)) as trainingDate, cast('Adlab' as varchar(20)) as trainingPartner , cast('Adlab' as varchar(20) ) as trainingInstitute,cast('Mr.Anuj' as varchar(40)) as traineeName,cast('pending' as varchar(40)) as attendanceStatus,cast('pending' as varchar(40)) as certificateStatus,cast('pending' as varchar(40)) as generateCertificate").list();

				List<Object[]> lst = session.createSQLQuery("select cast('1' as int) as srNo, cast('Refresher' as varchar(20)) as trainingType ,cast('type' as varchar(40)) as userType,cast('26-03-2017' as varchar(40)) as trainingStartDate,cast('26-03-2017' as varchar(40)) as trainingEndDate,cast('1' as int) as noPart,cast('26-03-2017' as varchar(40)) as status").list();//, cast('7t5875858' as varchar(20)) as aadharNo,cast('uphis' as varchar(20)) as attendance")
				for (Object[] li : lst ) {
					
					System.out.println(li[0].toString()+li[2]+li[3]);
					bean.setSrNo((int) li[0]);
					bean.setTrainingType((String) li[1]);
					bean.setUserType((String) li[2]);
					bean.setStartDate((String) li[3]);
					bean.setEndDate((String) li[4]);
					bean.setNoParts((int) li[5]);
					bean.setStatus((String) li[6]);
					
					
					//bean.setAccept((String) li[7]);
					//bean.setCancel(cancel);
					
					list.add(bean);
				}
		//System.out.println("list "+list);
				return list;
	}

	
	/*//Dynamic
		@Override
		public List<UnitMaster> dynListTrainingType() {
			// TODO Auto-generated method stub
			System.out.println("inside dynListTrainingType");
			Session session = this.sessionFactory.getCurrentSession();
			List<UnitMaster> mccList = session.createQuery("from UnitMaster").list();
			for (UnitMaster p : mccList) {
				System.out.println("UnitMaster List::" + p);
			}
			return mccList;
		}
		

		//Dynamic
			@Override
			public List<UnitMaster> dynListUserType() {
				// TODO Auto-generated method stub
				System.out.println("inside dynListUserType");
				Session session = this.sessionFactory.getCurrentSession();
				List<UnitMaster> mccList = session.createQuery("from UnitMaster").list();
				for (UnitMaster p : mccList) {
					System.out.println("UnitMaster List::" + p);
				}
				return mccList;
			}*/
	
	
}
