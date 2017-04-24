package com.ir.service;

import java.util.List;

import com.ir.form.AssessmentQuestionForm;
import com.ir.form.CertificateForm;
import com.ir.form.ChangePasswordForm;
import com.ir.form.ContactTrainee;
import com.ir.form.CourseEnrolledUserForm;
import com.ir.form.GetScoreCardForm;
import com.ir.form.MyTrainingForm;
import com.ir.form.GenerateCertificateForm;
import com.ir.form.InstituteMyCalendarForm;
import com.ir.form.MarkAttendanceForm;
import com.ir.form.OnlineTrainingForm;
import com.ir.form.RegistrationFormTrainee;
import com.ir.form.TrainingRequestForm;
import com.ir.model.AdmitCardForm;
import com.ir.model.CertificateInfo;
import com.ir.model.CheckAadhar;
import com.ir.model.CourseName;
import com.ir.model.CourseTrainee;
import com.ir.model.CourseType;
import com.ir.model.FeedbackForm;
import com.ir.model.FeedbackMaster;
import com.ir.model.ManageTrainingPartner;
import com.ir.model.ModuleMaster;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.State;
import com.ir.model.TrainingSchedule;
import com.ir.model.UnitMaster;
import com.ir.model.Utility;



public interface TraineeService {
	


	public List<CourseName> courseNameList();
	
	
	public List<String> courseTypes();
	
	
	List<CourseType> courseTypeList();
	
	
	public List<CourseName> courseNameListByType(int courseType);
	
	
	public CourseTrainee getCourseTrainingByCourseTypeID(int typeId);
	
	public List<CourseTrainee> getCourseTrainingByCourseTypeIDList(int typeId);
	
	
	public String isTraineeEligible(int userID);
	
	
	public List<ManageTrainingPartner> trainingPartnerList();
	
	
	public List<State> trainingCenterStateList();
	
	
	public String updateTrainee(RegistrationFormTrainee registrationFormTrainee , Integer ss);
	
	
	public String contactTraineeSave(ContactTrainee contactTrainee , String id);
	
	
	public boolean changePasswordTraineeSave(ChangePasswordForm changePasswordForm, String id);
	
	
	public String basicSave(CourseEnrolledUserForm courseEnrolledUserForm , int loginid, int tableID,Integer profileId);
	
	
	public long advanceTraineeSave(CourseEnrolledUserForm courseEnrolledUserForm, int loginid, int tableID,Integer profileId);
	
	
	public long specialTrainee(CourseEnrolledUserForm courseEnrolledUserForm, int loginid, int tableID, Integer profileId);
	
	
	public boolean changePasswordAssesorSave(ChangePasswordForm changePasswordForm, String id);
	
	
	public CourseName getCourseDetails(int loginId);
	
	
	public CourseName getCourseName(int profileId);
	
	
	public List<FeedbackMaster> getFeedMasterList(int profileId);
	
	
	public AdmitCardForm generateAdmitCard(int loginId,int profileId);
	
	
	public List<FeedbackForm> getFeedbackDetails(Utility utility);
	
	
	public int getCurrentModuleId(int loginId);
	
	
	public AdmitCardForm generateTrainerAdmitCard(int loginId,int profileId);
	
	
	public String getDefaultMailID(int loginId,int profileId);
	
	
	public int getTableIdForEnrolmentID(int loginId,int profileId);
	
	
	public PersonalInformationTrainee FullDetail(int loginId);
	
	
	public Boolean updateSteps(int tableID,  int steps);
	
	
	public Boolean closeCourse(int userId, String status);
	
	
	public String isCourseOnline(int userID);
	
	
	public CertificateInfo getCertificateID(int userID,  String certificateID);


	public String isAadharExist(CheckAadhar checkAadhar);
	
	List<State> stateList();
	//getCourseDetails
	
	public List getCourseDetails(String data);
	
	public List getAttendanceDeatilsByID(String id);
	
	public String savePaymentStatus(String data);
	
	
	/*********************************FOSREST **********************************************************/
	
	public String addPersonalInfoTrainee(PersonalInformationTrainee p);
	
	public String updatePersonalInfoTrainee(PersonalInformationTrainee p);
	
	public String addPersonalInfoTrainer(PersonalInformationTrainer p);
	
	public String updatePersonalInfoTrainer(PersonalInformationTrainer p);
	
	public String addPersonalInfoTrainingInstitute(PersonalInformationTrainingInstitute p );




	
	public List<MyTrainingForm> listMyTraining();

	public GetScoreCardForm listGetScoreCard(int id);

	public List<CertificateForm> listCertificate(int loginId);

	
	
	public String updatePersonalInfoTrainingInstitute(PersonalInformationTrainingInstitute p );
	
	public PersonalInformationTrainer FullDetailTrainer(int loginId);
	
	public PersonalInformationTrainingInstitute FullDetailTrainingInstitude(int loginId);
	

/*	dynamic
 * public List<UnitMaster> dynListTrainingType();
	public List<UnitMaster> dynListUserType();*/
	
	public OnlineTrainingForm listOnlineTraining(int id);
	public UnitMaster listTrainingTopic(int id);


 public List<AssessmentQuestionForm> listingAssessmentQuestion(
			AssessmentQuestionForm assesQuestionForm, int id);
	
	
	
	
	
	


	
	
	
}
