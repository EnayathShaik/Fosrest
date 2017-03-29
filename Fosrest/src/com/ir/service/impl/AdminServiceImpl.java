package com.ir.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ir.bean.common.IntStringBean;
import com.ir.dao.AdminDAO;
import com.ir.form.AdminUserManagementForm;
import com.ir.form.AssessmentQuestionForm;
import com.ir.form.AssessorUserManagementForm;
import com.ir.form.ChangePasswordForm;
import com.ir.form.CityForm;
import com.ir.form.ContactTrainee;
import com.ir.form.DistrictForm;
import com.ir.form.GenerateCertificateForm;
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
import com.ir.form.TrainingScheduleForm;
import com.ir.model.AdminUserManagement;
import com.ir.model.CityMaster;
import com.ir.model.CourseName;
import com.ir.model.CourseType;
import com.ir.model.District;
import com.ir.model.DistrictMaster;
import com.ir.model.FeedbackMaster;
import com.ir.model.HolidayMaster;
import com.ir.model.ManageTrainingPartner;
import com.ir.model.ModuleMaster;
import com.ir.model.PersonalInformationAssessor;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.PersonalInformationTrainingPartner;
import com.ir.model.RegionMaster;
import com.ir.model.State;
import com.ir.model.StateMaster;
import com.ir.model.SubjectMaster;
import com.ir.model.TrainingPartner;
import com.ir.model.TrainingSchedule;
import com.ir.model.UnitMaster;
import com.ir.model.admin.TrainerAssessmentSearchForm;
import com.ir.model.trainer.TrainerAssessmentEvaluation;
import com.ir.service.AdminService;


@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	@Qualifier("adminDAO")
	AdminDAO adminDAO; 

	@Override
	@Transactional
	public String stateMasterSave(StateForm stateForm) {
		// TODO Auto-generated method stub
		String stateMasterSave = adminDAO.stateMasterSave(stateForm);
		return stateMasterSave;
	}

	@Override
	@Transactional
	public List<State> stateList() {
		// TODO Auto-generated method stub
		List<State> stateList = adminDAO.stateList();
		return stateList;
	}

	@Override
	@Transactional
	public String districtMasterSave(DistrictForm districtForm) {
		// TODO Auto-generated method stub
		String districtMasterSave = adminDAO.districtMasterSave(districtForm);
		return districtMasterSave;
	}

	@Override
	@Transactional
	public String cityMasterSave(CityForm cityForm) {
		String cityMasterSave = adminDAO.cityMasterSave(cityForm);
		return cityMasterSave;
	}

	@Override
	@Transactional
	public String regionMasterSave(RegionForm regionForm) {
		String regionMasterSave = adminDAO.regionMasterSave(regionForm);
		return regionMasterSave;
	}

	@Override
	@Transactional
	public List<CourseName> courseNameList() {
		List<CourseName> courseNameList = adminDAO.courseNameList();
		return courseNameList;
	}

	@Override
	@Transactional
	public String manageCourse(ManageCourse manageCourse) {
		String manageCourse1 = adminDAO.manageCourse(manageCourse);
		return manageCourse1;
	}

	@Override
	@Transactional
	public List<CourseType> courseTypeList() {
		System.out.println("AdminDao");
		List<CourseType> courseTypeList = adminDAO.courseTypeList();
		return courseTypeList;
	}

	@Override
	@Transactional
	public String manageTrainingPartnerSave(ManageTrainingPartnerForm manageTrainingPartnerForm) {
		// TODO Auto-generated method stub
		String manageTrainingPartnerSave = adminDAO.manageTrainingPartnerSave(manageTrainingPartnerForm);
		return manageTrainingPartnerSave;
	}

	@Override
	@Transactional
	public String manageAssessmentAgencySave(ManageAssessmentAgencyForm manageAssessmentAgencyForm) {
		String manageAssessmentAgencySave = adminDAO.manageAssessmentAgencySave(manageAssessmentAgencyForm);
		return manageAssessmentAgencySave;
	}

	@Override
	@Transactional
	public List<PersonalInformationTrainee> traineeUserManagementSearch(TraineeUserManagementForm traineeUserManagementForm) {
		List<PersonalInformationTrainee> traineeUserManagementSearch = adminDAO.traineeUserManagementSearch(traineeUserManagementForm);
		return traineeUserManagementSearch;
	}
	@Override
	@Transactional
	public List<PersonalInformationTrainer> trainerUserManagementSearch(TrainerUserManagementForm trainerUserManagementForm) {
		List<PersonalInformationTrainer> trainerUserManagementSearch = adminDAO.trainerUserManagementSearch(trainerUserManagementForm);
		return trainerUserManagementSearch;
	}
	
	@Override
	@Transactional
	public List<PersonalInformationAssessor> assessorUserManagementSearch(AssessorUserManagementForm assessorUserManagementForm,Integer profileid,Integer userID) {
		List<PersonalInformationAssessor> assessorUserManagementSearch1 = adminDAO.assessorUserManagementSearch(assessorUserManagementForm,profileid,userID);
		return assessorUserManagementSearch1;
	}
	
	@Override
	@Transactional
	public List<PersonalInformationTrainingPartner> trainingCenterUserManagementSearch(TrainingCenterUserManagementForm trainingCenterUserManagementForm,Integer profileid,Integer userID) {
		List<PersonalInformationTrainingPartner> trainingCenterUserManagementSearch = adminDAO.trainingCenterUserManagementSearch(trainingCenterUserManagementForm,profileid,userID);
		return trainingCenterUserManagementSearch;
	}
	@Override
	@Transactional
	public List<AdminUserManagement> adminUserManagementSearch() {
		List<AdminUserManagement> adminUserManagementSearch = adminDAO.adminUserManagementSearch();
		return adminUserManagementSearch;
	}

	@Override
	@Transactional
	public String adminUserManagementSave(AdminUserManagementForm adminUserManagementForm) {
		String adminUserManagementSave = adminDAO.adminUserManagementSave(adminUserManagementForm);
		return adminUserManagementSave;
	}

	@Override
	@Transactional
	public String manageCourseContentSearch(ManageCourseContentForm manageCourseContentForm) {
		String manageCourseContentSearch = adminDAO.manageCourseContentSearch(manageCourseContentForm);
		return manageCourseContentSearch;
	}

	@Override
	@Transactional
	public List<ManageTrainingPartner> trainingPartnerList() {
		List<ManageTrainingPartner> trainingPartnerList = adminDAO.trainingPartnerList();
		return trainingPartnerList;
	}

	@Override
	@Transactional
	public List<PersonalInformationTrainer> trainingNameList() {
		List<PersonalInformationTrainer> trainingNameList = adminDAO.trainingNameList();
		return trainingNameList;
	}

	@Override
	@Transactional
	public String assessorUserManagementSave(AssessorUserManagementForm assessorUserManagementForm) {
		String assessorUserManagementSave = adminDAO.assessorUserManagementSave(assessorUserManagementForm);
		return assessorUserManagementSave;
	}

	@Override
	@Transactional
	public List<District> districtList() {
		List<District> districtList = adminDAO.districtList();
		return districtList;
	}

	@Override
	@Transactional
	public String trainingCalendarForm(TrainingCalendarForm trainingCalendarForm) {
		String trainingCalendar = adminDAO.trainingCalendarForm(trainingCalendarForm);
		return trainingCalendar;
	}

	@Override
	@Transactional
	public String manageAssessmentQuestionsSave(AssessmentQuestionForm assessmentQuestionForm) {
		String manageAssessmentQuestionsSave = adminDAO.manageAssessmentQuestionsSave(assessmentQuestionForm);
		return manageAssessmentQuestionsSave;
	}
		// Rishi
	@Override
	@Transactional
	public boolean changePasswordadminSave(ChangePasswordForm changePasswordForm, String id) {
		boolean changePasswordadmin = adminDAO.trainingadminForm(changePasswordForm,id);
		return changePasswordadmin;
	}

	@Override
	@Transactional
	public boolean changePasswordTPSave(ChangePasswordForm changePasswordForm, String id) {
		boolean changePasswordadmin = adminDAO.trainingPartnerPass(changePasswordForm,id);
		return changePasswordadmin;
	}

	@Override
	@Transactional
	public String contactTraningPTSave(ContactTrainee contactTrainee, String id) {
		String contactTrainingPTSave = adminDAO.contactTrainigPartnerSave(contactTrainee , id);
		return contactTrainingPTSave;
	}

	@Override
	@Transactional
	public String saveFeedbackMaster(FeedbackMaster feedbackMaster) {
		String saveFeedbackMaster = adminDAO.saveFeedbackMaster(feedbackMaster);
		return saveFeedbackMaster;
	}
	
	@Override
	@Transactional
	public List<IntStringBean> getTrainingCentersByCourse(int courseNameId){
		List <IntStringBean> listTrainingCenters = adminDAO.getTrainingCentersByCourse(courseNameId);
		return listTrainingCenters;
	}
	@Override
	@Transactional
	public List<TrainerAssessmentSearchForm> searchTrainerForAssessmentValidation(int courseNameId, int trainingPartnerId){
		List<TrainerAssessmentSearchForm> list = adminDAO.searchTrainerForAssessmentValidation(courseNameId, trainingPartnerId);
		return list;
	}
	@Override
	@Transactional
	public TrainerAssessmentSearchForm evaluateTrainerAssessment(TrainerAssessmentSearchForm trainerAssessmentForm){
		
		int eligibility = adminDAO.getElegibilityForAssessment(trainerAssessmentForm.getCourseNameId());
		int rating = trainerAssessmentForm.getRating();
		if(eligibility > -1){
			if(rating >= eligibility){
				trainerAssessmentForm.setResult("Pass");
			}else{
				trainerAssessmentForm.setResult("Fail");
			}
		}else{
			trainerAssessmentForm.setResult("Eligibility yet to declare");
		}
		return trainerAssessmentForm;
		
	}
	
	@Override
	@Transactional
	public int saveTrainerAssessment(TrainerAssessmentEvaluation trainerAssessmentEvaluation){
		int assessmentId = adminDAO.saveTrainerAssessment(trainerAssessmentEvaluation);
		return assessmentId;
	}
	//updateUser
	
	@Override
	public void updateUser( String userid , String tableName , String status){
		adminDAO.updateUser(userid ,tableName ,status);
		
	}
	
	//searchManageCourse
	
	
	@Override
	@Transactional
	public List searchManageCourse(String data){
		List courseData = adminDAO.searchManageCourse(data);
		return courseData;
	}
	
	//editManageCourseData
	
	
	@Override
	@Transactional
	public String editManageCourseData(String data){
		String courseData = adminDAO.editManageCourseData(data);
		return courseData;
	}
	
	//editState
	
	@Override
	@Transactional
	public String editState(String data){
		String courseData = adminDAO.editState(data);
		return courseData;
	}
	
	//CheckState
	@Override
	@Transactional
	public String CheckState(String data){
		String courseData = adminDAO.CheckState(data);
		return courseData;
	}
	
	//searchState
	
	@Override
	@Transactional
	public List searchState(String data){
		List<State> courseData = adminDAO.searchState(data);
		return courseData;
	}
	
	
	//onLoadDistrict
	
	@Override
	@Transactional
	public List onLoadDistrict(String data){
		List courseData = adminDAO.onLoadDistrict(data);
		return courseData;
	}
	
	
	//changeStatusDistrict
	
	@Override
	@Transactional
	public String changeStatusDistrict(String data){
		String courseData = adminDAO.changeStatusDistrict(data);
		return courseData;
	}
	
	//searchDistrict
	
	@Override
	@Transactional
	public List searchDistrict(String data){
		List courseData = adminDAO.searchDistrict(data);
		return courseData;
	}
	
	//editCityData
	
	@Override
	@Transactional
	public String editCityData(String data){
		String courseData = adminDAO.editCityData(data);
		return courseData;
	}
	
	//searchCity
	
	@Override
	@Transactional
	public List searchCity(String data){
		List courseData = adminDAO.searchCity(data);
		return courseData;
	}
	
	//onLoadRegion
	
	@Override
	@Transactional
	public List onLoadRegion(String data){
		List courseData = adminDAO.onLoadRegion(data);
		return courseData;
	}
	
	//editRegionData
	
	@Override
	@Transactional
	public String editRegionData(String data){
		String courseData = adminDAO.editRegionData(data);
		return courseData;
	}
	
	//traineeAssessmentCalender
	
	@Override
	@Transactional
	public List traineeAssessmentCalender(String data){
		List courseData = adminDAO.traineeAssessmentCalender(data);
		return courseData;
	}
	
	//getQuestions
	@Override
	@Transactional
	public List getQuestions(String data){
		List courseData = adminDAO.getQuestions(data);
		return courseData;
	}
	
	//searchFeedbackMaster

	@Override
	@Transactional
	public List searchFeedbackMaster(String data){
		List courseData = adminDAO.searchFeedbackMaster(data);
		return courseData;
	}
	
	//searchAssessmentAgencyList
	
	
	@Override
	@Transactional
	public List searchAssessmentAgencyList(String data){
		List courseData = adminDAO.searchAssessmentAgencyList(data);
		return courseData;
	}
	
//	/searchAssessorDetail
	
	@Override
	@Transactional
	public List searchAssessorDetail(String data){
		List courseData = adminDAO.searchAssessorDetail(data);
		return courseData;
	}
	
	//changeAssessor
	@Override
	@Transactional
	public String changeAssessor(String data){
		String courseData = adminDAO.changeAssessor(data);
		return courseData;
	}	
	
	
	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For Holiday Master
	 */
	
	@Override
	@Transactional
	public void addHolidayMaster(HolidayMaster p){
		 this.adminDAO.addHolidayMaster(p);
		
	}
	
	//updateHolidayMaster
	@Override
	@Transactional
	public void updateHolidayMaster(HolidayMaster p){
		 this.adminDAO.updateHolidayMaster(p);
		
	}
	
	//removeHolidayMaster
	
	@Override
	@Transactional
	public void removeHolidayMaster(int id){
		 this.adminDAO.removeHolidayMaster(id);
		
	}
	
//	/getHolidayMasterById
	@Override
	@Transactional
	public HolidayMaster getHolidayMasterById(int id){
		return this.adminDAO.getHolidayMasterById(id);
		
	}
	
	//listHolidayMaster
	
	@Override
	@Transactional
	public List<HolidayMaster> listHolidayMaster() {
		// TODO Auto-generated method stub
		return this.adminDAO.listHolidayMaster();
	}
	
	
	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For Unit Master
	 */

	@Override
	@Transactional
	public void addUnitMaster(UnitMaster p){
		 this.adminDAO.addUnitMaster(p);
		
	}
	
	//updateUnitMaster
	@Override
	@Transactional
	public void updateUnitMaster(UnitMaster p){
		 this.adminDAO.updateUnitMaster(p);
		
	}
	
	//removeUnitMaster
	
	@Override
	@Transactional
	public void removeUnitMaster(int id){
		 this.adminDAO.removeUnitMaster(id);
		
	}
	
//	/getUnitMasterById
	@Override
	@Transactional
	public UnitMaster getUnitMasterById(int id){
		return this.adminDAO.getUnitMasterById(id);
		
	}
	
	//listUnitMaster
	
	@Override
	@Transactional
	public List<UnitMaster> listUnitMaster() {
		// TODO Auto-generated method stub
		return this.adminDAO.listUnitMaster();
	}
	
	
	
	
	
	
	
	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For Module Master
	 */

	@Override
	@Transactional
	public void addModuleMaster(ModuleMaster p){
		 this.adminDAO.addModuleMaster(p);
		
	}
	
	//updateModuleMaster
	@Override
	@Transactional
	public void updateModuleMaster(ModuleMaster p){
		 this.adminDAO.updateModuleMaster(p);
		
	}
	
	//removeModuleMaster
	
	@Override
	@Transactional
	public void removeModuleMaster(int id){
		 this.adminDAO.removeModuleMaster(id);
		
	}
	
//	/getModuleMasterById
	@Override
	@Transactional
	public ModuleMaster getModuleMasterById(int id){
		return this.adminDAO.getModuleMasterById(id);
		
	}
	
	//listModuleMaster
	
	@Override
	@Transactional
	public List<ModuleMaster> listModuleMaster() {
		// TODO Auto-generated method stub
		return this.adminDAO.listModuleMaster();
	}
	
	
	
	

	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For Subject Master
	 */

	@Override
	@Transactional
	public void addSubjectMaster(SubjectMaster p){
		 this.adminDAO.addSubjectMaster(p);
		
	}
	
	//updateSubjectMaster
	@Override
	@Transactional
	public void updateSubjectMaster(SubjectMaster p){
		 this.adminDAO.updateSubjectMaster(p);
		
	}
	
	//removeSubjectMaster
	
	@Override
	@Transactional
	public void removeSubjectMaster(int id){
		 this.adminDAO.removeSubjectMaster(id);
		
	}
	
//	/getSubjectMasterById
	@Override
	@Transactional
	public SubjectMaster getSubjectMasterById(int id){
		return this.adminDAO.getSubjectMasterById(id);
		
	}
	

	//listSubjectMaster
	
	@Override
	@Transactional
	public List<SubjectMaster> listSubjectMaster() {
		// TODO Auto-generated method stub
		return this.adminDAO.listSubjectMaster();
	}
	
	
	

	

	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For TrainingSchedule
	 */

	@Override
	@Transactional
	public void addTrainingSchedule(TrainingSchedule p){
		 this.adminDAO.addTrainingSchedule(p);
		
	}
	
	//updateTrainingSchedule
	@Override
	@Transactional
	public void updateTrainingSchedule(TrainingSchedule p){
		 this.adminDAO.updateTrainingSchedule(p);
		
	}
	
	//removeTrainingSchedule
	
	@Override
	@Transactional
	public void removeTrainingSchedule(int id){
		 this.adminDAO.removeTrainingSchedule(id);
		
	}
	
//	/getTrainingScheduleById
	@Override
	@Transactional
	public TrainingSchedule getTrainingScheduleById(int id){
		return this.adminDAO.getTrainingScheduleById(id);
		
	}
	
	@Override
	@Transactional
	public List<PersonalInformationTrainingInstitute> listTrainingInstitude(){
		return this.adminDAO.listTrainingInstitude();
		
	}
	
	
	
	@Override
	@Transactional
	public List<TrainingSchedule> listTrainingSchedule() {
		// TODO Auto-generated method stub
		return this.adminDAO.listTrainingSchedule();
	}
	
	
	
	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For State Master
	 */
	
	@Override
	@Transactional
	public void addStateMaster(StateMaster p){
		 this.adminDAO.addStateMaster(p);
		
	}
	
	//updateStateMaster
	@Override
	@Transactional
	public void updateStateMaster(StateMaster p){
		 this.adminDAO.updateStateMaster(p);
		
	}
	
	//removeStateMaster
	
	@Override
	@Transactional
	public void removeStateMaster(int id){
		 this.adminDAO.removeStateMaster(id);
		
	}
	
//	/getStateMasterById
	@Override
	@Transactional
	public StateMaster getStateMasterById(int id){
		return this.adminDAO.getStateMasterById(id);
		
	}
	
	//listStateMaster
	
	@Override
	@Transactional
	public List<StateMaster> listStateMaster() {
		// TODO Auto-generated method stub
		return this.adminDAO.listStateMaster();
	}
	
	
	
	
	
	

	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For District Master
	 */
	
	@Override
	@Transactional
	public void addDistrictMaster(DistrictMaster p){
		 this.adminDAO.addDistrictMaster(p);
		
	}
	
	//updateDistrictMaster
	@Override
	@Transactional
	public void updateDistrictMaster(DistrictMaster p){
		 this.adminDAO.updateDistrictMaster(p);
		
	}
	
	//removeDistrictMaster
	
	@Override
	@Transactional
	public void removeDistrictMaster(int id){
		 this.adminDAO.removeDistrictMaster(id);
		
	}
	
//	/getDistrictMasterById
	@Override
	@Transactional
	public DistrictMaster getDistrictMasterById(int id){
		return this.adminDAO.getDistrictMasterById(id);
		
	}
	
	//listDistrictMaster
	
	@Override
	@Transactional
	public List<DistrictMaster> listDistrictMaster() {
		// TODO Auto-generated method stub
		return this.adminDAO.listDistrictMaster();
	}
	

	
	
	
	
	

	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For City Master
	 */
	
	@Override
	@Transactional
	public void addCityMaster(CityMaster p){
		 this.adminDAO.addCityMaster(p);
		
	}
	
	//updateCityMaster
	@Override
	@Transactional
	public void updateCityMaster(CityMaster p){
		 this.adminDAO.updateCityMaster(p);
		
	}
	
	//removeCityMaster
	
	@Override
	@Transactional
	public void removeCityMaster(int id){
		 this.adminDAO.removeCityMaster(id);
		
	}
	
//	/getCityMasterById
	@Override
	@Transactional
	public CityMaster getCityMasterById(int id){
		return this.adminDAO.getCityMasterById(id);
		
	}
	
	//listCityMaster
	
	@Override
	@Transactional
	public List<CityMaster> listCityMaster() {
		// TODO Auto-generated method stub
		return this.adminDAO.listCityMaster();
	}
	
	
	
	
	
	

	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For Region Master
	 */
	
	@Override
	@Transactional
	public void addRegionMaster(RegionMaster p){
		 this.adminDAO.addRegionMaster(p);
		
	}
	
	//updateRegionMaster
	@Override
	@Transactional
	public void updateRegionMaster(RegionMaster p){
		 this.adminDAO.updateRegionMaster(p);
		
	}
	
	//removeRegionMaster
	
	@Override
	@Transactional
	public void removeRegionMaster(int id){
		 this.adminDAO.removeRegionMaster(id);
		
	}
	
//	/getRegionMasterById
	@Override
	@Transactional
	public RegionMaster getRegionMasterById(int id){
		return this.adminDAO.getRegionMasterById(id);
		
	}
	
	//listRegionMaster
	
	@Override
	@Transactional
	public List<RegionMaster> listRegionMaster() {
		// TODO Auto-generated method stub
		return this.adminDAO.listRegionMaster();
	}
	
	
	
	/**
	 * @author Jyoti Mekal
	 *
	 * Impl For Holiday Master
	 */
	
	@Override
	@Transactional
	public void addTrainingPartner(TrainingPartner p){
		 this.adminDAO.addTrainingPartner(p);
		
	}
	
	//updateTrainingPartner
	@Override
	@Transactional
	public void updateTrainingPartner(TrainingPartner p){
		 this.adminDAO.updateTrainingPartner(p);
		
	}
	
	//removeTrainingPartner
	
	@Override
	@Transactional
	public void removeTrainingPartner(int id){
		 this.adminDAO.removeTrainingPartner(id);
		
	}
	
//	/getTrainingPartnerById
	@Override
	@Transactional
	public TrainingPartner getTrainingPartnerById(int id){
		return this.adminDAO.getTrainingPartnerById(id);
		
	}
	
	//listTrainingPartner
	
	@Override
	@Transactional
	public List<TrainingPartner> listTrainingPartner() {
		// TODO Auto-generated method stub
		return this.adminDAO.listTrainingPartner();
	}
	
	//listGenerateCertificate
	
	
		@Override
		@Transactional
		public List<GenerateCertificateForm> listGenerateCertificate() {
			// TODO Auto-generated method stub
			return this.adminDAO.listGenerateCertificate();
		}
	
	
	
}
