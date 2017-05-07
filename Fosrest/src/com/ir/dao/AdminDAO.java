package com.ir.dao;
import java.util.List;

import com.ir.bean.common.IntStringBean;
import com.ir.form.AdminUserManagementForm;
import com.ir.form.AssessmentQuestionForm;
import com.ir.form.AssessmentQuestionForm_old;
import com.ir.form.AssessorUserManagementForm;
import com.ir.form.ChangePasswordForm;
import com.ir.form.CityForm;
import com.ir.form.ContactTrainee;
import com.ir.form.DistrictForm;
import com.ir.form.GenerateCertificateForm;
import com.ir.form.InvoiceInfoForm;
import com.ir.form.InvoiceMasterForm;
import com.ir.form.ManageAssessmentAgencyForm;
import com.ir.form.ManageCourse;
import com.ir.form.ManageCourseContentForm;
import com.ir.form.ManageTrainingPartnerForm;
import com.ir.form.RegionForm;
import com.ir.form.StateForm;
import com.ir.form.TraineeUserManagementForm;
import com.ir.form.TrainerUserManagementForm;
import com.ir.form.TrainingCalendarForm;
import com.ir.form.TrainingCenterUserManagementForm;
import com.ir.form.TrainingClosureForm;
import com.ir.form.TrainingRequestForm;
import com.ir.form.TrainingScheduleForm;
import com.ir.model.AdminUserManagement;
import com.ir.model.AssessmentQuestions;
import com.ir.model.City;
import com.ir.model.CityMaster;
import com.ir.model.CourseName;
import com.ir.model.CourseType;
import com.ir.model.CustomerDetails;
import com.ir.model.CustomerMaster;
import com.ir.model.District;
import com.ir.model.DistrictMaster;
import com.ir.model.EmployeeMonthlyCharges;
import com.ir.model.FeedbackMaster;
import com.ir.model.HolidayMaster;
import com.ir.model.InvoiceMaster;
import com.ir.model.LoginDetails;
import com.ir.model.ManageTrainingPartner;
import com.ir.model.ModuleMaster;
import com.ir.model.NomineeTrainee;
import com.ir.model.PersonalInformationAssessor;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.PersonalInformationTrainingPartner;
import com.ir.model.RegionMaster;
import com.ir.model.State;
import com.ir.model.StateMaster;
import com.ir.model.SubjectMaster;
import com.ir.model.TaxMaster;
import com.ir.model.TrainingPartner;
import com.ir.model.TrainingSchedule;
import com.ir.model.UnitMaster;
import com.ir.model.admin.TrainerAssessmentSearchForm;
import com.ir.model.trainer.TrainerAssessmentEvaluation;

public interface AdminDAO {
	
	public String stateMasterSave(StateForm stateForm);

	public List<State> stateList();

	public String districtMasterSave(DistrictForm districtForm);

	public String cityMasterSave(CityForm cityForm);

	public String regionMasterSave(RegionForm regionForm);

	public List<CourseName> courseNameList();

	public String manageCourse(ManageCourse manageCourse);

	public List<CourseType> courseTypeList();

	public String manageTrainingPartnerSave(ManageTrainingPartnerForm manageTrainingPartnerForm);

	public String manageAssessmentAgencySave(ManageAssessmentAgencyForm manageAssessmentAgencyForm);

	public List<PersonalInformationTrainee> traineeUserManagementSearch(TraineeUserManagementForm traineeUserManagementForm);
	public List<PersonalInformationTrainer> trainerUserManagementSearch(TrainerUserManagementForm trainerUserManagementForm);
	public List<PersonalInformationAssessor> assessorUserManagementSearch(AssessorUserManagementForm assessorUserManagementForm,Integer profileid,Integer userID);
	public List<PersonalInformationTrainingInstitute> trainingCenterUserManagementSearch(TrainingCenterUserManagementForm trainingCenterUserManagementForm,Integer profileid,Integer userID);
	public List<AdminUserManagement> adminUserManagementSearch();

	public String adminUserManagementSave(AdminUserManagementForm adminUserManagementForm);

	public String manageCourseContentSearch(ManageCourseContentForm manageCourseContentForm);

	public List<ManageTrainingPartner> trainingPartnerList();

	public List<PersonalInformationTrainer> trainingNameList();

	public String assessorUserManagementSave(AssessorUserManagementForm assessorUserManagementForm);

	public List<District> districtList();

	public String trainingCalendarForm(TrainingCalendarForm trainingCalendarForm);

	State getState(int id);

	public String manageAssessmentQuestionsSave(AssessmentQuestionForm assessmentQuestionForm);

	CourseType getCourseType(int id);

	CourseName getCourseName(int id);

	District getDistrict(int id);

	City getCity(int id);
	public boolean trainingadminForm(ChangePasswordForm changePasswordForm, String id);
	public boolean trainingPartnerPass(ChangePasswordForm changePasswordForm, String id);
	public String contactTrainigPartnerSave(ContactTrainee contactTrainee, String id);
	public String saveFeedbackMaster(FeedbackMaster feedbackMaster);
	
	public List<IntStringBean> getTrainingCentersByCourse(int courseNameId);
	//public boolean trainingadminForm(ChangePasswordForm changePasswordForm, String id);
	public List<TrainerAssessmentSearchForm> searchTrainerForAssessmentValidation(int courseNameId, int trainingPartnerId);
	public int getElegibilityForAssessment(int coursenameid);
	public int saveTrainerAssessment(TrainerAssessmentEvaluation trainerAssessmentEvaluation);
	
	
		
		//updateUser
		
		public void updateUser(String userid , String tableName , String status);
		
		//searchManageCourse
		public List searchManageCourse(String data);
		
		//editManageCourseData
		public String editManageCourseData(String data);
		
		public String editState(String data);
		
		public String CheckState(String data);
		
		public List<State> searchState(String data);
		public List onLoadDistrict(String data);
		public String changeStatusDistrict(String data);
		
		public List searchDistrict(String data);
		public String editCityData(String data);
		public List searchCity(String data);
		public List onLoadRegion(String data);
		public String editRegionData(String data);
		public List traineeAssessmentCalender(String data);
		public List getQuestions(String data);
		public List searchFeedbackMaster(String data);
		public List searchAssessmentAgencyList(String data);
		public List searchAssessorDetail(String data);
		public String changeAssessor(String data);
		
		
		//Holiday Master
		
		public String addHolidayMaster(HolidayMaster p);
		
		public void updateHolidayMaster(HolidayMaster p);
		
		public void removeHolidayMaster(int id);
		
		public HolidayMaster getHolidayMasterById(int id);
		
		public List<HolidayMaster> listHolidayMaster();
		
		
		public String addUnitMaster(UnitMaster p);
		
		public void updateUnitMaster(UnitMaster p);
		
		public void removeUnitMaster(int id);
		
		public UnitMaster getUnitMasterById(int id);
		
		public List<UnitMaster> listUnitMaster();
		
		
		
		

		public String addModuleMaster(ModuleMaster p);
		
		public void updateModuleMaster(ModuleMaster p);
		
		public void removeModuleMaster(int id);
		
		public ModuleMaster getModuleMasterById(int id);
		
		public List<ModuleMaster> listModuleMaster();
		
		
		public String addSubjectMaster(SubjectMaster p);
		
		public void updateSubjectMaster(SubjectMaster p);
		
		public void removeSubjectMaster(int id);
		
		public SubjectMaster getSubjectMasterById(int id);
		
		public List<SubjectMaster> listSubjectMaster();
		
		
		
		
		
		public void addTrainingSchedule(TrainingSchedule p);
		
		public void updateTrainingSchedule(TrainingSchedule p);
		
		public void removeTrainingSchedule(int id);
		public void acceptTrainingSchedule(int id , int profileId,int loginUser2,int userTableId,String operation);
		
		public TrainingSchedule getTrainingScheduleById(int id);
		
		public List<TrainingSchedule> listTrainingSchedule();
		
		public List<PersonalInformationTrainingInstitute> listTrainingInstitude();
		
		public List<TrainingSchedule> listTrainingSchedule(int id,int profileId);
		
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
		
		
		//Trainingpartner Master
		
				public String addTrainingPartner(TrainingPartner p);
				
				public void updateTrainingPartner(TrainingPartner p);
				
				public void removeTrainingPartner(int id);
				
				public TrainingPartner getTrainingPartnerById(int id);
				
				public List<TrainingPartner> listTrainingPartner();
				
				 public List<GenerateCertificateForm> listGenerateCertificate(GenerateCertificateForm generateCertificateForm);

				public List<TrainingClosureForm> listTrainingClosure();
		
				
				 
				 /********************invoice **************************************************/
					
					//Customer Master
					
					public void addCustomerMaster(CustomerMaster p);
					
					public void updateCustomerMaster(CustomerMaster p);
					
					public void removeCustomerMaster(int id);
					
					public CustomerMaster getCustomerMasterById(int id);
					
					public List<CustomerMaster> listCustomerMaster(); 
				  
					
					
					
					//Tax Master
					
					public void addTaxMaster(TaxMaster p);
					
					public void updateTaxMaster(TaxMaster p);
					
					public void removeTaxMaster(int id);
					
					public TaxMaster getTaxMasterById(int id);
					
					public List<TaxMaster> listTaxMaster(); 
				   
				   
				  //EmployeeMonthlyCharges
					public void addEmployeeMonthlyCharges(EmployeeMonthlyCharges p);
					
					public void updateEmployeeMonthlyCharges(EmployeeMonthlyCharges p);
					
					public void removeEmployeeMonthlyCharges(int id);
					
					public EmployeeMonthlyCharges getEmployeeMonthlyChargesById(int id);
					
					public List<EmployeeMonthlyCharges> listEmployeeMonthlyCharges();

				   
					 public List<PersonalInformationTrainee> listEligibleuser(String userType);
					 
					 public String enrollUser(String data);
					
					
					public String assessmentQuestionSave(
							AssessmentQuestionForm assesQuestionForm);

					public List<AssessmentQuestionForm> listAssessmentQuestion(
							AssessmentQuestionForm assesQuestionForm);

					public void removeAssessmentQuestion(int id);

					public AssessmentQuestions getAssessmentQuestionById(int id);
					
					 public String updateCertificate(String data);
					 
					 
					 public String addCustomerDetails(String[] data1 ,String[] data2,  String[] data4 , String customer );

					 public void removeCustomerDetails(int id);
					
					 public List<CustomerDetails> listCustomerDetails();
					 
					 public List<CustomerDetails> getCustomerDetailsByInvoice(String invoice);
					 

						//Invoice Master
						
						public void addInvoiceMaster(InvoiceMasterForm p);
						
						public void updateInvoiceMaster(InvoiceMasterForm p);
						
						public void removeInvoiceMaster(int id);
						
						
						public InvoiceMaster getInvoiceMasterById(int id);
						
						
						public List<InvoiceMaster> listInvoiceMaster(); 
						public List<InvoiceMaster> listCustomCustomerMaster();
						
						public InvoiceInfoForm getInvoiceInfo(String invoice);
}
