package com.ir.dao.impl;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.group.interceptors.TwoPhaseCommitInterceptor.MapEntry;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ir.bean.common.IntStringBean;
import com.ir.dao.AssessmentDao;
import com.ir.model.AssessmentAnswerCriteria;
import com.ir.model.AssessmentQuestion_old;
import com.ir.model.AssessmentQuestions;
import com.ir.model.CourseEnrolledUser;
import com.ir.model.CourseName;
import com.ir.model.CourseType;
import com.ir.model.NomineeTrainee;
import com.ir.model.OnlineAssessmentSubjectsScore;
import com.ir.model.trainee.TraineeAssessmentEvaluation;
import com.ir.util.HibernateUtil;
import com.zentech.logger.ZLogger;
import com.zentect.ajax.AjaxRequest;

import sun.reflect.generics.tree.Tree;
@Repository("AssessmentDao")
@Service
public class AssessmentDaoImpl implements AssessmentDao{

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	@Override
	public List<AssessmentQuestions> getAssessmentQuestions( List<Integer> subIds) {
		System.out.println("AssessmentQuestions");
		List<AssessmentQuestions> assessmentQuestions = null; 
		Session session = sessionFactory.getCurrentSession();
		String strIds=subIds.toString();
		
		strIds=strIds.replace("[", "(");
		strIds=strIds.replace("]", ")");
		System.out.println(strIds);
		try{
			Query query = session.createQuery("from AssessmentQuestions where isActive='Y' and subjectmaster in "+ strIds+" order by assessmentQuestionId");
			 assessmentQuestions = query.list();
			 //System.out.println(" assessmentQuestions "+assessmentQuestions);
		}catch(Exception e){
			e.printStackTrace();
		} 
			
	
		
		return assessmentQuestions;
	}

	public String saveAssessment(List<AssessmentAnswerCriteria> answerCriterias){
		Session session = sessionFactory.getCurrentSession();
		try{
		for(int i= 0; i<answerCriterias.size(); i++){
			session.save(answerCriterias.get(i));
		}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		}
		
		return "Success";
	}
	
	@Override
	public List<CourseType> courseTypes() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from CourseType");
		List<CourseType> courseTypeList = query.list();
		return courseTypeList;
	}
	
	
	@Override
	public List<CourseName> courseNames() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from CourseName");
		List<CourseName> courseNameList = query.list();
		return courseNameList;
	}
	@Override
	public List<IntStringBean> getTrainingPartners(int assessorId){
		Session session = sessionFactory.getCurrentSession();
		List<IntStringBean> trainingPartnerList = new ArrayList<IntStringBean>();
		String strQuery = "select pit.personalinformationtrainingpartnerid, pit.trainingcentrename "
				+ "from personalinformationassessor pia "
				+ "inner join courseenrolled ce on ce.logindetails = pia.logindetails "
				+ "inner join trainingcalendar tc on tc.coursename = ce.coursenameid "
				+ "inner join coursename cn on cn.coursenameid = tc.coursename "
				+ "inner join personalinformationtrainingpartner pit on pit.personalinformationtrainingpartnerid = tc.trainingcenter "
				+ "where pia.logindetails = "+assessorId + " "
						+ "group by pit.personalinformationtrainingpartnerid, pit.trainingcentrename";
		Query query = session.createSQLQuery(strQuery);
		//List tpList = query.list();
		List<Object[]> tpList =(List<Object[]>) query.list();
		if(tpList != null && tpList.size() >0){
			for(int i =0 ; i<tpList.size(); i++){
				
				IntStringBean tc = new IntStringBean();
				Object[] o =tpList.get(0);
				tc.setId((int)o[0]);
				tc.setValue(o[1].toString());
				trainingPartnerList.add(tc);
			}
		}
		return trainingPartnerList;
	}

	@Override
	public List<AssessmentQuestions> getAssessmentAnswers(List<Integer> subIds, List<Integer> questions) {
		Session session = sessionFactory.getCurrentSession();
		String questionIds = questions.toString();
		if(questionIds.length() >2){
			questionIds = questionIds.substring(1,questionIds.length()-1);
		}
		System.out.println(" subjectcode "+subIds);
         String strIds=subIds.toString();
		
		strIds=strIds.replace("[", "(");
		strIds=strIds.replace("]", ")");
		Query query = session.createQuery(" from AssessmentQuestions where subjectMaster in "+ strIds +" and assessmentQuestionid in ("+questionIds+")");
		List<AssessmentQuestions> listAssessmentQuestions = query.list();
		
		return listAssessmentQuestions;
	}
	@Override
	public int saveTraineeAssessmentEvaluation(TraineeAssessmentEvaluation traineeAssessmentEvaluation){
		Session session = sessionFactory.getCurrentSession();
		Integer traineeAssessmentEvaluationId = (Integer) session.save(traineeAssessmentEvaluation);
		return traineeAssessmentEvaluationId;
	}

	
	public List<Integer> getElegibilityForAssessment(Set<Integer> distinctSubjectIds){
		Session session = sessionFactory.getCurrentSession();
		System.out.println("in getElegibilityForAssessment "+distinctSubjectIds);
		String strIds=distinctSubjectIds.toString();
		
		strIds=strIds.replace("[", "(");
		strIds=strIds.replace("]", ")");
	//	String sql = "select eligibility from assessmenteligibility where subjectId="+subjectid;
		String sql = "select eligibility from subjectMaster where subjectId in "+strIds;

		Query query = session.createSQLQuery(sql);
		List<Integer> listEligibility = query.list();
		if(listEligibility.size() > 0)
		{
			for(int i:listEligibility)
			//System.out.println(" --->"+i);
			return listEligibility;
		}
		return null;
	}
	
	
	@Override
	public List<CourseType> courseTypeList() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from CourseType");
		List<CourseType> courseTypeList = query.list();
		return courseTypeList;
	}
	
	//searchAssessorCalendar
	
	@Override
	public List searchAssessorCalendar(String data) {
		
		Session session = sessionFactory.getCurrentSession();
		String sql = "select B.coursecode,A.trainingdate, "
				+ "concat(C.trainingpartnerpermanentline1, ', ', C.trainingpartnerpermanentline2, ' -', dt.districtname) as address, "
				+ "(select count(1) from courseenrolleduser where trainingcalendarid=A.trainingcalendarid) "
				+ " ,A.batchCode, A.assessmentdatetime "
				+ "from trainingcalendar A "
				+ "inner join coursename B on(A.coursename=B.coursenameid) "
				+ "inner join personalinformationtrainingpartner C on(A.trainingcenter=C.personalinformationtrainingpartnerid) "
				+ "inner join district dt on dt.districtid = C.trainingpartnerpermanentdistrict where to_timestamp(COALESCE(A.assessmentdatetime, '19900101010101'),'DD-MM-YYYY') >= CURRENT_TIMESTAMP - INTERVAL '1 days' AND A.assessor= '"+data+"'";
	
			Query query = session.createSQLQuery(sql);
			List list = query.list();
		return list;
	}
	
	//viewAssessmentAgencyCalendar
	
	@Override
	public List viewAssessmentAgencyCalendar(String data) {
		
		String [] n1 = data.split("-");
        String courseType,courseName,assessmentDateTime,assessmentAgencyName ,assessorName ;
        
        try{
			courseType = n1[0].split("=")[1];
		}
		catch(Exception e){
			courseType = "%";	
		}
		
		try{
			courseName = n1[1].split("=")[1];	
		}catch(Exception e){
			courseName = "%";	
		}
		
		try{
			assessmentDateTime = n1[2].split("=")[1];
			assessmentDateTime = "%"+assessmentDateTime.replaceAll("%20", " ");
		}
		catch(Exception e){
			assessmentDateTime = "%";
		}
		
		try{
			assessmentAgencyName = n1[3].split("=")[1];
		}
		catch(Exception e){
			assessmentAgencyName = "%";
		}
		
		try{
			assessorName = n1[4].split("=")[1];
		}
		catch(Exception e){
			assessorName = "%";
		}
	
		String sql = " select B.coursetype,C.coursename,A.assessmentdatetime,F.statename,E.firstname || ' '|| E.middlename ||' '|| E.lastname ,CASE WHEN G.status = 'A' THEN 'ACTIVE' ELSE 'IN-ACTIVE' END,C.coursecode,A.batchCode	from trainingcalendar A inner join coursetype B on(A.coursetype=B.coursetypeid)	inner join coursename C on(A.coursename=C.coursenameid)        inner join personalinformationtrainingpartner D on(A.trainingcenter=D.personalinformationtrainingpartnerid) inner join personalinformationassessor E on(A.assessor=E.personalinformationassessorid) inner join state F on(E.assessorcorrespondencestate=F.stateid)  inner join logindetails G on(E.logindetails=G.id) where to_timestamp(COALESCE(A.trainingdate, '19900101010101'),'DD-MM-YYYY') > now()"+
				" and   cast(A.coursetype as varchar(10)) like '"+courseType+"%'  and  cast(A.coursename as varchar(10) ) like  '"+courseName+"%' "+
				" and cast(coalesce(A.assessmentdatetime , '') as varchar(100)) like '"+assessmentDateTime+"%' and  cast(A.assessmentpartnername as varchar(100)) like '"+assessmentAgencyName+"%' and  cast(A.assessor as varchar(100)) like '"+assessorName+"%'";
		Session session = sessionFactory.getCurrentSession();
				System.out.println(" sql "+sql);   
				Query query = session.createSQLQuery(sql);
				List list = query.list();
				
	
		return list;
	}
	
	//searchAssessorTraineesForResults
	
	@Override
	public List searchAssessorTraineesForResults(String data) {
		
		
		String [] n1 = data.split("@");
        
        String courseType , trainingDate , trainingCenter , courseName;
        try{
			courseType = n1[0].split("=")[1];	
		}catch(Exception e){
			courseType = "%";	
		}
		
        try{
        	trainingCenter = n1[1].split("=")[1];	
		}catch(Exception e){
			trainingCenter = "%";	
		}
		
	
		try{
			trainingDate = n1[2].split("=")[1];
			trainingDate = "%"+trainingDate.replaceAll("%20", " ");
			System.out.println("trainingDate "+trainingDate);
		}
		catch(Exception e){
			trainingDate = "%";
		}
		
		  try{
				courseName = n1[3].split("=")[1];	
			}catch(Exception e){
				courseName = "%";	
			}
		
		String sql = "select A.trainingcalendarid,B.courseenrolleduserid, C.coursename,A.trainingdate,"
				+ " concat(D.firstname , ' ' , D.middlename , ' ' , D.lastname ) TraineeCenter, "
				+ " concat(F.firstname , ' ' , F.middlename , ' ' , F.lastname ) Trainee "
				+ " ,B.result,B.assessorcomment,C.courseCode,A.batchCode , A.assessmentdatetime "
				+ " from trainingcalendar A "
				+ " inner join courseenrolleduser B on(A.trainingcalendarid=B.trainingcalendarid) "
				+ " inner join coursename C on(A.coursename=C.coursenameid) "
				+ " inner join personalinformationtrainingpartner D on(A.trainingcenter=D.personalinformationtrainingpartnerid) "
				+ " inner join logindetails E on(D.logindetails=E.id)"
				+ " inner join personalinformationtrainee F on(F.logindetails=B.logindetails) "
				+" where "
				//+ " to_timestamp(COALESCE(A.assessmentdatetime, '19900101010101'),'DD-MM-YYYY') >= CURRENT_TIMESTAMP - INTERVAL '1 days' and "
				+ "  cast(A.courseType as varchar(100)) like '"+courseType+"%'  and  cast(A.coursename as varchar(100)) like '"+courseName+"%'   and  cast(A.trainingdate as varchar(100)) like '"+trainingDate+"%'  and cast(A.trainingcenter as varchar(100)) like '"+trainingCenter+"%'";
				
				
		Session session = sessionFactory.getCurrentSession();
				System.out.println(" sql "+sql);   
				Query query = session.createSQLQuery(sql);
				List list = query.list();
				
	
		return list;
	}
	
	//updateTraineeAssessmentResult
	
	@Override
	public String updateTraineeAssessmentResult(String data) {
		
		
		System.out.println("passing name   :" + data);
		
		
		
		String[] updateDetails = data.split("@");
		String id , status , comment ;	
		id= (updateDetails[0].split("="))[1];
		
		status = (updateDetails[1].split("="))[1];
		comment = (updateDetails[2].split("="))[1];
		Session session = sessionFactory.getCurrentSession();
		CourseEnrolledUser courseEnrolledUser = (CourseEnrolledUser) session.load(CourseEnrolledUser.class, Integer.parseInt(id));
		courseEnrolledUser.setResult(status);
		courseEnrolledUser.setAssessorComment(comment);
		session.update(courseEnrolledUser);
		String newList = "Records successfully updated !!!" ; 
				
	
		return newList;
	}
	
	@Override
	public String updateTraineeAssessmentResultOnline(Integer userID,String result,String comment) {
		int courseenrolledUserID = 0;
		Session session = sessionFactory.getCurrentSession();
		String sql = "select id from nomineetrainee where  status = 'N' and logindetails = "+userID;
		Query query = session.createSQLQuery(sql);
		List list = query.list();
		if(list.size() > 0){
			courseenrolledUserID = (Integer) list.get(0);
		}
		if(courseenrolledUserID > 0){
			NomineeTrainee nomineeTraineeUser = (NomineeTrainee) session.load(NomineeTrainee.class, courseenrolledUserID);
			if(result != null && result.toUpperCase().equals("PASS")){
				nomineeTraineeUser.setResult("P");
			}else{
				nomineeTraineeUser.setResult("F");
			}
		
			session.update(nomineeTraineeUser);
		}
		String newList = "Records successfully updated !!!" ; 
		return newList;
	}
	
	
	//searchDataAssessmentAgency
	@Override
	public List searchDataAssessmentAgency(String name) {
		String[] totalConnected = name.split("-");
		String id,status;
		
		if(totalConnected[0].split("=").length == 1){
			id = "%";
		}else{
			id = (totalConnected[0].split("="))[1];
		}
		if(totalConnected[1].split("=").length == 1){
			status = "%";
		}else{
			status = (totalConnected[1].split("="))[1];
		}
		
		
		String[] statusA  = status.split("%20");
		String cn = "";
		for(int i = 0 ; i < statusA.length ; i++){
			cn = cn + statusA[i] + " ";
		}
		String fcn = cn.substring(0, cn.length()-1);
		System.out.println(fcn.length());
		
		Session session = sessionFactory.getCurrentSession();
		String sql ="select maa.manageassessmentagencyid  , ld.loginid, maa.assessmentagencyname , maa.websiteurl , (CASE WHEN ld.isActive = 'Y' THEN 'ACTIVE' ELSE 'INACTIVE' END) as currentstatus "+
					" from manageassessmentagency as maa inner join logindetails as ld "+
					" on ld.id = maa.logindetails "+
					" where upper(maa.assessmentagencyname) like '"+fcn.toUpperCase() +"' and ld.loginid like '"+id+"'";
		Query query = session.createSQLQuery(sql);
		List<CourseName> list = query.list();
		return list;
	}
	
	//editMAA
	
	@Override
	public List editMAA(String name) {

		String sql="select maa.manageassessmentagencyid  , ld.loginid ,maa.assessmentagencyname , maa.websiteurl , ld.status , "+
    			" maa.pan , maa.email , maa.headofficedataaddress1 , maa.headofficedataaddress2 , maa.pin ,s.statename , "+
    			" d.districtname  , c.cityname ,"+
    			" s.stateid ,d.districtid  , c.cityid "+
				" from manageassessmentagency as maa "+
				" inner join logindetails as ld on ld.id = maa.logindetails "+
				" inner join district as d on d.districtid = maa.district "+
				" inner join city as c on c.cityId = maa.city "+
				" inner join state as s on s.stateid = maa.stateid "+
				" where maa.manageassessmentagencyid = '"+ name+"' ";
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		List<CourseName> list =  query.list();
		return list;
	}
	
	//updateMAA
	
	@Override
	public String updateMAA(String name) {

		String [] total = name.split("-");
		String userId = total[0].split("=")[1];
		String status = total[1].split("=")[1];
		String websiteUrl = total[2].split("=")[1];
		String email = total[3].split("=")[1];
		String headOfficeDataAddress1 = total[4].split("=")[1].replaceAll("%20", " ");
		String headOfficeDataAddress2 = total[5].split("=")[1].replaceAll("%20", " ");
		System.out.println("address 1  :"+ headOfficeDataAddress1 +"     "+ headOfficeDataAddress2);
		String pin = total[6].split("=")[1];
		String stateId = total[7].split("=")[1];
		String district = total[8].split("=")[1];
		String city = total[9].split("=")[1];
		String isActive = status.equalsIgnoreCase("A")?"Y":"N";
		Session session = sessionFactory.getCurrentSession();
		
		String selectLoginDetails = "select logindetails from manageassessmentagency where manageassessmentagencyid = '"+userId+"'";
		Query querySel = session.createSQLQuery(selectLoginDetails);
		String selectSel = querySel.getQueryString();
		System.out.println("login id is   :"+ selectSel);
		
		String sql="UPDATE manageassessmentagency "+
				" SET city='"+city+"',  "+
				" district='"+district+"', email='"+email+"', "+
				" headofficedataaddress1='"+headOfficeDataAddress1+"', headofficedataaddress2='"+headOfficeDataAddress2+"', "+
				" pin='"+pin+"', stateid='"+stateId+"', "+
				" websiteurl='"+websiteUrl+"' "+
				" WHERE manageassessmentagencyid = '"+userId+"' ";

		String sqlLD = "update logindetails set status ='"+status+"' , isactive = '"+isActive+"' where id =("+selectSel+")";
		Query query2 = session.createSQLQuery(sqlLD);
		String result = null;
		Query query = session.createSQLQuery(sql);
		System.out.println(sql);
		Integer i = query.executeUpdate();
		System.out.println("i  :"+ i);
		
		Integer j = query2.executeUpdate();
		if(i > 0 ){
			System.out.println("data selected finally  " );
			result = "Data updated successfully"; 
		}else{
			result = "Oops , something went wrong try ageain !!!";
		}
		return result;
	}

	@Override
	public TraineeAssessmentEvaluation evaluate(TreeMap<Integer, Integer> questions, List<AssessmentQuestions> answers,
			List<Integer> lst,int loginIdUniuqe) {
			Session session = sessionFactory.getCurrentSession();
		TraineeAssessmentEvaluation traineeEvaluation = new TraineeAssessmentEvaluation();
		//int totalQuestion = answers.size();
		TreeMap<Integer, Integer> answersMap = new TreeMap<Integer, Integer>();
		for (int i = 0; i < answers.size(); i++) {
			answersMap.put(answers.get(i).getAssessmentQuestionId(), answers.get(i).getCorrectAnswer());
		}
		int totalQuestions = answers.size();
		int correctAnswers = 0;
		int wrongAnswers = 0;
		double totalScore = 0.00;
		double sum = 0.00;
		Set<Integer> questionKeys = questions.keySet();
		Iterator<Integer> keysIterator = questionKeys.iterator();
		String subjectIds="";
		int k=0;
		int subId=lst.get(k);
		TreeMap<Integer,Integer> abc=new TreeMap<>();
		TreeMap<Integer,Integer> afterAbc=new TreeMap<>();
		TreeMap<Integer,Double> subjectWiseScore=new TreeMap<>();

	
		int count=1;
		for(int i1=1;i1<=lst.size();i1++){
			try{
			if(lst.get(i1-1).equals(lst.get(i1)))
				count++;
			else{
				if(abc.containsKey(lst.get(i1-1))){
					abc.replace(lst.get(i1-1), abc.get(lst.get(i1-1))+count);
					afterAbc.replace(lst.get(i1-1), afterAbc.get(lst.get(i1-1))+count);

				}
				else{
				abc.put(lst.get(i1-1), count);
				afterAbc.put(lst.get(i1-1), count);

				}
				count=1;
			}
			}
			catch(IndexOutOfBoundsException e){
				//System.out.println("Catch exception "+lst.get(i1-1)+"="+count);
				if(abc.containsKey(lst.get(i1-1))){
					abc.replace(lst.get(i1-1), abc.get(lst.get(i1-1))+count);
					afterAbc.replace(lst.get(i1-1), afterAbc.get(lst.get(i1-1))+count);

				}
				else{
				abc.put(lst.get(i1-1), count);
				afterAbc.put(lst.get(i1-1), count);

				}
			
			}
		}
	
		while(keysIterator.hasNext()){
			
			int key = keysIterator.next();
			int correctAnswer = answersMap.get(key);
			int providedAnswer = questions.get(key);
			
			if(providedAnswer == correctAnswer){
			
				correctAnswers++;
				
			}
			else
			{
				if(subId==lst.get(k)){
					afterAbc.replace(subId, afterAbc.get(subId)-1);
				}
				else
				{
					subId=lst.get(k);
					afterAbc.replace(subId, afterAbc.get(subId)-1);
				}
			}
			//System.out.println("For Question "+key +"subject="+subId+" #Provided answer :" + providedAnswer + " & Correct answer :"+ correctAnswer);

			k++;
		}
	
		wrongAnswers = totalQuestions - correctAnswers;
		if(totalQuestions > 0)
		{
			Set<Integer> s=abc.keySet();
			double individualSubjectScore=0;
			for(int subId2:s){
				individualSubjectScore=(double)afterAbc.get(subId2)/abc.get(subId2)*100;
				System.out.println(subId2+"--->"+individualSubjectScore);
				subjectWiseScore.put(subId2,individualSubjectScore);
				sum=sum+individualSubjectScore;
			}
			//totalScore = (double)correctAnswers/totalQuestions*100;
			totalScore=sum/(abc.size());
			DecimalFormat f = new DecimalFormat("##.00");
			totalScore = Double.valueOf(f.format(totalScore));
		}
		traineeEvaluation.setTotalQuestions(totalQuestions);
		traineeEvaluation.setCorrectAnswers(correctAnswers);
		traineeEvaluation.setIncorrectAnswers(wrongAnswers);
		traineeEvaluation.setTotalScore(totalScore);
	
		List<Integer> eligibility = getElegibilityForAssessment(abc.keySet()); 
		
		int avgEligibility=0;
		for(int i:eligibility)
			avgEligibility=avgEligibility+i;
		
		avgEligibility=avgEligibility/eligibility.size();
			
		
		if(avgEligibility > -1){
			if(totalScore >= avgEligibility){
				traineeEvaluation.setResult("Pass");
			}else{
				traineeEvaluation.setResult("Fail");
			}
		}else{
			traineeEvaluation.setResult("Eligibility yet to declare");
		}
			String sql;
			sql = "update NomineeTrainee set result = '"+traineeEvaluation.getResult()+"' where  logindetails='"+traineeEvaluation.getLogindetails()+"'";
			Query query = session.createSQLQuery(sql);
			query.executeUpdate();
			
			List list = session.createSQLQuery("select id from nomineeTrainee where logindetails="+loginIdUniuqe+" and status='N'").list();
			
			traineeEvaluation.setNomineeId((int)list.get(0));
			traineeEvaluation.setLogindetails(loginIdUniuqe);
			Integer traineeAssessmentEvaluationId = (Integer) session.save(traineeEvaluation);
			
			OnlineAssessmentSubjectsScore oass;
			
			Set <Map.Entry<Integer,Double>> set=subjectWiseScore.entrySet();

			for(Map.Entry<Integer,Double> map: set){
				System.out.println(map.getKey()+"="+map.getValue());
				oass=new OnlineAssessmentSubjectsScore();
				oass.setAssessmentResultId(traineeAssessmentEvaluationId);
				oass.setSubjectId(map.getKey());
				oass.setSubjectScore(map.getValue());
				session.save(oass);
			}
			
			
			
		return traineeEvaluation;
	}
}
