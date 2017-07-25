package com.ir.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.ir.dao.TrainerDAO;
import com.ir.form.NominateTraineeForm;
import com.ir.form.TrainerRequestForm;
import com.ir.form.UploadAssessmentForm;
//import com.ir.model.ModuleMaster;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.StateAdmin;
import com.ir.model.TrainingCalendar;
import com.ir.model.ViewResult;
import com.ir.service.PageLoadService;
import com.ir.util.ChangePasswordUtility;

@Service
public class TrainerDAOImpl implements TrainerDAO {

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
	public List<TrainerRequestForm> listTrainerRequest(TrainerRequestForm s) {
		// TODO Auto-generated method stub
		System.out.println("inside listTrainingRequestForm");
		TrainerRequestForm bean;
		List<TrainerRequestForm> list = new ArrayList<TrainerRequestForm>();
		Session session = this.sessionFactory.getCurrentSession();

		List<Object[]> lst = session.createSQLQuery(" select *  from trainingschedule ts where ts.trainingtype = '"+ s.getTrainingType() + "'and ts.usertype='"+ s.getUserType() + "'and ts.traininginstitudestatus='"+ s.getStatus() + "'").list();

		for (Object[] li : lst) {
			bean = new TrainerRequestForm();
			bean.setId((int) li[0]);
			bean.setTrainingType((String) li[16]);
			bean.setUserType((String) (li[20]));
			bean.setTrainingStartDate((String) li[15]);
			bean.setTrainingEndDate((String) li[10]);
		bean.setStatus((String) li[12]);
			list.add(bean);
		}
		System.out.println("list " + list);
		return list;
	}

	@Override
	public List<TrainingCalendar> listBatchCodeListforTrainer(int trainerId) {
		// TODO Auto-generated method stub
		System.out.println("inside listBatchCodeListforTrainer wo parameter");
		Session session = this.sessionFactory.getCurrentSession();
		List<TrainingCalendar> mccList = session
				.createSQLQuery("select distinct tc.batchCode,tc.trainingCalendarId from TrainingCalendar tc inner join TrainingCalendarMapping tcm on tc.batchCode=tcm.batchCode where trainerId='"+trainerId+"'and coalesce(tc.trainingPhase,'') <> '3'").list();
				return mccList;
	}

	@Override
	public List<UploadAssessmentForm> listofTrainer(int trainerId, String batchCode) {
		System.out.println("inside listEligibleuser" );
		Session session = this.sessionFactory.getCurrentSession();
		List<UploadAssessmentForm> uas =new ArrayList<UploadAssessmentForm>();
		Query query=session.createSQLQuery("select pit.firstName,pit.loginDetails from viewResult vr inner join PersonalInformationTrainee pit on vr.traineeId=pit.logindetails where vr.marks<0 and vr.trainerid='"+trainerId+"'");
		uas = query.list();
		System.out.println(uas);
		return uas; 

	}

	@Override
	public String uploadinfo(String data, int trainerId) {
		
			// TODO Auto-generated method stub
		System.out.println("Inside upload info");
			Session session = this.sessionFactory.getCurrentSession();
			String[] arrData = data.split("-");
			int loginId = Integer.parseInt(arrData[0]);
			int marks = Integer.parseInt(arrData[1]);
			String subject =arrData[2];
			String batchCode=arrData[3];
			String sql;
			sql = "update ViewResult set marks = '"+marks+"' where  trainingcalendarId='"+batchCode+"' and subject='"+subject+"'and traineeId='"+loginId+"'and status='I'";
			Query query = session.createSQLQuery(sql);
			query.executeUpdate();
			/*String sql2;
			sql2 = "update NomineeTrainee set assignedByTrainer = '"+trainerId+"' where  trainingCalendarId='"+batchCode+"'and logindetails='"+loginId+"'";
			Query query2 = session.createSQLQuery(sql2);
			query2.executeUpdate();*/
			return null;
}


	@Override
	public List<UploadAssessmentForm> listofSubjects(int trainerId, String batchCode) {
		System.out.println("inside listofSubjects" );
		Session session = this.sessionFactory.getCurrentSession();
		List<UploadAssessmentForm> uas =new ArrayList<UploadAssessmentForm>();
		//Query query=session.createSQLQuery("select distinct mm.subjectName,mm.subjectId from nomineetrainee nt inner join trainingcalendar tc on (nt.trainingcalendarid =tc.trainingcalendarid ) inner join trainingcalendarmapping tcmap on (tc.batchcode = tcmap.batchcode) inner join subjectmaster mm on (tcmap.subjectId=mm.subjectId) where tcmap.trainerid='"+trainerId+"'and  tc.batchCode='"+batchCode+"'and nt.score=0");
		Query query=session.createSQLQuery("select distinct mm.subjectName,mm.subjectId from NomineeTrainee nt inner join trainingcalendar tc on (nt.trainingcalendarid =tc.trainingcalendarid ) inner join trainingcalendarmapping tcmap on (tc.batchcode = tcmap.batchcode) inner join subjectmaster mm on (tcmap.subjectId=mm.subjectId) where tcmap.trainerid='"+trainerId+"'and  tc.trainingCalendarId='"+batchCode+"'and nt.score=0");
		uas = query.list();
		System.out.println(uas);
		return uas; 

	
	}

	@Override
	public List getTrainingStartDate(String data) {
		String arr[]=data.split("-");
		String des=arr[0];
		String ttype=arr[1];
		String tphase=arr[2];
		String trainingInstitute=arr[3];
		Session session = sessionFactory.getCurrentSession();
		String sql="select tc.trainingCalendarId,tc.trainingStartDate from TrainingCalendar tc inner join personalinformationtraininginstitute pit on pit.id=cast(tc.traininginstitute as numeric) where coalesce(isactive,'') <> 'I' and trainingType='"+ttype+"' and trainingPhase='"+tphase+"'and designation='"+des+"' and tc.trainingInstitute='"+trainingInstitute+"' and to_date(tc.trainingstartdate, 'DD/MM/YYYY') > current_date";
		Query query = session.createSQLQuery(sql);
		List batchCodeList = query.list();
		return batchCodeList;
	}
	
	
/*	@Override
	public List<MyCalendarForm> listMyCalendar() {
		// TODO Auto-generated method stub
		System.out.println("inside listMyCalendarForm");
		MyCalendarForm bean = new MyCalendarForm();
		List<MyCalendarForm> list = new ArrayList<MyCalendarForm>();
		Session session = this.sessionFactory.getCurrentSession();
		List<Object[]> lst = session
				.createSQLQuery(
						"select cast('1' as int) as id , cast('Induction' as varchar(20)) as trainingType ,cast('FSO' as varchar(20)) as userType  ,cast('26-03-2017' as varchar(40)) as trainingDate,cast('1' as varchar(20)) as unit,cast('Basic' as varchar(20)) as module,cast('12:00 AM' as varchar(20)) as startTime,cast('2:00 PM' as varchar(20)) as endTime, cast('Goa FDA' as varchar(20)) as centerDetails ,cast('completed' as varchar(20)) as status")
				.list();
		for (Object[] li : lst) {
			bean.setId((int) li[0]);
			bean.setTrainingType((String) li[1]);
			bean.setUserType((String) (li[2]));
			bean.setTrainingDate((String) li[3]);
			bean.setUnit((String) li[4]);
			bean.setModule((String) li[5]);
			bean.setStartTime((String) li[6]);
			bean.setEndTime((String) li[7]);
			bean.setCenterDetails((String) li[8]);
			bean.setStatus((String) li[9]);

			list.add(bean);
		}
		System.out.println("list " + list);
		return list;
	}
*/
	/*
	 * // listTrainingType
	 * 
	 * @Override public List<UnitMaster> listTrainingType() { // TODO
	 * Auto-generated method stub System.out.println("inside listTrainingType");
	 * Session session = this.sessionFactory.getCurrentSession();
	 * List<UnitMaster> mccList = session.createQuery("from UnitMaster").list();
	 * for (UnitMaster p : mccList) { System.out.println("unitmaster List::" +
	 * p); } return mccList; } // listUserType
	 * 
	 * @Override public List<UnitMaster> listUserType() { // TODO Auto-generated
	 * method stub System.out.println("inside listUserType"); Session session =
	 * this.sessionFactory.getCurrentSession(); List<UnitMaster> mccList =
	 * session.createQuery("from UnitMaster").list(); for (UnitMaster p :
	 * mccList) { System.out.println("unitmaster List::" + p); } return mccList;
	 * }
	 * 
	 * // listStatusType
	 * 
	 * @Override public List<UnitMaster> listStatusType() { // TODO
	 * Auto-generated method stub System.out.println("inside listStatusType");
	 * Session session = this.sessionFactory.getCurrentSession();
	 * List<UnitMaster> mccList = session.createQuery("from UnitMaster").list();
	 * for (UnitMaster p : mccList) { System.out.println("unitmaster List::" +
	 * p); } return mccList; }
	 */

}
