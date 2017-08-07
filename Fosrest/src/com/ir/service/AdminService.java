package com.ir.service;

import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

import javax.transaction.Transactional;

import com.ir.bean.common.IntStringBean;
import com.ir.form.ActivateAssessmentOfTraineeForm;
import com.ir.form.AdminUserManagementForm;
import com.ir.form.AssessmentQuestionForm;
import com.ir.form.AssessmentQuestionForm_old;
import com.ir.form.AssessorUserManagementForm;
import com.ir.form.ChangePasswordForm;
import com.ir.form.CityForm;
import com.ir.form.ContactTrainee;
import com.ir.form.DistrictForm;
import com.ir.form.FotestGenerateCertificateForm;
import com.ir.form.GenerateCertificateForm;
import com.ir.form.InvoiceInfoForm;
import com.ir.form.InvoiceMasterForm;
import com.ir.form.ManageCourse;
import com.ir.form.ManageCourseContentForm;
import com.ir.form.ManageTrainingCalendarForm;
import com.ir.form.ManageTrainingPartnerForm;
import com.ir.form.NominateTraineeForm;
import com.ir.form.RegionForm;
import com.ir.form.StateForm;
import com.ir.form.TraineeUserManagementForm;
import com.ir.form.TrainerUserManagementForm;
import com.ir.form.TrainingCalendarForm;
import com.ir.form.TrainingCenterUserManagementForm;
import com.ir.form.TrainingClosureForm;
import com.ir.form.TrainingScheduleForm;
import com.ir.form.UploadAssessmentForm;
import com.ir.form.verifyTraineeEnrollmentForm;
import com.ir.form.viewEnrolledCoursesForm;
import com.ir.form.ViewTrainingCalendarForm;
import com.ir.form.activateTrainingOfTraineeForm;
import com.ir.form.stateAdminForm;
import com.ir.form.verifyTraineeEnrollmentForm;
import com.ir.form.viewEnrolledCoursesForm;
import com.ir.model.AdminUserManagement;
import com.ir.model.AssessmentQuestions;
import com.ir.model.CityMaster;
import com.ir.model.CourseName;
import com.ir.model.CourseType;
import com.ir.model.CustomerDetails;
import com.ir.model.CustomerMaster;
import com.ir.model.District;
import com.ir.model.DistrictMaster;
import com.ir.model.EmployeeMonthlyCharges;
import com.ir.model.FeedbackMaster;
import com.ir.model.FotestFeedbackMaster;
import com.ir.model.HolidayMaster;
import com.ir.model.InvoiceMaster;
import com.ir.model.LoginDetails;
import com.ir.model.ManageTraining;
import com.ir.model.ManageCourseCarricullum;
import com.ir.model.ManageTrainingPartner;
import com.ir.model.MappingMasterTrainer;
import com.ir.model.SubjectMaster;
import com.ir.model.NomineeTrainee;
import com.ir.model.PersonalInformationAssessor;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.PersonalInformationTrainingPartner;
import com.ir.model.PhotoGallery;
import com.ir.model.RegionMapping;
import com.ir.model.RegionMaster;
import com.ir.model.State;
import com.ir.model.StateAdmin;
import com.ir.model.StateMaster;
import com.ir.model.SubjectMaster;
import com.ir.model.TaxMaster;
import com.ir.model.TrainingCalendar;
import com.ir.model.TrainingPartner;
import com.ir.model.TrainingSchedule;
import com.ir.model.UnitMaster;
import com.ir.model.ViewResult;
import com.ir.model.admin.TrainerAssessmentSearchForm;
import com.ir.model.trainer.TrainerAssessmentEvaluation;

public interface AdminService {

	String stateMasterSave(StateForm stateForm);
	// public stateSave()

	List<State> stateList();

	String districtMasterSave(DistrictForm districtForm);

	String cityMasterSave(CityForm cityForm);

	String regionMasterSave(RegionForm regionForm);

	List<CourseName> courseNameList();

	String manageCourse(ManageCourse manageCourse);

	List<CourseType> courseTypeList();

	//String manageTrainingPartnerSave(ManageTrainingPartnerForm manageTrainingPartnerForm);

	//String manageAssessmentAgencySave(ManageAssessmentAgencyForm manageAssessmentAgencyForm);

	List<PersonalInformationTrainee> traineeUserManagementSearch(TraineeUserManagementForm traineeUserManagementForm);

	List<PersonalInformationTrainer> trainerUserManagementSearch(TrainerUserManagementForm trainerUserManagementForm);

	List<PersonalInformationTrainingInstitute> trainingCenterUserManagementSearch(
			TrainingCenterUserManagementForm trainingCenterUserManagementForm, Integer profileId, Integer userId);

	List<PersonalInformationAssessor> assessorUserManagementSearch(
			AssessorUserManagementForm assessorUserManagementForm, Integer profileid, Integer userID);

	List<AdminUserManagement> adminUserManagementSearch();

	String adminUserManagementSave(AdminUserManagementForm adminUserManagementForm);
	//stateadmin
	public String addstateadmin(stateAdminForm p);

	public void updatestateadmin(stateAdminForm p);

	public List<StateAdmin> liststateadmin();

	public StateAdmin getstateadminById(int id);

	public void removestateadmin(int id);

	String manageCourseContentSearch(ManageCourseContentForm manageCourseContentForm);

	List<ManageTrainingPartner> trainingPartnerList();

	List<PersonalInformationTrainer> trainingNameList();

	String assessorUserManagementSave(AssessorUserManagementForm assessorUserManagementForm);

	List<District> districtList();

	//String trainingCalendarForm(TrainingCalendarForm trainingCalendarForm);

	String manageAssessmentQuestionsSave(AssessmentQuestionForm assessmentQuestionForm);
	// boolean changePasswordTraineeSave(ChangePasswordForm changePasswordForm,
	// String id);

	boolean changePasswordTPSave(ChangePasswordForm changePasswordForm, String id);

	boolean changePasswordadminSave(ChangePasswordForm changePasswordForm, String id);

	String contactTraningPTSave(ContactTrainee contactTrainee, String id);

	String saveFeedbackMaster(FeedbackMaster feedbackMaster);

	List<IntStringBean> getTrainingCentersByCourse(int courseNameId);

	List<TrainerAssessmentSearchForm> searchTrainerForAssessmentValidation(int courseNameId, int trainingPartnerId);

	TrainerAssessmentSearchForm evaluateTrainerAssessment(TrainerAssessmentSearchForm trainerAssessmentForm);

	int saveTrainerAssessment(TrainerAssessmentEvaluation trainerAssessmentEvaluation);

	// updateUser
	@Transactional
	void updateUser(String userid, String tableName, String status);

	List searchManageCourse(String data);

	String editManageCourseData(String data);

	String editState(String data);

	String CheckState(String data);

	List searchState(String data);

	List onLoadDistrict(String data);

	String changeStatusDistrict(String data);

	List searchDistrict(String data);

	String editCityData(String data);

	List searchCity(String data);

	List onLoadRegion(String data);

	String editRegionData(String data);

	List traineeAssessmentCalender(String data);

	List getQuestions(String data);

	List searchFeedbackMaster(String data);

	List searchAssessmentAgencyList(String data);

	List searchAssessorDetail(String data);

	String changeAssessor(String data);

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Holiday Master
	 */

	public String addHolidayMaster(HolidayMaster p);

	public void updateHolidayMaster(HolidayMaster p);

	public void removeHolidayMaster(int id);

	public HolidayMaster getHolidayMasterById(int id);

	public List<HolidayMaster> listHolidayMaster();

	public String addUnitMaster(UnitMaster p);

	public void updateUnitMaster(UnitMaster p);

	public void removeUnitMaster(int id);

	public UnitMaster getUnitMasterById(int id);

	public List<UnitMaster> listUnitMaster2();

	public String addSubjectMaster(SubjectMaster p);

	public void updateSubjectMaster(SubjectMaster p);

	public void removeSubjectMaster(int id);

	public SubjectMaster getSubjectMasterById(int id);

	public List<SubjectMaster> listSubjectMaster();

	/*public String addSubjectMaster(SubjectMaster p);

	public void updateSubjectMaster(SubjectMaster p);

	public void removeSubjectMaster(int id);

	public SubjectMaster getSubjectMasterById(int id);

	public List<SubjectMaster> listSubjectMaster();
*/
	public List<TrainingSchedule> listTrainingSchedule();

	public void addTrainingSchedule(TrainingSchedule p);

	public void updateTrainingSchedule(TrainingSchedule p);

	public void removeTrainingSchedule(int id);

	public void acceptTrainingSchedule(int id, int profileid, int loginUser2, int userTableId, String operation);

	public TrainingSchedule getTrainingScheduleById(int id);

	public List<PersonalInformationTrainingInstitute> listTrainingInstitude();

	public List<TrainingSchedule> listTrainingSchedule(int id, int profileid);

	//public List<GenerateCertificateForm> listGenerateCertificate(GenerateCertificateForm generateCertificateForm);

	public String addStateMaster(StateMaster p);

	public void updateStateMaster(StateMaster p);

	public void removeStateMaster(int id);

	public StateMaster getStateMasterById(int id);

	public List<StateMaster> listStateMaster();

	public String addDistrictMaster(DistrictMaster p);

	public void updateDistrictMaster(DistrictMaster p);

	public void removeDistrictMaster(int id);

	public DistrictMaster getDistrictMasterById(int id);

	public List<DistrictMaster> listDistrictMaster();

	public String addCityMaster(CityMaster p);

	public void updateCityMaster(CityMaster p);

	public void removeCityMaster(int id);

	public CityMaster getCityMasterById(int id);

	public List<CityMaster> listCityMaster();

	public String addRegionMaster(RegionMaster p);

	public void updateRegionMaster(RegionMaster p);

	public void removeRegionMaster(int id);

	public RegionMaster getRegionMasterById(int id);

	public List<RegionMaster> listRegionMaster();

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Holiday Master
	 */

	/*public String addTrainingPartner(TrainingPartner p);

	public void updateTrainingPartner(TrainingPartner p);

	public void removeTrainingPartner(int id);

	public TrainingPartner getTrainingPartnerById(int id);

	public List<TrainingPartner> listTrainingPartner();*/

	//public List<TrainingClosureForm> listTrainingClosure();

	/****************************** Invoice ******************************************************/
	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Customer Master
	 */

	public void addCustomerMaster(CustomerMaster p);

	public void updateCustomerMaster(CustomerMaster p);

	public void removeCustomerMaster(int id);

	public CustomerMaster getCustomerMasterById(int id);

	public List<CustomerMaster> listCustomerMaster();

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Tax Master
	 */

	public void addTaxMaster(TaxMaster p);

	public void updateTaxMaster(TaxMaster p);

	public void removeTaxMaster(int id);

	public TaxMaster getTaxMasterById(int id);

	public List<TaxMaster> listTaxMaster();

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Tax Master
	 */

	public void addEmployeeMonthlyCharges(EmployeeMonthlyCharges p);

	public void updateEmployeeMonthlyCharges(EmployeeMonthlyCharges p);

	public void removeEmployeeMonthlyCharges(int id);

	public EmployeeMonthlyCharges getEmployeeMonthlyChargesById(int id);

	public List<EmployeeMonthlyCharges> listEmployeeMonthlyCharges();

	public List<PersonalInformationTrainee> listEligibleuser(String designation, String stateId);

	public String enrollUser(String data, int stateAdminId);

	public AssessmentQuestions getAssessmentQuestionById(int id);

	public String updateCertificate(String data);

	// public String listGenerateCertificate();
	// public String HolidayMastersearch();

	public String addCustomerDetails(String[] empName, String[] desc, String[] unitPrice, String customer);

	public List<CustomerDetails> listCustomerDetails();

	public void removeCustomerDetails(int id);

	public List<CustomerDetails> getCustomerDetailsByInvoice(String invoice);

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Invoice Master
	 */

	public void addInvoiceMaster(InvoiceMasterForm p);

	public void updateInvoiceMaster(InvoiceMasterForm p);

	public void removeInvoiceMaster(int id);

	public InvoiceMaster getInvoiceMasterById(int id);

	public List<InvoiceMaster> listInvoiceMaster();

	public List<InvoiceMaster> listCustomCustomerMaster();

	public InvoiceInfoForm getInvoiceInfo(String invoice);

	/* fotest */

	public void addManageTraining(ManageTraining p);

	public void updateManageTraining(ManageTraining p);

	public List<ManageTraining> listManageTraining();

	public ManageTraining getManageTrainingById(int id);

	public void removeManageTraining(int id);

	// //Region Mapping
	// public void addRegionMapping(RegionMapping p);
	public void updateRegionMapping(RegionMapping p);

	public List<RegionMapping> listRegionMapping();

	public RegionMapping getRegionMappingById(int id);

	public void removeRegionMapping(int id);

	public void addRegionMapping(RegionMapping p);

	// Manage Course Carriculum
	public void addManageCourseCarricullum(ManageCourseCarricullum p);

	public void updateManageCourseCarricullum(ManageCourseCarricullum p);

	public List<ManageCourseCarricullum> listManageCourseCarricullum();

	public ManageCourseCarricullum getManageCourseCarricullumById(int id);

	public void removeManageCourseCarricullum(int id);


	// listactivateAssessmentOfTrainee
	public List<ActivateAssessmentOfTraineeForm> listactivateAssessmentOfTrainee(ActivateAssessmentOfTraineeForm p);

	// Feedback Master
	public void addFeedbackMaster(FotestFeedbackMaster p);

	public void updateFeedbackMaster(FotestFeedbackMaster p);

	public List<FotestFeedbackMaster> listFotestFeedbackMasterForm();

	public FotestFeedbackMaster getFeedbackMasterById(int id);

	public void removeFeedbackMaster(int id);

	//verifyTraineeEnrollment
	public List<verifyTraineeEnrollmentForm> listVerifyTraineeEnrollment(verifyTraineeEnrollmentForm p);
	
	//View Enrolled Courses
	public List<viewEnrolledCoursesForm> listviewEnrolledCourses(viewEnrolledCoursesForm p);

	//listviewTrainingCalendar
	public List<ViewTrainingCalendarForm> listviewTrainingCalendar(ViewTrainingCalendarForm p);
	//listmanageTrainingCalendar
	public List<ManageTrainingCalendarForm> listmanageTrainingCalendar(ManageTrainingCalendarForm p);
	
	
	//listactivateTrainingOfTrainee
		
		public List<activateTrainingOfTraineeForm> listactivateTrainingOfTrainee(activateTrainingOfTraineeForm p);
	
	//FotestGenerateCertificate
	public List<FotestGenerateCertificateForm> listfotestGenerateCertificate(FotestGenerateCertificateForm p);
	
	//namage assessment question
		List fotestGetQuestions(String data);

		List<StateAdmin> stateAdminsearch(stateAdminForm stateAdminForm);

		/*//stateadmin
		public StateAdmin FullDetailStateAdmin(int loginId);*/
		

		
		

public void deleteAssessmentQuestion(int id);

int getQuestionNumber(String data);

public List listCalendar(int profileId,int id);
public List<TrainingScheduleForm> listtrainingScheduleMaster( );

public List<UnitMaster> listUnitMaster();

TreeMap<String, List<SubjectMaster>>  allUnitModules();



public String addTrainingCalendar(TrainingCalendar p);

public String shareInitiativesave(ContactTrainee contactTrainee, String id);



public List<PersonalInformationTrainingInstitute> listTrainingInstitude2(int id);

List<PersonalInformationTrainer> trainingNameList2(int profileId,int id);


public List<StateMaster> listStateMaster2(int sid);

public String saveEditTrainingScheduleMaster(String subject[],String duration[],String day[],String startTime[],String endTime[],TrainingScheduleForm form);
public List<SubjectMaster>  allSubjects();

public List listCalendarSearch(TrainingCalendarForm form);

public String createTrainingCalendar(String[] days,String[] subjectDates,String[] trainers, String[] subjects, TrainingCalendarForm p,int profileId);
public List<MappingMasterTrainer> trainerMappingState(int id);

public List listSchCodeSubjects(String scheduleCode);

public String calculateEndDate(String startDate,String duration,String institute,int tcId);

public List<TrainingCalendar> listBatchCodeList();

public List<TrainingCalendar> listBatchcodeInfo(String batchCode);

//Object listSuperAdmin(int attribute, int i);
public List<PersonalInformationTrainer> listpendingTrainer(int id, int profileid);

public List<PersonalInformationTrainingInstitute> listpendingTrainingInstitute(int id, int profileid);

public List editTrainingSchedule2(int id);

public void removeTrainingSchedule2(int id);

public List editTrainingCalendar(int id);
public TrainingCalendarForm getTrainingCalendar(int id);

String updateTrainingCalendar(int trainingCalendarId,String[] days,String[] subjectDates, String[] trainers, String trainingStartDate2,
		String trainingEndDate2);

List getTrainingCalendarMappingTrainer(int editId);

public List<UploadAssessmentForm> listofTrainee( int trainingCalendarId);

public List listofTraineeforResult( String data);



public String saveTraineeResult(String data);


public StateAdmin FullDetailStateAdmin(int loginId);


public List<TrainingCalendar> listBatchCodeListNomineeTrainee(NominateTraineeForm nominateTraineeForm);

public List<TrainingCalendar>  listBatchCodeListStateAdmin(int stateId);

public String addResetPassword(String a,String loginid);

public List getTrainingCalendarById(int id);

public List getEnteredSubjectDates(int editId);

String photogallery(String linkName);


public List<PhotoGallery> listPhotoGallery();
/*public List<String> getAllEndDates(String trainingStartDate);*/

public void removePhotoGallery(int id);

public List listNominatedTrainee(int profileId, int id);

public String Helpsave(ContactTrainee contactTrainee, String id);

List<String> getAllScheduleCode();

List getScheduleCodeDetails(String schCode);

List<AssessmentQuestions> listAllSubjectQuestion(int a);

void activateDeActivateTrainingCalendar(int trainingCalendarId, String tableName, String status);
}


	