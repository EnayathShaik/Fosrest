package com.ir.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.ir.bean.common.IntStringBean;
import com.ir.constantes.TableLink;
import com.ir.form.AdminUserManagementForm;
import com.ir.form.AssessmentQuestionForm;
import com.ir.form.AssessmentQuestionForm_old;
import com.ir.form.AssessorUserManagementForm;
import com.ir.form.ChangePasswordForm;
import com.ir.form.CityForm;
import com.ir.form.CityMasterForm;
import com.ir.form.ContactTrainee;
import com.ir.form.DistrictForm;
import com.ir.form.DistrictMasterForm;
import com.ir.form.GenerateCertificateForm;
import com.ir.form.GenerateCourseCertificateForm;
import com.ir.form.HolidayMasterForm;
import com.ir.form.InvoiceInfoForm;
import com.ir.form.InvoiceMasterForm;
import com.ir.form.ManageAssessmentAgencyForm;
import com.ir.form.ManageCourse;
import com.ir.form.ManageCourseContentForm;
import com.ir.form.ManageTrainingPartnerForm;
import com.ir.form.ModuleMasterForm;
import com.ir.form.NominateTraineeForm;
import com.ir.form.RegionForm;
import com.ir.form.RegionMasterForm;
import com.ir.form.StateForm;
import com.ir.form.TraineeUserManagementForm;
import com.ir.form.TrainerUserManagementForm;
import com.ir.form.TrainingCalendarForm;
import com.ir.form.TrainingCenterUserManagementForm;
import com.ir.form.TrainingClosureForm;
import com.ir.form.TrainingScheduleForm;
import com.ir.form.UpdateTrainerAssessmentForm;
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
import com.ir.model.TaxMaster;
import com.ir.model.TrainingPartner;
import com.ir.model.TrainingSchedule;
import com.ir.model.UnitMaster;
import com.ir.model.admin.TrainerAssessmentSearchForm;
import com.ir.model.trainer.TrainerAssessmentEvaluation;
import com.ir.service.AdminService;
import com.ir.service.PageLoadService;
import com.itextpdf.text.log.SysoCounter;
import com.zentech.backgroundservices.Mail;
import com.zentech.logger.ZLogger;
import com.zentect.list.constant.DropDownListConstants;
import com.zentect.list.constant.ListConstant;
import com.ir.model.InvoiceMaster;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("adminService")
	AdminService adminService;

	@Autowired
	@Qualifier("pageLoadService")
	PageLoadService pageLoadService;

	ListConstant lst = new ListConstant();

	@RequestMapping(value = "/stateMaster", method = RequestMethod.GET)
	public String stateMaster(
			@ModelAttribute("stateMaster") StateForm stateForm, Model model,
			HttpSession session) {
		try {
			model.addAttribute("created", " ");
			session.setAttribute("created", " ");
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("stateMaster", "Exception while stateMaster :  "
					+ e.getMessage(), "AdminController.java");
		}
		return "stateMaster";
	}

	@RequestMapping(value = "/stateMasterSave", method = RequestMethod.POST)
	public String stateSave(
			@Valid @ModelAttribute("stateMaster") StateForm stateForm,
			BindingResult result, Model model, HttpSession session) {

		if (result.hasErrors()) {

			new ZLogger("stateSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("stateSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "stateMaster";
		}
		try {
			String stateMasterSave = adminService.stateMasterSave(stateForm);
			if (stateMasterSave.equalsIgnoreCase("created")) {
				model.addAttribute("created",
						" State insertion successfull !!!");
				model.addAttribute("stateMaster", new StateForm());
			} else {
				model.addAttribute("created",
						"State already exists in reord !!!");
				// session.setAttribute("created" ,
				// "State already exists in reord !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("stateMasterSave",
					"Exception while stateMasterSave :  " + e.getMessage(),
					"AdminController.java");
		}
		return "stateMaster";
	}

	@RequestMapping(value = "/stateMasterSave", method = RequestMethod.GET)
	public String showForm() {

		return "redirect:stateMaster.fssai";
	}

	@RequestMapping(value = "/districtMaster", method = RequestMethod.GET)
	public String districtMaster(
			@ModelAttribute("districtMaster") DistrictForm districtForm,
			Model model, HttpSession session) {
		List<State> stateList = null;
		try {
			stateList = adminService.stateList();
			model.addAttribute("stateList", stateList);
			model.addAttribute("created", " ");
			session.setAttribute("created", " ");
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("districtMaster", "Exception while districtMaster :  "
					+ e.getMessage(), "AdminController.java");
		}
		return "districtMaster";
	}

	
	@RequestMapping(value = "/districtMasterSave", method = RequestMethod.POST)
	public String districtMasterSave(
			@Valid @ModelAttribute("districtMaster") DistrictForm districtForm,
			BindingResult result, Model model, HttpSession session) {

		if (result.hasErrors()) {
			new ZLogger("districtMasterSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("districtMasterSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "districtMaster";
		}
		try {
			String districtMasterSave = adminService
					.districtMasterSave(districtForm);
			if (districtMasterSave.equalsIgnoreCase("created")) {
				model.addAttribute("created",
						"District inserted successfully !!!");
				model.addAttribute("districtMaster", new DistrictForm());
			} else {
				model.addAttribute("created",
						"District already exists in records !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("districtMasterSave",
					"Exception while districtMasterSave :  " + e.getMessage(),
					"AdminController.java");
		}
		return "districtMaster";
	}

	@RequestMapping(value = "/districtMasterSave", method = RequestMethod.GET)
	public String showDistrctForm() {

		return "redirect:districtMaster.fssai";
	}

	@RequestMapping(value = "/cityMaster", method = RequestMethod.GET)
	public String districtMaster(
			@ModelAttribute("cityMaster") CityForm cityForm, Model model) {
		List<State> stateList = adminService.stateList();
		List<District> districtList = adminService.districtList();
		model.addAttribute("districtList", districtList);
		model.addAttribute("stateList", stateList);
		return "cityMaster";
	}

	@RequestMapping(value = "/cityMasterSave", method = RequestMethod.POST)
	public String cityMasterSave(
			@Valid @ModelAttribute("cityMaster") CityForm cityForm,
			BindingResult result, Model model) {

		if (result.hasErrors()) {
			new ZLogger("cityMasterSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("cityMasterSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");

			return "cityMaster";
		}
		try {
			String cityMasterSave = adminService.cityMasterSave(cityForm);
			if (cityMasterSave.equalsIgnoreCase("created")) {
				model.addAttribute("created", " City insertion successfull !!!");
				model.addAttribute("cityMaster", new CityForm());
			} else {
				model.addAttribute("created", " City already exists !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("cityMasterSave", "Exception while cityMasterSave :  "
					+ e.getMessage(), "AdminController.java");
		}
		return "cityMaster";
	}

	@RequestMapping(value = "/cityMasterSave", method = RequestMethod.GET)
	public String showCityForm() {

		return "redirect:cityMaster.fssai";

	}

	@RequestMapping(value = "/regionMappingMaster", method = RequestMethod.GET)
	public String districtMaster(
			@ModelAttribute("regionMappingMaster") RegionForm regionForm,
			Model model) {
		List<State> stateList = adminService.stateList();
		model.addAttribute("stateList", stateList);
		return "regionMappingMaster";
	}

	@RequestMapping(value = "/regionMasterSave", method = RequestMethod.POST)
	public String regionMasterSave(
			@Valid @ModelAttribute("regionMappingMaster") RegionForm regionForm,
			BindingResult result, Model model, HttpSession session) {

		if (result.hasErrors()) {
			new ZLogger("regionMasterSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("regionMasterSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");

			return "regionMappingMaster";
		}
		try {
			String regionMasterSave = adminService.regionMasterSave(regionForm);
			if (regionMasterSave.equalsIgnoreCase("Oops")) {
				model.addAttribute("created",
						"Region already mapped with this district !!!");
			} else {
				model.addAttribute("created",
						"Region name successfully mapped !!!");
				model.addAttribute("regionMappingMaster", new RegionForm());
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("regionMasterSave",
					"Exception while regionMasterSave :  " + e.getMessage(),
					"AdminController.java");
		}
		return "regionMappingMaster";
	}

	@RequestMapping(value = "/regionMasterSave", method = RequestMethod.GET)
	public String showregionForm() {

		return "redirect:regionMappingMaster.fssai";

	}

	@RequestMapping(value = "/manageCourse", method = RequestMethod.GET)
	public String districtMaster(
			@ModelAttribute("manageCourse") ManageCourse manageCourse,
			Model model) throws JsonGenerationException, JsonMappingException,
			IOException {
		List<CourseType> courseTypeList = pageLoadService.courseTypeList();
		model.addAttribute("courseTypeList", courseTypeList);
		return "manageCourse";
	}

	@RequestMapping(value = "/manageCourse", method = RequestMethod.POST)
	public String manageCourse(
			@Valid @ModelAttribute("manageCourse") ManageCourse manageCourse,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("manageCourse", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("manageCourse", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");

			return "manageCourse";
		}
		try {
			String manageCourse1 = adminService.manageCourse(manageCourse);
			if (manageCourse1.equalsIgnoreCase("created")) {
				model.addAttribute("created",
						"New course inserted successfully !!!");
				model.addAttribute("manageCourse", new ManageCourse());
			} else {
				model.addAttribute("created",
						"This course already inserted !!!");
				model.addAttribute("manageCourse", new ManageCourse());
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("manageCourse", "Exception while manageCourse :  "
					+ e.getMessage(), "AdminController.java");
		}
		return "redirect:manageCourse.fssai";
	}

	@RequestMapping(value = "/manageTrainingPartnerForm", method = RequestMethod.GET)
	public String manageTrainingPartnerForm(
			@ModelAttribute("manageTrainingPartnerForm") ManageTrainingPartnerForm manageTrainingPartnerForm,
			Model model) {
		List<State> stateList = adminService.stateList();
		model.addAttribute("stateList", stateList);
		return "manageTrainingPartnerForm";
	}

	@RequestMapping(value = "/manageTrainingPartnerSave", method = RequestMethod.POST)
	public String manageTrainingPartnerSave(
			@Valid @ModelAttribute("manageTrainingPartnerForm") ManageTrainingPartnerForm manageTrainingPartnerForm,
			BindingResult result, Model model, SessionStatus status) {

		if (result.hasErrors()) {
			new ZLogger("manageTrainingPartnerSave",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("manageTrainingPartnerSave",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");

			return "manageTrainingPartnerForm";
		}
		String email = manageTrainingPartnerForm.getEmail();
		String manageTrainingPartnerSave = adminService
				.manageTrainingPartnerSave(manageTrainingPartnerForm);
		if (manageTrainingPartnerSave != null
				&& !manageTrainingPartnerSave.equalsIgnoreCase("")) {
			String[] all = manageTrainingPartnerSave.split("&");
			model.addAttribute("id", all[1]);
			model.addAttribute("pwd", all[0]);
			new Thread(new Mail("Thanks", email, all[1], all[0],
					manageTrainingPartnerForm.getTrainingPartnerName()))
					.start();
			return "welcomeManageTrainingPartner";
		} else {
			model.addAttribute("id", "User id created successfully !!");
			model.addAttribute("pwd", "User id created successfully !!");
			return "redirect:manageTrainingPartnerForm";
		}
	}

	@RequestMapping(value = "/manageAssessmentAgencyForm", method = RequestMethod.GET)
	public String manageAssessmentAgencyForm(
			@ModelAttribute("manageAssessmentAgencyForm") ManageAssessmentAgencyForm manageAssessmentAgencyForm,
			Model model) {
		List<State> stateList = adminService.stateList();
		model.addAttribute("stateList", stateList);
		return "manageAssessmentAgencyForm";
	}

	@RequestMapping(value = "/manageAssessmentAgencySave", method = RequestMethod.POST)
	public String manageAssessmentAgencySave(
			@Valid @ModelAttribute("manageAssessmentAgencyForm") ManageAssessmentAgencyForm manageAssessmentAgencyForm,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("manageAssessmentAgencySave",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("manageAssessmentAgencySave",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");
			return "manageAssessmentAgencyForm";
		}
		new ZLogger("manageAssessmentAgencySave", " state  "
				+ manageAssessmentAgencyForm.getStateId(),
				"AdminController.java");
		new ZLogger("manageAssessmentAgencySave", " stcityate  "
				+ manageAssessmentAgencyForm.getDistrict(),
				"AdminController.java");
		String manageAssessmentAgencySave = adminService
				.manageAssessmentAgencySave(manageAssessmentAgencyForm);
		if (manageAssessmentAgencySave != null
				&& !manageAssessmentAgencySave.equalsIgnoreCase("")) {
			String[] all = manageAssessmentAgencySave.split("&");
			model.addAttribute("id", all[1]);
			model.addAttribute("pwd", all[0]);
			new Thread(new Mail("Thanks",
					manageAssessmentAgencyForm.getEmail(), all[1], all[0],
					manageAssessmentAgencyForm.getAssessmentAgencyName()))
					.start();
			return "welcomeManageTrainingPartner";
		} else {
			model.addAttribute("id", "User id created successfully !!");
			model.addAttribute("pwd", "User id created successfully !!");
			return "redirect:manageAssessmentAgencyForm";
		}
	}

	@RequestMapping(value = "/traineeUserManagementForm", method = RequestMethod.GET)
	public String traineeUserManagementForm(
			@ModelAttribute("traineeUserManagementForm") TraineeUserManagementForm traineeUserManagementForm) {
		return "traineeUserManagementForm";
	}

	@RequestMapping(value = "/traineeUserManagementSearch", method = RequestMethod.POST)
	public String traineeUserManagementSearch(
			@Valid @ModelAttribute("traineeUserManagementForm") TraineeUserManagementForm traineeUserManagementForm,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("traineeUserManagementSearch",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("traineeUserManagementSearch",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");
			return "traineeUserManagementForm";
		}
		try {
			List<PersonalInformationTrainee> traineeUserManagementSearch = adminService
					.traineeUserManagementSearch(traineeUserManagementForm);
			if (traineeUserManagementSearch != null
					&& traineeUserManagementSearch.size() > 0) {
				model.addAttribute("searchTraineeUsermanagement",
						traineeUserManagementSearch);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("traineeUserManagementSearch",
					"Exception while traineeUserManagementSearch :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "traineeUserManagementForm";
	}

	@RequestMapping(value = "/trainerUserManagementForm", method = RequestMethod.GET)
	public String trainerUserManagementForm(
			@ModelAttribute("trainerUserManagementForm") TrainerUserManagementForm trainerUserManagementForm) {
		return "trainerUserManagementForm";
	}

	@RequestMapping(value = "/trainingCenterUserManagementForm", method = RequestMethod.GET)
	public String adminUserManagementForm(
			@ModelAttribute("trainingCenterUserManagementForm") TrainingCenterUserManagementForm trainerUserManagementForm) {
		return "trainingCenterUserManagementForm";
	}

	@RequestMapping(value = "/assessorUserManagementForm", method = RequestMethod.GET)
	public String assessorUserManagementForm(Model model) {
		try {
			AssessorUserManagementForm assessorUserManagementForm = new AssessorUserManagementForm();
			model.addAttribute("assessorUserManagementForm",
					assessorUserManagementForm);
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("assessorUserManagementForm",
					"Exception while assessorUserManagementForm :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "assessorUserManagementForm";
	}

	@RequestMapping(value = "/traineeRegistration", method = RequestMethod.GET)
	public String traineeRegistration(Model model) {
		try {
			PersonalInformationTrainee personalInformationTrainee = new PersonalInformationTrainee();
			model.addAttribute("traineeRegistration",
					personalInformationTrainee);
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("traineeRegistration",
					"Exception while traineeRegistration :  " + e.getMessage(),
					"AdminController.java");
		}
		return "traineeRegistration";
	}

	@RequestMapping(value = "/adminUserManagementForm", method = RequestMethod.GET)
	public String adminUserManagementForm(Model model) {
		try {
			AdminUserManagementForm adminUserManagementForm = new AdminUserManagementForm();
			model.addAttribute("adminUserManagementForm",
					adminUserManagementForm);
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("adminUserManagementForm",
					"Exception while adminUserManagementForm :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "adminUserManagementForm";
	}

	@RequestMapping(value = "/adminUserManagementSave", method = RequestMethod.POST)
	public String adminUserManagementSave(
			@Valid @ModelAttribute("adminUserManagementForm") AdminUserManagementForm adminUserManagementForm,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("adminUserManagementSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("adminUserManagementSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "adminUserManagementForm";
		}
		try {
			String adminUserManagementSave = adminService
					.adminUserManagementSave(adminUserManagementForm);
			if (adminUserManagementSave.equalsIgnoreCase("created")) {
				model.addAttribute("created", "UserId created successfully !!!");
			} else {
				model.addAttribute("created", "This user Id already exists !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("adminUserManagementSave",
					"Exception while adminUserManagementSave :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "adminUserManagementForm";
	}

	@RequestMapping(value = "/assessorUserManagementSave", method = RequestMethod.POST)
	public String assessorUserManagementSave(
			@Valid @ModelAttribute("assessorUserManagementForm") AssessorUserManagementForm assessorUserManagementForm,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("assessorUserManagementSave",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("assessorUserManagementSave",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");

			return "registrationFormAssessor";
		}
		try {
			String assessorUserManagement = adminService
					.assessorUserManagementSave(assessorUserManagementForm);
			if (assessorUserManagement.equalsIgnoreCase("created")) {
				model.addAttribute("created", "UserId created successfully !!!");
			} else {
				model.addAttribute("error", "Already exists !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("assessorUserManagementSave",
					"Exception while assessorUserManagementSave :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "registrationFormAssessor";
	}

	@RequestMapping(value = "/manageCourseContent", method = RequestMethod.GET)
	public String manageCourseContent(
			@ModelAttribute("manageCourseContent") ManageCourseContentForm manageCourseContentForm,
			Model model) {
		new ZLogger("manageCourseContent",
				"admin Controller manage course content form begin .",
				"AdminController.java");
		List<CourseType> courseTypeList = pageLoadService.courseTypeList();
		model.addAttribute("courseTypeList", courseTypeList);
		return "manageCourseContent";
	}

	@RequestMapping(value = "/manageCourseContentSearch", method = RequestMethod.POST)
	public String manageCourseContentSearch(
			@Valid @ModelAttribute("manageCourseContent") ManageCourseContentForm manageCourseContentForm,
			BindingResult result, Model model, HttpSession session) {
		if (result.hasErrors()) {
			new ZLogger("manageCourseContentSearch",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("manageCourseContentSearch",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");
			return "manageCourseContent";
		}
		try {
			String manageCourseContentSearch = adminService
					.manageCourseContentSearch(manageCourseContentForm);
			if (manageCourseContentSearch.equalsIgnoreCase("created")) {
				model.addAttribute("created", "Data inserted successfully !!!");
				model.addAttribute("manageCourseContent",
						new ManageCourseContentForm());
			} else {
				model.addAttribute("created", "Data updated successfully !!!");
				model.addAttribute("manageCourseContent",
						new ManageCourseContentForm());
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("manageCourseContentSearch",
					"Exception while manageCourseContentSearch :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "redirect:manageCourseContent.fssai";
	}

	@RequestMapping(value = "/trainingCalendarForm", method = RequestMethod.GET)
	public String trainingCalendarForm(Model model) {
		try {
			TrainingCalendarForm trainingCalendarForm = new TrainingCalendarForm();
			model.addAttribute("trainingCalendarForm", trainingCalendarForm);
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger(
					"trainingCalendarForm",
					"Exception while trainingCalendarForm :  " + e.getMessage(),
					"AdminController.java");
		}
		return "trainingCalendarForm";
	}

	@RequestMapping(value = "/trainingCalenderSave", method = RequestMethod.POST)
	public String trainingCalenderSave(
			@Valid @ModelAttribute("trainingCalendarForm") TrainingCalendarForm trainingCalendarForm,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("trainingCalenderSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("trainingCalenderSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");

			return "trainingCalendarForm";
		}
		try {

			String trainingCalendar = adminService
					.trainingCalendarForm(trainingCalendarForm);
			if (trainingCalendar.equalsIgnoreCase("created")) {
				model.addAttribute("created", "Calender saved successfully !!!");
				model.addAttribute("trainingCalendarForm",
						new TrainingCalendarForm());
			} else {
				model.addAttribute("created", "Oops , something went wrong !!!");
				model.addAttribute("trainingCalendarForm",
						new TrainingCalendarForm());
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger(
					"trainingCalenderSave",
					"Exception while trainingCalenderSave :  " + e.getMessage(),
					"AdminController.java");
		}

		return "trainingCalendarForm";
	}

	@RequestMapping(value = "/trainerUserManagementSearch", method = RequestMethod.POST)
	public String trainerUserManagementSave(
			@Valid @ModelAttribute("trainerUserManagementForm") TrainerUserManagementForm trainerUserManagementForm,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("trainerUserManagementSearch",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("trainerUserManagementSearch",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");
			return "trainerUserManagementForm";
		}
		try {
			List<PersonalInformationTrainer> trainerUserManagementSearch = adminService
					.trainerUserManagementSearch(trainerUserManagementForm);
			if (trainerUserManagementSearch != null
					&& trainerUserManagementSearch.size() > 0) {
				model.addAttribute("searchTrainerUsermanagement",
						trainerUserManagementSearch);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("trainerUserManagementSearch",
					"Exception while trainerUserManagementSearch :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "trainerUserManagementForm";
	}

	@RequestMapping(value = "/trainingCetnterUserManagementSearch", method = RequestMethod.POST)
	public String trainingCetnterUserManagementSearch(
			@Valid @ModelAttribute("trainingCenterUserManagementForm") TrainingCenterUserManagementForm trainingCenterUserManagementForm,
			BindingResult result, HttpSession httpSession, Model model) {
		if (result.hasErrors()) {
			new ZLogger("trainingCetnterUserManagementSearch",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("trainingCetnterUserManagementSearch",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");
			return "trainingCenterUserManagementForm";
		}
		Integer profileId = 0;
		Integer userId = 0;
		try {
			profileId = (Integer) httpSession.getAttribute("profileId");
			userId = (Integer) httpSession.getAttribute("userId");
			List<PersonalInformationTrainingInstitute> trainingCetnterUserManagementSearch = adminService
					.trainingCenterUserManagementSearch(
							trainingCenterUserManagementForm, profileId, userId);
			if (trainingCetnterUserManagementSearch != null
					&& trainingCetnterUserManagementSearch.size() > 0) {
				model.addAttribute("searchTrainingCenterUsermanagement",
						trainingCetnterUserManagementSearch);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("trainingCetnterUserManagementSearch",
					"Exception while trainingCetnterUserManagementSearch :  "
							+ e.getMessage(), "AdminController.java");

		}
		return "trainingCenterUserManagementForm";
	}

	@RequestMapping(value = "/assessorUserManagementSearch", method = RequestMethod.POST)
	public String assessorUserManagementSearch(
			@Valid @ModelAttribute("assessorUserManagementForm") AssessorUserManagementForm assessorUserManagementForm,
			BindingResult result, HttpSession httpSession, Model model) {
		if (result.hasErrors()) {

			new ZLogger("assessorUserManagementSearch",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("assessorUserManagementSearch",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");
			return "assessorUserManagementForm";
		}
		Integer profileId = 0;
		Integer userId = 0;
		try {
			profileId = (Integer) httpSession.getAttribute("profileId");
			userId = (Integer) httpSession.getAttribute("userId");
			List<PersonalInformationAssessor> assessorUserManagementSearch = adminService
					.assessorUserManagementSearch(assessorUserManagementForm,
							profileId, userId);
			if (assessorUserManagementSearch != null
					&& assessorUserManagementSearch.size() > 0) {
				model.addAttribute("searchassessorUsermanagement",
						assessorUserManagementSearch);
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("trainingCetnterUserManagementSearch",
					"Exception while assessorUserManagementSearch  :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "assessorUserManagementForm";
	}

	/*
	 * @ModelAttribute("searchAdminUserManagement") public
	 * List<AdminUserManagement> searchAdminUserManagement() {
	 * List<AdminUserManagement> searchAdminUserManagement = adminService
	 * .adminUserManagementSearch(); return searchAdminUserManagement;
	 * 
	 * }
	 */

	/*
	 * @RequestMapping(value="/searchManageCourse") public void getList( Model
	 * model) throws JsonGenerationException, JsonMappingException, IOException{
	 * List<CourseName> courseName = adminService.courseNameList(); ObjectMapper
	 * mapper = new ObjectMapper(); model.addAttribute("courseName",
	 * mapper.writeValueAsString(courseName)); }
	 */
	@RequestMapping(value = "/onLoadTrainingPartnerCenterId")
	public String onLoadTrainingPartnerCenterId(@RequestParam("id") int id,
			HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		new ZLogger("onLoadTrainingPartnerCenterId", "id   ::::  " + id,
				"AdminController.java");
		req.getRequestDispatcher("onLoadTrainingPartnerCenterId?id=" + id)
				.forward(req, res);
		return "dashboardTrainingPartnerPending";
	}

	// Rishi
	@RequestMapping(value = "/changePasswordAdminPage", method = RequestMethod.GET)
	public String changePasswordAdminPage(
			@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm) {
		return "changePasswordAdminPage";
	}

	@RequestMapping(value = "/changePasswordAdminSave", method = RequestMethod.POST)
	public String changePasswordAdminSave(
			@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm,
			HttpSession session, BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("changePasswordAdminSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("changePasswordAdminSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");

			return "changePasswordAdminPage";
		}
		try {
			String id = (String) session.getAttribute("logId");
			boolean changePasswordTraineeSave = adminService
					.changePasswordadminSave(changePasswordForm, id);
			if (changePasswordTraineeSave) {
				model.addAttribute("created", "Your password has changed !!!");
			} else {
				model.addAttribute("created", "Oops, something went wrong !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("changePasswordAdminSave",
					"changePasswordAdminSave Loading Exception "
							+ e.getMessage(),
					"RegistrationControllerAssessor.java");
		}
		return "changePasswordAdminPage";
	}

	@RequestMapping(value = "/changePasswordTp", method = RequestMethod.GET)
	public String changePasswordTp(
			@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm) {
		return "changePasswordTp";
	}

	@RequestMapping(value = "/changePasswordTPSave", method = RequestMethod.POST)
	public String changePasswordTPSave(
			@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm,
			HttpSession session, BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("changePasswordTPSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("changePasswordTPSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "changePasswordTp";
		}
		try {
			String id = (String) session.getAttribute("logId");
			boolean changePasswordTraineeSave = adminService
					.changePasswordTPSave(changePasswordForm, id);
			if (changePasswordTraineeSave) {
				model.addAttribute("created", "Your password has changed !!!");
			} else {
				model.addAttribute("created", "Oops, something went wrong !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("changePasswordTPSave",
					"changePasswordTPSave exception  " + e.getMessage(),
					"AdminController.java");
		}
		return "changePasswordTp";
	}

	@RequestMapping(value = "/contactTPartner", method = RequestMethod.GET)
	public String contactTPP(
			@ModelAttribute("contactTraineee") ContactTrainee contactTrainee) {
		return "contactTPartner";

	}

	@RequestMapping(value = "/feedbackMaster", method = RequestMethod.GET)
	public String feedbackMaster(
			@ModelAttribute("feedbackMaster") FeedbackMaster feedbackMaster,
			HttpSession session, BindingResult result, Model model) {
		return "feedbackMaster";

	}

	@RequestMapping(value = "/saveFeedbackMaster", method = RequestMethod.POST)
	public String saveFeedbackMaster(
			@ModelAttribute("feedbackMaster") FeedbackMaster feedbackMaster,
			HttpSession session, BindingResult result, Model model) {

		if (result.hasErrors()) {
			new ZLogger("saveFeedbackMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("saveFeedbackMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "feedbackMaster";
		}
		try {
			String created = adminService.saveFeedbackMaster(feedbackMaster);
			model.addAttribute("created", created);
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("saveFeedbackMaster", "saveFeedbackMaster exception  "
					+ e.getMessage(), "AdminController.java");
		}
		return "feedbackMaster";

	}

	@RequestMapping(value = "/saveFeedbackMaster", method = RequestMethod.GET)
	public String showFeedbackMaster() {

		return "redirect:feedbackMaster.fssai";
	}

	// Rishi
	@RequestMapping(value = "/contactTrainingPTSave", method = RequestMethod.POST)
	public String contactTPSav(
			@ModelAttribute("contactTraineee") ContactTrainee contactTrainee,
			BindingResult result, HttpSession session, Model model) {
		if (result.hasErrors()) {
			new ZLogger("contactTrainingPTSave", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("contactTrainingPTSave", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "contactTPartner";
		}// String id = contactTrainee.getUserId();

		try {
			String id = (String) session.getAttribute("logId");
			String contactTainingPtSave = adminService.contactTraningPTSave(
					contactTrainee, id);
			if (contactTainingPtSave.equalsIgnoreCase("created")) {
				model.addAttribute("created",
						"Your request has been sent successfully !!!");
			} else {
				model.addAttribute("created", "Oops, something went wrong !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("contactTrainingPTSave",
					"contactTrainingPTSave exception  " + e.getMessage(),
					"AdminController.java");

		}

		return "contactTrainee";
	}

	@RequestMapping(value = "/updateTrainerAssessmentForm", method = RequestMethod.GET)
	public String updateTrainerAssessment(Model model,
			HttpServletRequest request) {
		try {
			UpdateTrainerAssessmentForm updateTrainerAssessmentForm = new UpdateTrainerAssessmentForm();
			model.addAttribute("updateTrainerAssessment",
					updateTrainerAssessmentForm);
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("updateTrainerAssessmentForm",
					"updateTrainerAssessmentForm exception  " + e.getMessage(),
					"AdminController.java");
		}
		return "updateTrainerAssessment";
	}

	@RequestMapping(value = "/trainingCenterByCoursenameId", method = RequestMethod.POST)
	@ResponseBody
	public String getTrainingCentersByCourse(
			@RequestParam Integer courseNameId, HttpServletRequest request,
			HttpServletResponse response) {
		List<IntStringBean> listTrainingCenters = null;
		String strData = "";
		try {
			listTrainingCenters = adminService
					.getTrainingCentersByCourse(courseNameId);
			Gson gson = new Gson();
			strData = gson.toJson(listTrainingCenters);
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger(
					"trainingCenterByCoursenameId",
					"trainingCenterByCoursenameId exception  " + e.getMessage(),
					"AdminController.java");
		}
		return strData;
	}

	@RequestMapping(value = "/searchTrainerForAssessmentValidation", method = RequestMethod.POST)
	@ResponseBody
	public String searchTrainerForAssessmentValidation(
			@RequestParam Integer courseNameId, @RequestParam Integer tpId,
			HttpServletRequest request, HttpServletResponse response) {
		List<TrainerAssessmentSearchForm> listTrainersForAssessmentEval = null;
		System.out.println("courseNameId " + courseNameId + " tpId " + tpId);
		String strData = "";
		try {
			listTrainersForAssessmentEval = adminService
					.searchTrainerForAssessmentValidation(courseNameId, tpId);
			Gson gson = new Gson();
			strData = gson.toJson(listTrainersForAssessmentEval);
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("searchTrainerForAssessmentValidation",
					"searchTrainerForAssessmentValidation exception  "
							+ e.getMessage(), "AdminController.java");
		}
		return strData;
	}

	@RequestMapping(value = "/saveTrainerAssessment", method = RequestMethod.POST)
	@ResponseBody
	public String saveTrainerAssessment(
			@Valid @ModelAttribute("trainerAssessmentForm") TrainerAssessmentSearchForm trainerAssessmentForm,
			Model model) {
		int response = 0;
		try {
			trainerAssessmentForm = adminService
					.evaluateTrainerAssessment(trainerAssessmentForm);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
					"dd/MM/yyyy");
			String date = simpleDateFormat.format(new Date());
			TrainerAssessmentEvaluation trainerAssessmentEvaluation = new TrainerAssessmentEvaluation();
			trainerAssessmentEvaluation.setTrainerId(trainerAssessmentForm
					.getTrainerId());
			trainerAssessmentEvaluation.setCourseNameId(trainerAssessmentForm
					.getCourseNameId());
			trainerAssessmentEvaluation
					.setTrainingPartnerId(trainerAssessmentForm
							.getTrainingPartnerId());
			trainerAssessmentEvaluation.setRating(trainerAssessmentForm
					.getRating());
			trainerAssessmentEvaluation.setResult(trainerAssessmentForm
					.getResult());
			trainerAssessmentEvaluation.setAssessmentDate(date);
			response = adminService
					.saveTrainerAssessment(trainerAssessmentEvaluation);

		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("saveTrainerAssessment",
					"saveTrainerAssessment exception  " + e.getMessage(),
					"AdminController.java");
		}

		if (response > 0)
			return "success";
		else
			return "Error occured while updating the accessment";
	}

	@RequestMapping(value = "/getSingleAssessmentQuestion", method = RequestMethod.GET)
	public String getSingleAssessmentQuestion(Model model,
			HttpServletRequest request) {
		model.addAttribute("updateTrainerAssessment", "Test Ajax");
		return "updateTrainerAssessment";
	}

	@RequestMapping("/activateDeActivateTrainer")
	public String activateDeActivateTrainer(
			@Valid @ModelAttribute("trainerUserManagementForm") TrainerUserManagementForm trainerUserManagementForm) {
		String status = (trainerUserManagementForm.getStatus()
				.equalsIgnoreCase("I") ? "N" : "Y");
		String tableName = TableLink.getByprofileID(
				Integer.parseInt(trainerUserManagementForm.getProfileID()))
				.tableName();
		adminService.updateUser(trainerUserManagementForm.getLogindetails(),
				tableName, status);
		return "redirect:/trainerUserManagementForm.fssai";
	}

	@RequestMapping("/activateDeActivateTrainee")
	public String activateDeActivateTrainee(
			@Valid @ModelAttribute("traineeUserManagementForm") TraineeUserManagementForm traineeUserManagementForm) {
		String status = (traineeUserManagementForm.getStatus()
				.equalsIgnoreCase("I") ? "N" : "Y");
		String tableName = TableLink.getByprofileID(
				Integer.parseInt(traineeUserManagementForm.getProfileID()))
				.tableName();
		adminService.updateUser(traineeUserManagementForm.getLogindetails(),
				tableName, status);
		return "redirect:/traineeUserManagementForm.fssai";
	}

	@RequestMapping("/activateDeActivateTrainingCenter")
	public String activateDeActivateTrainingCenter(
			@Valid @ModelAttribute("trainingCenterUserManagementForm") TrainingCenterUserManagementForm trainingCenterUserManagementForm) {

		String status = (trainingCenterUserManagementForm.getStatus()
				.equalsIgnoreCase("I") ? "N" : "Y");
		String tableName = TableLink.getByprofileID(
				Integer.parseInt(trainingCenterUserManagementForm
						.getProfileID())).tableName();
		adminService.updateUser(
				trainingCenterUserManagementForm.getLogindetails(), tableName,
				status);
		return "redirect:/trainingCenterUserManagementForm.fssai";
	}

	@RequestMapping("/activateDeActivateAssessor")
	public String activateDeActivateAssessor(
			@Valid @ModelAttribute("assessorUserManagementForm") AssessorUserManagementForm assessorUserManagementForm) {
		new ZLogger("activateDeActivateAssessor", "status "
				+ assessorUserManagementForm.getStatus() + "  profileid "
				+ assessorUserManagementForm.getProfileID(),
				"AdminController.java");
		new ZLogger("activateDeActivateAssessor", "Login ID Details :  "
				+ assessorUserManagementForm.getLogindetails(),
				"AdminController.java");
		String status = (assessorUserManagementForm.getStatus()
				.equalsIgnoreCase("I") ? "N" : "Y");
		String tableName = TableLink.getByprofileID(
				Integer.parseInt(assessorUserManagementForm.getProfileID()))
				.tableName();
		new ZLogger("activateDeActivateAssessor", TableLink.getByprofileID(
				Integer.parseInt(assessorUserManagementForm.getProfileID()))
				.tableName(), "AdminController.java");
		adminService.updateUser(assessorUserManagementForm.getLogindetails(),
				tableName, status);
		return "redirect:/assessorUserManagementForm.fssai";
	}

	@RequestMapping(value = "/loadDistrict", method = RequestMethod.POST)
	@ResponseBody
	public void getCourseName(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("loadDistrict", "loadDistrict............" + data,
				"AdminController.java");
		String stateId = data;
		List districtList = pageLoadService.loadDistrict(stateId);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(districtList);
		new ZLogger("loadDistrict", "newList " + newList,
				"AdminController.java");
		out.write(newList);
		out.flush();

	}

	// loadCity

	@RequestMapping(value = "/loadCity", method = RequestMethod.POST)
	@ResponseBody
	public void loadCity(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("loadCity", "loadCity............" + data,
				"AdminController.java");
		String districtid = data;
		List<City> cityList = pageLoadService.loadCity(districtid);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(cityList);
		new ZLogger("loadCity", "newList " + newList, "AdminController.java");
		out.write(newList);
		out.flush();

	}

	@RequestMapping(value = "/searchManageCourse", method = RequestMethod.POST)
	@ResponseBody
	public void searchManageCourse(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("searchManageCourse", "searchManageCourse............"
				+ data, "AdminController.java");
		List courseList = adminService.searchManageCourse(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	@RequestMapping(value = "/editManageCourseData", method = RequestMethod.POST)
	@ResponseBody
	public void editManageCourseData(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("editManageCourseData", "editManageCourseData............"
				+ data, "AdminController.java");
		String courseList = adminService.editManageCourseData(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	@RequestMapping(value = "/editState", method = RequestMethod.POST)
	@ResponseBody
	public void editState(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("editState", "editState............" + data,
				"AdminController.java");
		String courseList = adminService.editState(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// CheckState
	@RequestMapping(value = "/CheckState", method = RequestMethod.POST)
	@ResponseBody
	public void CheckState(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("CheckState", "CheckState............" + data,
				"AdminController.java");
		String courseList = adminService.CheckState(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	@RequestMapping(value = "/searchState", method = RequestMethod.POST)
	@ResponseBody
	public void searchState(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("searchState", "searchState............" + data,
				"AdminController.java");
		List<State> courseList = adminService.searchState(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// onLoadDistrict

	@RequestMapping(value = "/onLoadDistrict", method = RequestMethod.POST)
	@ResponseBody
	public void onLoadDistrict(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("onLoadDistrict", "onLoadDistrict............" + data,
				"AdminController.java");
		List courseList = adminService.onLoadDistrict(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// changeStatusDistrict

	@RequestMapping(value = "/changeStatusDistrict", method = RequestMethod.POST)
	@ResponseBody
	public void changeStatusDistrict(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("changeStatusDistrict", "changeStatusDistrict............"
				+ data, "AdminController.java");
		String courseList = adminService.changeStatusDistrict(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// searchDistrict

	@RequestMapping(value = "/searchDistrict", method = RequestMethod.POST)
	@ResponseBody
	public void searchDistrict(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("searchDistrict", "searchDistrict............" + data,
				"AdminController.java");
		List courseList = adminService.searchDistrict(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// editCityData

	@RequestMapping(value = "/editCityData", method = RequestMethod.POST)
	@ResponseBody
	public void editCityData(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("editCityData", "editCityData............" + data,
				"AdminController.java");
		String courseList = adminService.editCityData(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// searchCity

	@RequestMapping(value = "/searchCity", method = RequestMethod.POST)
	@ResponseBody
	public void searchCity(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("searchCity", "searchCity............" + data,
				"AdminController.java");
		List courseList = adminService.searchCity(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// onLoadRegion

	@RequestMapping(value = "/onLoadRegion", method = RequestMethod.POST)
	@ResponseBody
	public void onLoadRegion(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("onLoadRegion", "onLoadRegion............" + data,
				"AdminController.java");
		List courseList = adminService.onLoadRegion(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// editRegionData

	@RequestMapping(value = "/editRegionData", method = RequestMethod.POST)
	@ResponseBody
	public void editRegionData(
			@RequestParam("data") String data,
			Model model,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("editRegionData", "editRegionData............" + data,
				"AdminController.java");
		String courseList = adminService.editRegionData(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);

		out.write(newList);
		out.flush();

	}

	@RequestMapping(value = "/traineeAssessmentCalender", method = RequestMethod.POST)
	@ResponseBody
	public void traineeAssessmentCalender(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("traineeAssessmentCalender",
				"traineeAssessmentCalender............" + data,
				"AdminController.java");
		List courseList = adminService.traineeAssessmentCalender(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// getQuestions

	@RequestMapping(value = "/getQuestions", method = RequestMethod.POST)
	@ResponseBody
	public void getQuestions(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("traineeAssessmentCalender",
				"traineeAssessmentCalender............" + data,
				"AdminController.java");
		List courseList = adminService.getQuestions(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// searchFeedbackMaster

	@RequestMapping(value = "/searchFeedbackMaster", method = RequestMethod.POST)
	@ResponseBody
	public void searchFeedbackMaster(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("searchFeedbackMaster", "searchFeedbackMaster............"
				+ data, "AdminController.java");
		List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// searchAssessmentAgencyList

	@RequestMapping(value = "/searchAssessmentAgencyList", method = RequestMethod.POST)
	@ResponseBody
	public void searchAssessmentAgencyList(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("searchAssessmentAgencyList",
				"searchAssessmentAgencyList............" + data,
				"AdminController.java");
		List courseList = adminService.searchAssessmentAgencyList(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// searchAssessorDetail

	@RequestMapping(value = "/searchAssessorDetail", method = RequestMethod.POST)
	@ResponseBody
	public void searchAssessorDetail(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("searchAssessorDetail", "searchAssessorDetail............"
				+ data, "AdminController.java");
		List courseList = adminService.searchAssessorDetail(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(courseList);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// changeAssessor

	@RequestMapping(value = "/changeAssessor", method = RequestMethod.POST)
	@ResponseBody
	public void changeAssessor(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("changeAssessor", "changeAssessor............" + data,
				"AdminController.java");
		String result = adminService.changeAssessor(data);
		PrintWriter out = response.getWriter();

		System.out.println("newList " + result);
		out.write(result);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Holiday Master
	 */

	@RequestMapping(value = "/HolidayMaster", method = RequestMethod.GET)
	public String listHolidayMaster(
			@ModelAttribute("HolidayMaster") HolidayMaster holidayMaster,
			Model model) {
		System.out.println("listHolidayMaster");
		model.addAttribute("HolidayMaster", new HolidayMaster());
		model.addAttribute("listHolidayMaster",
				this.adminService.listHolidayMaster());
		return "HolidayMaster";
	}

	@RequestMapping(value = "/HolidayMaster/add", method = RequestMethod.POST)
	public String addHolidayMaster(
			@ModelAttribute("HolidayMaster") @Valid HolidayMaster p,
			BindingResult result, Model model)

	{

		System.out.println(result.hasErrors());

		if (result.hasErrors()) {
			new ZLogger("HolidayMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("HolidayMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/HolidayMaster.fssai";

		}

		System.out.println("p.getId() " + p.getHolidayId());
		if (p.getHolidayId() == 0) {
			// new person, add it
		String hm=	this.adminService.addHolidayMaster(p);
			if (hm.equalsIgnoreCase("created")) {
				model.addAttribute("created",
						" State insertion successfull !!!");
				model.addAttribute("stateMaster", new StateForm());
			} else {
				model.addAttribute("created",
						"State already exists in reord !!!");
				
			}
		} else {
			// existing person, call update
			this.adminService.updateHolidayMaster(p);
		}
		System.out.println("after insert");
		return "redirect:/HolidayMaster.fssai";

	}

	@RequestMapping("/HolidayMaster/remove/{id}")
	public String removeHolidayMaster(@PathVariable("id") int id) {

		this.adminService.removeHolidayMaster(id);
		return "redirect:/HolidayMaster.fssai";

	}

	@RequestMapping(value = "/HolidayMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editHolidayMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("HolidayMaster/edit",
				"HolidayMaster/edit............" + id, "AdminController.java");

		HolidayMaster hm = this.adminService.getHolidayMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	@RequestMapping(value = "/Assessmentquestion/edit/{id}", method = RequestMethod.POST, consumes = "application/json", headers = "content-type=application/x-www-form-urlencoded")
	// @ResponseBody
	public void Editassessmentquestion(@PathVariable("id") int id,
			@RequestBody AssessmentQuestionForm assessmentQuestionForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {

		System.out
				.println("##########################################################################");
		new ZLogger("AssessmentQuestionForm/edit",
				"AssessmentQuestionForm/edit............" + id,
				"AdminController.java");

		AssessmentQuestions hm = this.adminService
				.getAssessmentQuestionById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	
	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Unit Master
	 */

	@RequestMapping(value = "/UnitMaster", method = RequestMethod.GET)
	public String listUnitMaster(
			@ModelAttribute("UnitMaster") UnitMaster UnitMaster, Model model) {
		System.out.println("listUnitMaster");
		Map<String, String> userType = lst.userTypeMap;
		Map<String, String> trainingType = lst.trainingTypeMap;
		Map<String, String> trainingPhase = lst.trainingPhaseMap;
		model.addAttribute("userType", userType);
		model.addAttribute("trainingType", trainingType);
		model.addAttribute("trainingPhase", trainingPhase);
		model.addAttribute("UnitMaster", new UnitMaster());
		model.addAttribute("listUnitMaster", this.adminService.listUnitMaster());
		return "UnitMaster";
	}

	@RequestMapping(value = "/UnitMaster/add", method = RequestMethod.POST)
	public String addUnitMaster(@ModelAttribute("UnitMaster") UnitMaster p,Model model) {
		System.out.println("p.getId() " + p.getUnitId());
		if (p.getUnitId() == 0) {
			// new person, add it
			String result=this.adminService.addUnitMaster(p);
			System.out.println("result"+result);
			
			try {
			
			if (result.equalsIgnoreCase("created")) {
				System.out.println("a");
				model.addAttribute("created",
						" New Unit insertion successful !!!");
				//model.addAttribute("stateMaster", new StateForm());
			} else {
				System.out.println("else");
				model.addAttribute("created",
						"Unit already exists in reord !!!");
		}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("addUnitMaster",
					"Exception while addUnitMaster :  " + e.getMessage(),
					"AdminController.java");
		}
		} else {
			// existing person, call update
			this.adminService.updateUnitMaster(p);
		}
		System.out.println("after insert");
		return "redirect:/UnitMaster.fssai";
		//return "UnitMaster";
	}

	@RequestMapping("/UnitMaster/remove/{id}")
	public String removeUnitMaster(@PathVariable("id") int id) {

		this.adminService.removeUnitMaster(id);
		return "redirect:/UnitMaster.fssai";
	}

	@RequestMapping(value = "/UnitMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editUnitMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("/UnitMaster/edit", "/UnitMaster/edit............" + id,
				"AdminController.java");

		UnitMaster hm = this.adminService.getUnitMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Module Master
	 */

	@RequestMapping(value = "/ModuleMaster", method = RequestMethod.GET)
	public String listModuleMaster(
			@ModelAttribute("ModuleMasterForm") ModuleMasterForm moduleMasterForm,
			Model model) {
		System.out.println("listModuleMaster");
		Map<String, String> userType = lst.userTypeMap;
		Map<String, String> trainingType = lst.trainingTypeMap;
		Map<String, String> trainingPhase = lst.trainingPhaseMap;
		Map<String, String> contentType = lst.contentType;
		model.addAttribute("userType", userType);
		model.addAttribute("trainingType", trainingType);
		model.addAttribute("trainingPhase", trainingPhase);
		model.addAttribute("contentType", contentType);
		
		
		model.addAttribute("listUnitMaster", this.adminService.listUnitMaster());
		model.addAttribute("listModuleMaster",
				this.adminService.listModuleMaster());
		
		model.addAttribute("ModuleMasterForm", moduleMasterForm);
		return "ModuleMaster";
	}

	@RequestMapping(value = "/ModuleMaster/add", method = RequestMethod.POST)
	public String addModuleMaster(
			@Valid @ModelAttribute("ModuleMasterForm") ModuleMasterForm p,
			BindingResult result, Model model) {
		System.out.println("..............."+p.getUnitId());
		System.out.println("result " + result.hasErrors());
		if (result.hasErrors()) {

			new ZLogger("StateMaster", "bindingResult.hasErrors  "+ result.hasErrors(), "AdminController.java");
			new ZLogger("StateMaster", "bindingResult.hasErrors  "+ result.getErrorCount() + " All Errors "+ result.getAllErrors(), "AdminController.java");
			ValidationUtils.rejectIfEmpty(result, "moduleName","Name can not be empty.");
			return "redirect:/ModuleMaster.fssai";
			// return "ModuleMaster";
		}

		System.out.println("p.getId() " + p.getModuleId() + " " + p.getUnitId());
		ModuleMaster moduleMaster = new ModuleMaster();
		moduleMaster.setModuleId(p.getModuleId());
		moduleMaster.setModuleName(p.getModuleName());
		moduleMaster.setStatus(p.getStatus());
		moduleMaster.setContentName(p.getContentName());
		moduleMaster.setContentLink(p.getContentLink());
		moduleMaster.setContentType(p.getContentType());
		moduleMaster.setUnitMaster(this.adminService.getUnitMasterById(p.getUnitId()));

		if (p.getModuleId() == 0) {
			// new person, add it
			String result1=this.adminService.addModuleMaster(moduleMaster);
System.out.println("result1: "+result1);
			
			try {
			
			if (result1.equalsIgnoreCase("created")) {
				model.addAttribute("created",
						" New Unit insertion successful !!!");
			} else {
				model.addAttribute("created",
						"Unit already exists in reord !!!");
		}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("addUnitMaster",
					"Exception while addUnitMaster :  " + e.getMessage(),
					"AdminController.java");
		}
		}  else {
			// existing person, call update
			this.adminService.updateModuleMaster(moduleMaster);
		}
		System.out.println("after insert");
		return "redirect:/ModuleMaster.fssai";
		// return "ModuleMaster";
	}

	@RequestMapping("/ModuleMaster/remove/{id}")
	public String removeModuleMaster(@PathVariable("id") int id) {

		this.adminService.removeModuleMaster(id);
		return "redirect:/ModuleMaster.fssai";
	}

	@RequestMapping(value = "/ModuleMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editModuleMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("/ModuleMaster/edit",
				"/ModuleMaster/edit............" + id, "AdminController.java");

		ModuleMaster hm = this.adminService.getModuleMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Subject Master
	 */

	@RequestMapping(value = "/SubjectMaster", method = RequestMethod.GET)
	public String listSubjectMaster(
			@ModelAttribute("SubjectMaster") SubjectMaster SubjectMaster,
			Model model) {
		System.out.println("listSubjectMaster");
		Map<String, String> userType = lst.userTypeMap;
		Map<String, String> trainingType = lst.trainingTypeMap;
		Map<String, String> trainingPhase = lst.trainingPhaseMap;
		model.addAttribute("userType", userType);
		model.addAttribute("trainingType", trainingType);
		model.addAttribute("SubjectMaster", new SubjectMaster());
		model.addAttribute("listSubjectMaster",
				this.adminService.listSubjectMaster());
		return "SubjectMaster";
	}

	@RequestMapping(value = "/SubjectMaster/add", method = RequestMethod.POST)
	public String addSubjectMaster(
			@ModelAttribute("SubjectMaster") SubjectMaster p) {
		System.out.println("p.getId() " + p.getSubjectId());
		if (p.getSubjectId() == 0) {
			// new person, add it
			this.adminService.addSubjectMaster(p);
		} else {
			// existing person, call update
			this.adminService.updateSubjectMaster(p);
		}
		System.out.println("after insert");
		return "redirect:/SubjectMaster.fssai";
	}

	@RequestMapping("/SubjectMaster/remove/{id}")
	public String removeSubjectMaster(@PathVariable("id") int id) {

		this.adminService.removeSubjectMaster(id);
		return "redirect:/SubjectMaster.fssai";
	}

	@RequestMapping(value = "/SubjectMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editSubjectMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("/SubjectMaster/edit", "/SubjectMaster/edit............"
				+ id, "AdminController.java");

		SubjectMaster hm = this.adminService.getSubjectMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Training Schedule
	 */

	@RequestMapping(value = "/TrainingSchedule", method = RequestMethod.GET)
	public String TrainingSchedule(
			@ModelAttribute("TrainingScheduleForm") TrainingSchedule TrainingSchedule,
			Model model) {
		System.out.println("listTrainingSchedule");
		Map<String, String> userType = lst.userTypeMap;
		Map<String, String> trainingType = lst.trainingTypeMap;
		Map<String, String> trainingPhase = lst.trainingPhaseMap;
		Map<String, String> userStatusMap = lst.userStatusMap;

		model.addAttribute("userType", userType);
		model.addAttribute("trainingType", trainingType);
		model.addAttribute("trainingPhase", trainingPhase);
		model.addAttribute("userStatusMap", userStatusMap);
		model.addAttribute("TrainingScheduleForm", new TrainingScheduleForm());
		model.addAttribute("listTrainingPartner",
				this.adminService.listTrainingPartner());
		model.addAttribute("listTrainingSchedule",
				this.adminService.listTrainingSchedule());
		model.addAttribute("listTrainingInstitude",
				this.adminService.listTrainingInstitude());
		model.addAttribute("listStateMaster",
				this.adminService.listStateMaster());
		model.addAttribute("listUnitMaster", this.adminService.listUnitMaster());
		model.addAttribute("listModuleMaster",
				this.adminService.listModuleMaster());
		model.addAttribute("listPersonalInfoTrainer",
				this.adminService.trainingNameList());
		return "TrainingSchedule";
	}

	@RequestMapping(value = "/TrainingSchedule/add", method = RequestMethod.POST)
	public String addTrainingSchedule(
			@ModelAttribute("TrainingSchedule") TrainingSchedule p, Model model) {
		System.out.println("p.getId() " + p.getTrainingScheduleId());

		if (p.getTrainingScheduleId() == 0) {
			// new person, add it
			this.adminService.addTrainingSchedule(p);
		} else {
			// existing person, call update
			this.adminService.updateTrainingSchedule(p);
		}
		System.out.println("after insert");
		return "redirect:/TrainingSchedule.fssai";
	}

	@RequestMapping("/TrainingSchedule/remove/{id}")
	public String removeTrainingSchedule(@PathVariable("id") int id) {

		this.adminService.removeTrainingSchedule(id);
		return "redirect:/TrainingSchedule.fssai";
	}

	@RequestMapping("/TrainingSchedule/accept/{id}")
	public String acceptTrainingSchedule(@PathVariable("id") int id,
			HttpServletRequest request) {
		String profileId = request.getParameter("profileId");
		String loginUser2 = request.getParameter("loginUser2");
		String userTableId = request.getParameter("userTableId");
		String operation = request.getParameter("operation");
		if (loginUser2 == null) {
			// Integer.parseInt(loginUser2);
			loginUser2 = "0";
		}
		if (userTableId == null) {
			// Integer.parseInt(loginUser2);
			userTableId = "0";
		}
		this.adminService.acceptTrainingSchedule(id,
				Integer.parseInt(profileId), Integer.parseInt(loginUser2),
				Integer.parseInt(userTableId),operation);
		return "trainingInstitudeHomepage";
	}

	@RequestMapping(value = "/TrainingSchedule/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editTrainingSchedule(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("/TrainingSchedule/edit",
				"/TrainingSchedule/edit............" + id,
				"AdminController.java");

		TrainingSchedule hm = this.adminService.getTrainingScheduleById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	@RequestMapping(value = "/ListTrainingSchedule", method = RequestMethod.POST)
	public String ListTrainingSchedule(
			@ModelAttribute("TrainingScheduleForm") TrainingSchedule TrainingSchedule,
			Model model) {

		System.out.println("listTrainingSchedule"
				+ TrainingSchedule.getTrainingType());
		Map<String, String> userType = lst.userTypeMap;
		Map<String, String> trainingType = lst.trainingTypeMap;
		Map<String, String> trainingPhase = lst.trainingPhaseMap;
		model.addAttribute("userType", userType);
		model.addAttribute("trainingType", trainingType);
		model.addAttribute("trainingPhase", trainingPhase);
		model.addAttribute("TrainingScheduleForm", new TrainingScheduleForm());
		model.addAttribute("listTrainingSchedule",
				this.adminService.listTrainingSchedule());
		return "TrainingSchedule";
	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for State Master
	 */

	@RequestMapping(value = "/StateMaster", method = RequestMethod.GET)
	public String listStateMaster(
			@ModelAttribute("StateMaster") StateMaster StateMaster, Model model) {
		System.out.println("listStateMaster");
		model.addAttribute("StateMaster", new StateMaster());
		model.addAttribute("listStateMaster",
				this.adminService.listStateMaster());
		return "StateMaster";
	}

	@RequestMapping(value = "/StateMaster/add", method = RequestMethod.POST)
	public String addStateMaster(
			@Valid @ModelAttribute("StateMaster") StateMaster p,
			BindingResult result) {
		System.out.println(result.hasErrors());

		if (result.hasErrors()) {

			new ZLogger("StateMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("StateMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/StateMaster.fssai";
		}

		System.out.println("p.getId() " + p.getStateId());
		if (p.getStateId() == 0) {
			// new person, add it
			this.adminService.addStateMaster(p);
		} else {
			// existing person, call update
			this.adminService.updateStateMaster(p);
		}
		System.out.println("after insert");
		return "redirect:/StateMaster.fssai";
	}

	@RequestMapping("/StateMaster/remove/{id}")
	public String removeStateMaster(@PathVariable("id") int id) {

		this.adminService.removeStateMaster(id);
		return "redirect:/StateMaster.fssai";
	}

	@RequestMapping(value = "/StateMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editStateMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("StateMaster/edit", "StateMaster/edit............" + id,
				"AdminController.java");

		StateMaster hm = this.adminService.getStateMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for District Master
	 */

	@RequestMapping(value = "/DistrictMaster", method = RequestMethod.GET)
	public String listDistrictMaster(
			@ModelAttribute("DistrictMasterForm") DistrictMaster DistrictMaster,
			Model model) {
		System.out.println("listDistrictMaster");
		model.addAttribute("DistrictMasterForm", new DistrictMasterForm());
		model.addAttribute("listStateMaster",
				this.adminService.listStateMaster());
		model.addAttribute("listDistrictMaster",
				this.adminService.listDistrictMaster());
		return "DistrictMaster";
	}

	@RequestMapping(value = "/DistrictMaster/add", method = RequestMethod.POST)
	public String addDistrictMaster(
			@Valid @ModelAttribute("DistrictMasterForm") DistrictMasterForm p,
			BindingResult result) {
		System.out.println(result.hasErrors());

		if (result.hasErrors()) {

			new ZLogger("DistrictMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("DistrictMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/DistrictMaster.fssai";
		}

		DistrictMaster districtMaster = new DistrictMaster();
		districtMaster.setDistrictId(p.getDistrictId());
		districtMaster.setDistrictName(p.getDistrictName());
		districtMaster.setStateMaster(this.adminService.getStateMasterById(p
				.getStateId()));
		districtMaster.setStatus(p.getStatus());
		if (p.getDistrictId() == 0) {
			// new person, add it
			this.adminService.addDistrictMaster(districtMaster);
		} else {
			// existing person, call update
			this.adminService.updateDistrictMaster(districtMaster);
		}
		System.out.println("after insert");
		return "redirect:/DistrictMaster.fssai";
	}

	@RequestMapping("/DistrictMaster/remove/{id}")
	public String removeDistrictMaster(@PathVariable("id") int id) {

		this.adminService.removeDistrictMaster(id);
		return "redirect:/DistrictMaster.fssai";
	}

	@RequestMapping(value = "/DistrictMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editDistrictMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("DistrictMaster/edit", "DistrictMaster/edit............"
				+ id, "AdminController.java");

		DistrictMaster hm = this.adminService.getDistrictMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for City Master
	 */

	@RequestMapping(value = "/CityMaster", method = RequestMethod.GET)
	public String listCityMaster(
			@ModelAttribute("CityMasterForm") CityMaster CityMaster, Model model) {
		System.out.println("listCityMaster");
		model.addAttribute("CityMasterForm", new CityMasterForm());
		model.addAttribute("listStateMaster",
				this.adminService.listStateMaster());
		model.addAttribute("listDistrictMaster",
				this.adminService.listDistrictMaster());
		model.addAttribute("listCityMaster", this.adminService.listCityMaster());
		return "CityMaster";
	}

	@RequestMapping(value = "/CityMaster/add", method = RequestMethod.POST)
	public String addCityMaster(
			@Valid @ModelAttribute("CityMasterForm") CityMasterForm p,
			BindingResult result) {
		System.out.println(result.hasErrors());

		if (result.hasErrors()) {

			new ZLogger("CityMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("CityMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/CityMaster.fssai";
		}

		CityMaster CityMaster = new CityMaster();
		CityMaster.setCityId(p.getCityId());
		CityMaster.setCityName(p.getCityName());
		CityMaster.setDistrictMaster(this.adminService.getDistrictMasterById(p
				.getDistrictId()));
		CityMaster.setStatus(p.getStatus());
		if (p.getCityId() == 0) {
			// new person, add it
			this.adminService.addCityMaster(CityMaster);
		} else {
			// existing person, call update
			this.adminService.updateCityMaster(CityMaster);
		}
		System.out.println("after insert");
		return "redirect:/CityMaster.fssai";
	}

	@RequestMapping("/CityMaster/remove/{id}")
	public String removeCityMaster(@PathVariable("id") int id) {

		this.adminService.removeCityMaster(id);
		return "redirect:/CityMaster.fssai";
	}

	@RequestMapping(value = "/CityMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editCityMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("CityMaster/edit", "CityMaster/edit............" + id,
				"AdminController.java");

		CityMaster hm = this.adminService.getCityMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Region Master
	 */

	@RequestMapping(value = "/RegionMaster", method = RequestMethod.GET)
	public String listRegionMaster(
			@ModelAttribute("RegionMasterForm") RegionMaster RegionMaster,
			Model model) {
		System.out.println("listRegionMaster");
		model.addAttribute("RegionMasterForm", new RegionMasterForm());
		model.addAttribute("listStateMaster",
				this.adminService.listStateMaster());
		model.addAttribute("listDistrictMaster",
				this.adminService.listDistrictMaster());
		model.addAttribute("listCityMaster", this.adminService.listCityMaster());
		model.addAttribute("listRegionMaster",
				this.adminService.listRegionMaster());
		return "RegionMaster";
	}

	@RequestMapping(value = "/RegionMaster/add", method = RequestMethod.POST)
	public String addRegionMaster(
			@Valid @ModelAttribute("RegionMasterForm") RegionMasterForm p,
			BindingResult result) {
		System.out.println(result.hasErrors());

		if (result.hasErrors()) {

			new ZLogger("RegionMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("RegionMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/RegionMaster.fssai";
		}

		RegionMaster RegionMaster = new RegionMaster();
		RegionMaster.setId(p.getRegionId());
		RegionMaster.setRegionName(p.getRegionName());
		RegionMaster.setCityMaster(this.adminService.getCityMasterById(p
				.getCityId()));
		RegionMaster.setStatus(p.getStatus());
		if (p.getRegionId() == 0) {
			// new person, add it
			this.adminService.addRegionMaster(RegionMaster);
		} else {
			// existing person, call update
			this.adminService.updateRegionMaster(RegionMaster);
		}
		System.out.println("after insert");
		return "redirect:/RegionMaster.fssai";
	}

	@RequestMapping("/RegionMaster/remove/{id}")
	public String removeRegionMaster(@PathVariable("id") int id) {

		this.adminService.removeRegionMaster(id);
		return "redirect:/RegionMaster.fssai";
	}

	@RequestMapping(value = "/RegionMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editRegionMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("RegionMaster/edit", "RegionMaster/edit............" + id,
				"AdminController.java");

		RegionMaster hm = this.adminService.getRegionMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for TrainingPartner Master
	 */

	@RequestMapping(value = "/TrainingPartner", method = RequestMethod.GET)
	public String listTrainingPartner(
			@ModelAttribute("TrainingPartner") TrainingPartner trainingPartner,
			Model model) {
		System.out.println("listTrainingPartner");
		model.addAttribute("TrainingPartner", new TrainingPartner());
		model.addAttribute("listTrainingPartner",
				this.adminService.listTrainingPartner());
		return "TrainingPartner";
	}

	@RequestMapping(value = "/TrainingPartner/add", method = RequestMethod.POST)
	public String addTrainingPartnerMaster(
			@Valid @ModelAttribute("TrainingPartner") TrainingPartner p,
			BindingResult result) {
		System.out.println(result.hasErrors());

		if (result.hasErrors()) {

			new ZLogger("TrainingPartnerMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("TrainingPartnerMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/TrainingPartnerMaster.fssai";
		}

		System.out.println("p.getId() " + p.getTrainingPartnerId());
		if (p.getTrainingPartnerId() == 0) {
			// new person, add it
			this.adminService.addTrainingPartner(p);
		} else {
			// existing person, call update
			this.adminService.updateTrainingPartner(p);
		}
		System.out.println("after insert");
		return "redirect:/TrainingPartner.fssai";
	}

	@RequestMapping("/TrainingPartner/remove/{id}")
	public String removeTrainingPartnerMaster(@PathVariable("id") int id) {

		this.adminService.removeTrainingPartner(id);
		return "redirect:/TrainingPartner.fssai";
	}

	@RequestMapping(value = "/TrainingPartner/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editTrainingPartnerMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("TrainingPartner/edit",
				"TrainingPartnerMaster/edit............" + id,
				"AdminController.java");

		TrainingPartner hm = this.adminService.getTrainingPartnerById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	// for generate certificate

	@RequestMapping(value = "/GenerateCertificate", method = RequestMethod.GET)
	public String GenerateCertificate(
			@ModelAttribute("GenerateCertificateForm") GenerateCertificateForm generateCertificateForm,
			Model model) {
		System.out.println("listGenerateCertificate");

		Map<String, String> trainingType = lst.trainingTypeMap;

		model.addAttribute("trainingType", trainingType);
		model.addAttribute("trainingPartner",
				this.adminService.listTrainingPartner());
		model.addAttribute("batchCodeList",
				this.adminService.listTrainingSchedule());
		model.addAttribute("GenerateCertificateForm",
				new GenerateCertificateForm());

		return "GenerateCertificate";
	}

	@RequestMapping(value = "/ListGenerateCertificate", method = RequestMethod.POST)
	public String ListGenerateCertificate(
			@ModelAttribute("GenerateCertificateForm") GenerateCertificateForm generateCertificateForm,
			Model model) {

		System.out.println("listGenerateCertificate"
				+ generateCertificateForm.getTrainingType());

		Map<String, String> trainingType = lst.trainingTypeMap;
		// Map<String, String> trainingPartner = lst.trainingParterMap;

		model.addAttribute("trainingType", trainingType);
		model.addAttribute("trainingPartner",
				this.adminService.listTrainingPartner());
		model.addAttribute("GenerateCertificateForm",
				new GenerateCertificateForm());
		model.addAttribute("listGenerateCertificate", this.adminService
				.listGenerateCertificate(generateCertificateForm));

		return "GenerateCertificate";
	}

	// for training closure
	@RequestMapping(value = "/TrainingClosure", method = RequestMethod.GET)
	public String TrainingClosure(
			@ModelAttribute("TrainingClosureForm") TrainingClosureForm trainingClosureForm,
			Model model) {
		System.out.println("listTrainingClosure");

		Map<String, String> userType = lst.userTypeMap;
		Map<String, String> trainingType = lst.trainingTypeMap;

		model.addAttribute("userType", userType);
		model.addAttribute("trainingType", trainingType);

		model.addAttribute("listTrainingInstitude",
				this.adminService.listTrainingInstitude());
		model.addAttribute("TrainingClosureForm", new TrainingClosureForm());

		return "TrainingClosure";
	}

	@RequestMapping(value = "/ListTrainingClosure", method = RequestMethod.POST)
	public String ListTrainingClosure(
			@ModelAttribute("TrainingClosureForm") TrainingClosureForm trainingClosureForm,
			Model model) {

		System.out.println("listTrainingClosure"
				+ trainingClosureForm.getTrainingType());

		Map<String, String> trainingType = lst.trainingTypeMap;
		Map<String, String> userType = lst.userTypeMap;
		Map<String, String> status = lst.statusMap;

		// Map<String , String> trainingInstitute = lst.trainingInstituteMap;
		// //no need
		// Map<String , String> trainingDate = lst.trainingDateMap;
		model.addAttribute("trainingType", trainingType);
		model.addAttribute("userType", userType);
		model.addAttribute("status", status);
		// model.addAttribute("trainingInstitute" , trainingInstitute);

		model.addAttribute("TrainingClosureForm", new TrainingClosureForm());
		model.addAttribute("listTrainingClosure",
				this.adminService.listTrainingClosure());
		return "TrainingClosure";
	}

	/************************************ invoice ***********************************************************/

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Customer Master
	 */

	@RequestMapping(value = "/CustomerMaster", method = RequestMethod.GET)
	public String listCustomerMaster(
			@ModelAttribute("CustomerMaster") CustomerMaster customerMaster,
			Model model) {
		System.out.println("listCustomerMaster");
		model.addAttribute("listCustomerMaster",
				this.adminService.listCustomerMaster());
		model.addAttribute("CustomerMaster", new CustomerMaster());

		return "CustomerMaster";
	}

	@RequestMapping(value = "/CustomerMaster/add", method = RequestMethod.POST)
	public String addCustomerMaster(
			@Valid @ModelAttribute("CustomerMaster") CustomerMaster p,
			BindingResult result) {
		System.out.println(result.hasErrors());

		if (result.hasErrors()) {

			new ZLogger("CustomerMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("CustomerMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/CustomerMaster.fssai";
		}

		System.out.println("p.getId() " + p.getCustomerId());
		if (p.getCustomerId() == 0) {
			// new person, add it
			this.adminService.addCustomerMaster(p);
		} else {
			// existing person, call update
			this.adminService.updateCustomerMaster(p);
		}
		System.out.println("after insert");
		return "redirect:/CustomerMaster.fssai";
	}

	@RequestMapping("/CustomerMaster/remove/{id}")
	public String removeCustomerMaster(@PathVariable("id") int id) {

		this.adminService.removeCustomerMaster(id);
		return "redirect:/CustomerMaster.fssai";
	}

	@RequestMapping(value = "/CustomerMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editCustomerMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("CustomerMaster/edit", "CustomerMaster/edit............"
				+ id, "AdminController.java");

		CustomerMaster hm = this.adminService.getCustomerMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Tax Master
	 */

	@RequestMapping(value = "/TaxMaster", method = RequestMethod.GET)
	public String listTaxMaster(
			@ModelAttribute("TaxMaster") TaxMaster TaxMaster, Model model) {
		System.out.println("listTaxMaster");
		model.addAttribute("listTaxMaster", this.adminService.listTaxMaster());
		model.addAttribute("TaxMaster", new TaxMaster());

		return "TaxMaster";
	}

	@RequestMapping(value = "/TaxMaster/add", method = RequestMethod.POST)
	public String addTaxMaster(@Valid @ModelAttribute("TaxMaster") TaxMaster p,
			BindingResult result) {
		System.out.println(result.hasErrors());

		if (result.hasErrors()) {

			new ZLogger("TaxMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("TaxMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/TaxMaster.fssai";
		}

		System.out.println("p.getId() " + p.getTaxId());
		if (p.getTaxId() == 0) {
			// new person, add it
			this.adminService.addTaxMaster(p);
		} else {
			// existing person, call update
			this.adminService.updateTaxMaster(p);
		}
		System.out.println("after insert");
		return "redirect:/TaxMaster.fssai";
	}

	@RequestMapping("/TaxMaster/remove/{id}")
	public String removeTaxMaster(@PathVariable("id") int id) {

		this.adminService.removeTaxMaster(id);
		return "redirect:/TaxMaster.fssai";
	}

	@RequestMapping(value = "/TaxMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editTaxMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("TaxMaster/edit", "TaxMaster/edit............" + id,
				"AdminController.java");

		TaxMaster hm = this.adminService.getTaxMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}

	/**
	 * @author Jyoti Mekal
	 *
	 *         All Add Edit delete for Employee Monthly Charges
	 */

	@RequestMapping(value = "/EmployeeMonthlyCharges", method = RequestMethod.GET)
	public String listEmployeeMonthlyCharges(
			@ModelAttribute("EmployeeMonthlyCharges") EmployeeMonthlyCharges EmployeeMonthlyCharges,
			Model model) {
		System.out.println("listEmployeeMonthlyCharges");
		model.addAttribute("listEmployeeMonthlyCharges",
				this.adminService.listEmployeeMonthlyCharges());
		model.addAttribute("listCustomerMaster",
				this.adminService.listCustomerMaster());
		model.addAttribute("EmployeeMonthlyCharges",
				new EmployeeMonthlyCharges());

		return "EmployeeMonthlyCharges";
	}

	@RequestMapping(value = "/EmployeeMonthlyCharges/add", method = RequestMethod.POST)
	public String addEmployeeMonthlyCharges(
			@ModelAttribute("EmployeeMonthlyCharges") EmployeeMonthlyCharges p,
			BindingResult result) {
		System.out.println(result.hasErrors());

		/*
		 * if (result.hasErrors()) {
		 * 
		 * new ZLogger("EmployeeMonthlyCharges",
		 * "bindingResult.hasErrors  "+result.hasErrors() ,
		 * "AdminController.java"); new ZLogger("EmployeeMonthlyCharges",
		 * "bindingResult.hasErrors  "+result.getErrorCount()
		 * +" All Errors "+result.getAllErrors(), "AdminController.java");
		 * return "redirect:/EmployeeMonthlyCharges.fssai"; }
		 */

		System.out.println("p.getId() " + p.getId());
		if (p.getId() == 0) {
			// new person, add it
			this.adminService.addEmployeeMonthlyCharges(p);
		} else {
			// existing person, call update
			this.adminService.updateEmployeeMonthlyCharges(p);
		}
		System.out.println("after insert");
		return "redirect:/EmployeeMonthlyCharges.fssai";
	}

	@RequestMapping("/EmployeeMonthlyCharges/remove/{id}")
	public String removeEmployeeMonthlyCharges(@PathVariable("id") int id) {

		this.adminService.removeEmployeeMonthlyCharges(id);
		return "redirect:/EmployeeMonthlyCharges.fssai";
	}

	@RequestMapping(value = "/EmployeeMonthlyCharges/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editEmployeeMonthlyCharges(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("EmployeeMonthlyCharges/edit",
				"EmployeeMonthlyCharges/edit............" + id,
				"AdminController.java");

		EmployeeMonthlyCharges hm = this.adminService
				.getEmployeeMonthlyChargesById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}
	
	
	

	/**
	 * @author Jyoti Mekal.
	 * 
	 *         screen for trainee enrollment
	 *
	 */

	@RequestMapping(value = "/NominateTrainee", method = RequestMethod.GET)
	public String nominateTrainee(
			@ModelAttribute("NominateTraineeForm") NominateTraineeForm nominateTraineeForm,
			Model model) {
		System.out.println("admin controller NominateTrainee");

		Map<String, String> userTypeMap = lst.userTypeMap;

		model.addAttribute("userTypeMap", userTypeMap);
		model.addAttribute("NominateTraineeForm", new NominateTraineeForm());

		return "NominateTrainee";
	}

	// ListEligibleUser

	@RequestMapping(value = "/ListEligibleUser", method = RequestMethod.POST)
	public String ListEligibleUser(
			@ModelAttribute("NominateTraineeForm") NominateTraineeForm nominateTraineeForm,
			Model model) {
		Map<String, String> userTypeMap = lst.userTypeMap;
		model.addAttribute("userTypeMap", userTypeMap);
		model.addAttribute("batchCodeList",
				this.adminService.listTrainingSchedule());
		System.out.println("admin controller ListEligibleUser"
				+ nominateTraineeForm.getUserType());
		model.addAttribute("listEligibleuser", this.adminService
				.listEligibleuser(nominateTraineeForm.getUserType()));

		return "NominateTrainee";
	}


	@RequestMapping(value="/enrollUser" , method=RequestMethod.POST)
	@ResponseBody
	public void enrollUser(@RequestParam("data") String data ,@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,HttpServletRequest httpServletRequest, HttpServletResponse response,HttpSession session) throws IOException{
		new ZLogger("getModule","getModule............" + data  , "CommonController.java");
		String courseName =  data;
		//int id=session.;
		String data1 = adminService.enrollUser(courseName);
		PrintWriter out = response.getWriter();
		Gson g =new Gson();
		String newList = g.toJson(data1); 
		System.out.println("newList "+newList);
		out.write(newList);
		out.flush();
		
	}

	
	
	

	// for Assessment Questions

	@RequestMapping(value = "/assessmentquestions", method = RequestMethod.GET)
	public String assessquestion(
			@ModelAttribute("AssessmentQuestionForm") AssessmentQuestionForm assesQuestionForm,
			Model model) {
		System.out.println("assessment questins");
		/*
		 * model.addAttribute("listCourseName",
		 * this.adminService.courseNameList());
		 * System.out.println("CourseNameList.............."
		 * +this.adminService.courseNameList());
		 * model.addAttribute("listCourseType",
		 * this.adminService.courseTypeList());
		 */
		// model.addAttribute("ModuleMasterForm", new ModuleMasterForm());
		model.addAttribute("listUnitMaster", this.adminService.listUnitMaster());
		model.addAttribute("listModuleMaster",
				this.adminService.listModuleMaster());

		return "assessmentquestions";
	}

	@RequestMapping(value = "/listassessmentquestions", method = RequestMethod.POST)
	public String listassessquestion(
			@ModelAttribute("AssessmentQuestionForm") AssessmentQuestionForm assesQuestionForm,
			Model model) {

		System.out.println("assesememt  post");
		System.out.println(assesQuestionForm.getUnitCode());

		model.addAttribute("listAssessmentQuestion",
				this.adminService.listAssessmentQuestion(assesQuestionForm));

		return "assessmentquestions";
	}

	@RequestMapping(value = "/addassessmentquestions", method = RequestMethod.POST)
	public String addassessquestion(
			@ModelAttribute("AssessmentQuestionForm") AssessmentQuestionForm assesQuestionForm,
			Model model) {

		System.out.println("Add  assesememt  post");
		System.out.println(assesQuestionForm.getUnitCode());
		/*
		 * model.addAttribute("trainingType",trainingType);
		 * model.addAttribute("trainingPartner",trainingPartner);
		 * model.addAttribute("listTrainingInstitude",
		 * this.adminService.listTrainingInstitude());
		 * model.addAttribute("GenerateCertificateForm", new
		 * GenerateCertificateForm());
		 * model.addAttribute("listGenerateCertificate",
		 * this.adminService.listGenerateCertificate());
		 */
		this.adminService.assessmentQuestionSave(assesQuestionForm);

		return "assessmentquestions";
	}
//also for try2 assessment question 
	@RequestMapping("/removeassessmentquestion/remove/{id}")
	public String removeAssessmentQuestion(@PathVariable("id") int id) {

		this.adminService.removeAssessmentQuestion(id);
		return "redirect:/assessmentquestions.fssai";
	}
	
	// try 2 Assessment questions
	@RequestMapping(value = "/assessmentquestions2", method = RequestMethod.GET)
	public String assessquestion2(
			@ModelAttribute("AssessmentQuestionForm") AssessmentQuestionForm assesQuestionForm,
			Model model) {
		System.out.println("assessment questins");
		
		model.addAttribute("listUnitMaster", this.adminService.listUnitMaster());
		model.addAttribute("listModuleMaster",
				this.adminService.listModuleMaster());
		

		return "assessmentquestions";
	}

	
	
	
	@RequestMapping(value = "/assessmentquestions2", method = RequestMethod.POST)
	public String aassessquestion2(
			@ModelAttribute("AssessmentQuestionForm") AssessmentQuestionForm assesQuestionForm,
			Model model) {
		
		//displayAll
		System.out.println(".................................................assesememt  post");
		//System.out.println(assesQuestionForm.getunitCode());

		model.addAttribute("listAssessmentQuestion",
				this.adminService.listAssessmentQuestion(assesQuestionForm));

	
		//inserting
		if(!(assesQuestionForm.getCorrectAnswer()==0)){
		System.out.println("Add  assesememt  post");
		//System.out.println(assesQuestionForm.getunitCode());
	
		this.adminService.assessmentQuestionSave(assesQuestionForm);
		
		}
		return "assessmentquestions";
	}
	
	
	@RequestMapping(value="/updateCertificate" , method=RequestMethod.POST)
	@ResponseBody
	public void updateCertificate(@RequestParam("data") String data ,@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,HttpServletRequest httpServletRequest, HttpServletResponse response) throws IOException{
		new ZLogger("updateCertificate","updateCertificate............" + data  , "CommonController.java");
		String data1 = adminService.updateCertificate(data);
		PrintWriter out = response.getWriter();
		Gson g =new Gson();
		String newList = g.toJson(data1); 
		System.out.println("newList "+newList);
		out.write(newList);
		out.flush();
		
	}
		//trainer name
	@RequestMapping(value = "/loadTrainer", method = RequestMethod.POST)
	@ResponseBody
	public void getTrainer(
			@RequestParam("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("loadDistrict", "loadDistrict............" + data,
				"AdminController.java");
		String instituteId = data;
		List list = pageLoadService.loadTrainer(instituteId);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(list);
		new ZLogger("loadTrainer", "newList " + newList,
				"AdminController.java");
		System.out.println(newList);
		out.write(newList);
		out.flush();

	}

	
	
	@RequestMapping(value = "/manageAssessmentQuestions", method = RequestMethod.GET)
	public String manageAssessmentQuestions(
			@ModelAttribute("assessmentQuestionForm") AssessmentQuestionForm assessmentQuestionForm,
			Model model) {
		model.addAttribute("listUnitMaster", this.adminService.listUnitMaster());
		model.addAttribute("listModuleMaster",
				this.adminService.listModuleMaster());
		return "manageAssessmentQuestions";
	}

	@RequestMapping(value = "/manageAssessmentQuestionsSave", method = RequestMethod.POST)
	public String manageAssessmentQuestionsSave(
			@Valid @ModelAttribute("assessmentQuestionForm") AssessmentQuestionForm assessmentQuestionForm,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("manageAssessmentQuestionsSave",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"AdminController.java");
			new ZLogger("manageAssessmentQuestionsSave",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"AdminController.java");
			return "manageAssessmentQuestions";
		}
		try {
			String manageAssessmentQuestionsSave = adminService
					.manageAssessmentQuestionsSave(assessmentQuestionForm);
			if (manageAssessmentQuestionsSave.equalsIgnoreCase("created")) {
				model.addAttribute("created", "Question Saved successfully !!!");
			} else {
				model.addAttribute("created",
						"	n already exists in records !!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			new ZLogger("manageAssessmentQuestionsSave",
					"Exception while manageAssessmentQuestionsSave :  "
							+ e.getMessage(), "AdminController.java");
		}
		return "manageAssessmentQuestions";
	}
	
	
	@RequestMapping(value = "/invoicePrint", method = RequestMethod.GET)
	public String invoicePrint(
			Model model , HttpServletRequest request) {
	String custId = 	request.getParameter("custId");
	String invoiceNum = 	request.getParameter("invoiceNum");
		System.out.println(" custId "+custId + " invoiceNum "+invoiceNum);
		model.addAttribute("InvoiceNum" , invoiceNum);
		List<CustomerDetails> cd = this.adminService.getCustomerDetailsByInvoice(invoiceNum);
		InvoiceInfoForm info = this.adminService.getInvoiceInfo(invoiceNum);
		double subTotal = 0.0;
		for(CustomerDetails rate :cd ){
			subTotal = subTotal+ Double.parseDouble(rate.getUnitPrice());
		}
		System.out.println(" SubTotal "+subTotal);
		model.addAttribute("listCustDetails" ,cd);	
		model.addAttribute("SubTotal" ,subTotal);	
		model.addAttribute("custAdd" , info.getCustomerAdd());
		model.addAttribute("custName" ,info.getEmployeeName());
		model.addAttribute("invoiceDate" ,info.getInvoiceDate());
		
		TaxMaster tm =this.adminService.listTaxMaster().get(0);
		model.addAttribute("service", tm.getServiceTaxRate());
		model.addAttribute("swaccha", tm.getSwacchaBharatCess());
		model.addAttribute("krishi", tm.getKrishiKalyanCess());
		Double serviceTax = Double.parseDouble(tm.getServiceTaxRate());
		Double swacchaBharat = Double.parseDouble(tm.getSwacchaBharatCess());
		Double krishiKalyan = Double.parseDouble(tm.getKrishiKalyanCess());
		
	
		model.addAttribute("serviceVal", (subTotal* serviceTax/100));
		model.addAttribute("swacchaVal", (subTotal* swacchaBharat/100));
		model.addAttribute("krishiVal", (subTotal* krishiKalyan/100));
		
		double sumTax =(serviceTax + swacchaBharat + krishiKalyan);
		System.out.println( "---- > "+(subTotal)*(sumTax/100 ));
		model.addAttribute("sumTax", ((subTotal)*(sumTax/100 )) +subTotal);
		return "invoicePrint";
	}
	
	
	
	
	
	@RequestMapping(value = "/CustomerDetails", method = RequestMethod.GET)
	public String CustomerDetails(
			@ModelAttribute("EmployeeMonthlyCharges") CustomerDetails customerDetails,
			Model model) {
	
		model.addAttribute("listCustomerDetails",
				this.adminService.listCustomerDetails());
		/*model.addAttribute("listCustomerMaster",
				this.adminService.listCustomerMaster());*/
		model.addAttribute("listCustomerMaster",
				this.adminService.listCustomCustomerMaster());
		model.addAttribute("CustomerDetails",new CustomerDetails());

		return "CustomerDetails";
	}
	@RequestMapping(value = "/InvoiceMaster", method = RequestMethod.GET)
	public String InvoiceDetails(
			@ModelAttribute("InvoiceDetails") InvoiceMaster invoiceMaster,
			Model model) {
		model.addAttribute("listCustomerMaster",
				this.adminService.listCustomerMaster());
		model.addAttribute("listInvoiceMaster",
				this.adminService.listInvoiceMaster());
		model.addAttribute("InvoiceMasterForm",new InvoiceMasterForm());
		
		return "InvoiceMaster";
	}
	
	@RequestMapping(value = "/CustomerDetailsAdd", method = RequestMethod.POST)
	public String CustomerDetailsAdd(
			@ModelAttribute("EmployeeMonthlyCharges") EmployeeMonthlyCharges p,
			BindingResult result , HttpServletRequest request) {
		System.out.println(result.hasErrors());
		
	String[] empName = request.getParameterValues("employeeName");
	String[] desc = request.getParameterValues("description");
	//String[] issueDate = request.getParameterValues("issueDate");
	String[] unitPrice = request.getParameterValues("unitPrice");
		System.out.println( " names "+unitPrice);
		System.out.println( " description "+request.getParameterValues("description"));
		String cust = request.getParameter("invoiceNumber");
		System.out.println("cust "+cust );
		this.adminService.addCustomerDetails(empName , desc  , unitPrice , cust);

		System.out.println("after insert");
		return "redirect:/CustomerDetails.fssai";
	}

	@RequestMapping("/removeCustomerDetails/remove/{id}")
	public String removeCustomerDetails(@PathVariable("id") int id) {
System.out.println( " ");
		this.adminService.removeCustomerDetails(id);
		return "redirect:/CustomerDetails.fssai";
	}
	
	@RequestMapping(value = "/InvoiceMaster/add", method = RequestMethod.POST)
	public String addInvoiceMaster(
			@Valid @ModelAttribute("InvoiceMasterForm") InvoiceMasterForm p,
			BindingResult result) {
		System.out.println(result.hasErrors());

	if (result.hasErrors()) {

			new ZLogger("InvoiceMaster", "bindingResult.hasErrors  "
					+ result.hasErrors(), "AdminController.java");
			new ZLogger("InvoiceMaster", "bindingResult.hasErrors  "
					+ result.getErrorCount() + " All Errors "
					+ result.getAllErrors(), "AdminController.java");
			return "redirect:/InvoiceMaster.fssai";
		}

		System.out.println("p.getId() " + p.getId());
		if (p.getId() == 0) {
			// new person, add it
			this.adminService.addInvoiceMaster(p);
		} else {
			// existing person, call update
			this.adminService.updateInvoiceMaster(p);
		}
		System.out.println("after insert");
		return "redirect:/InvoiceMaster.fssai";
	}

	@RequestMapping("/InvoiceMaster/remove/{id}")
	public String removeInvoiceMaster(@PathVariable("id") int id) {

		this.adminService.removeInvoiceMaster(id);
		return "redirect:/InvoiceMaster.fssai";
	}

	@RequestMapping(value = "/InvoiceMaster/edit/{id}", method = RequestMethod.POST)
	@ResponseBody
	public void editInvoiceMaster(
			@PathVariable("id") int id,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,
			HttpServletRequest httpServletRequest, HttpServletResponse response)
			throws IOException {
		new ZLogger("InvoiceMaster/edit", "InvoiceMaster/edit............"
				+ id, "AdminController.java");

		InvoiceMaster hm = this.adminService.getInvoiceMasterById(id);
		// List courseList = adminService.searchFeedbackMaster(data);
		PrintWriter out = response.getWriter();
		Gson g = new Gson();
		String newList = g.toJson(hm);
		System.out.println("newList " + newList);
		out.write(newList);
		out.flush();

	}


	
}
