package com.ir.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.ir.form.ChangePasswordForm;
import com.ir.form.ContactTrainee;
import com.ir.form.CourseEnrolledUserForm;
import com.ir.form.GenerateCourseCertificateForm;
import com.ir.form.NominateTraineeForm;
import com.ir.form.RegistrationFormTrainer;
import com.ir.form.StateForm;
import com.ir.form.TrainerRequestForm;
import com.ir.form.UploadAssessmentForm;
import com.ir.model.AdmitCardForm;
import com.ir.model.CourseName;
import com.ir.model.Designation;
import com.ir.model.EmployeeMonthlyCharges;
import com.ir.model.FeedbackMaster;
import com.ir.model.Languages;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.State;
import com.ir.model.TrainingCalendar;
import com.ir.model.TrainingPartner_old;
import com.ir.model.TrainingPhase;
import com.ir.model.TrainingType;
import com.ir.model.Utility;
import com.ir.service.AdminService;
import com.ir.service.AssessmentAgencyService;
import com.ir.service.PageLoadService;
import com.ir.service.TraineeService;
import com.ir.service.TrainerContactService;
import com.ir.service.TrainerService;
import com.ir.util.Profiles;
import com.zentech.backgroundservices.Mail;
import com.zentech.logger.ZLogger;
import com.zentect.list.constant.ListConstant;

@Controller
@SessionAttributes
public class TrainerController {
	@Autowired
	@Qualifier("traineeService")
	public TraineeService traineeService;

	@Autowired
	@Qualifier("pageLoadService")
	PageLoadService pageLoadService;

	@Autowired
	@Qualifier("trainerService")
	public TrainerService trainerService;

	//

	@Autowired
	@Qualifier("adminService")
	AdminService adminService;

	@Autowired
	@Qualifier("trainerContactService")
	TrainerContactService trainerContactService;
	@Autowired
	@Qualifier("assessmentAgencyService")
	AssessmentAgencyService assessmentAgencyService;

	ListConstant lst = new ListConstant();

	public boolean checkAccess(HttpSession session){
		if((int)session.getAttribute("profileId")!=4){	
			new ZLogger("Illegal profileId Access","By profileId  " +session.getAttribute("profileId") ,"TrainerController.java");
			return true;
		}
		else
			return false;
	}
	
	
	
	@RequestMapping(value = "/assessment-instructions-trainer", method = RequestMethod.GET)
	public String assessmentinstructionstrainer(
			@ModelAttribute("registrationFormTrainer") RegistrationFormTrainer registrationFormTrainer,
			BindingResult bindingResult, HttpSession session, Model model) {
		if(checkAccess(session))
			return "redirect:login.fssai";
		int loginId = Integer.parseInt(session.getAttribute("loginIdUnique")
				.toString());
		CourseName courseName = traineeService.getCourseDetails(loginId);
		Utility utility = new Utility();
		// Need to write service for AsssessorAgency
		model.addAttribute("courseName", courseName);
		model.addAttribute("utility", utility);
		return "assessment-instructions-trainer";
	}

	@RequestMapping(value = "/feedbackFormTrainer", method = RequestMethod.GET)
	public String feedback(
			@ModelAttribute("courseEnrolledUserForm") CourseEnrolledUserForm courseEnrolledUserForm,
			BindingResult bindingResult, HttpSession session, Model model) {
		if(checkAccess(session))
			return "redirect:login.fssai";
		int loginId = Integer.parseInt(session.getAttribute("loginIdUnique")
				.toString());
		CourseName courseName = traineeService.getCourseDetails(loginId);
		List<FeedbackMaster> feedbackMasters = traineeService
				.getFeedMasterList(Profiles.TRAINER.value());
		model.addAttribute("courseName", courseName);
		model.addAttribute("feedbackMasters", feedbackMasters);
		return "feedbackFormTrainer";
	}

	@RequestMapping(value = "/generateCertificateTrainer", method = RequestMethod.GET)
	public String generateCertificatetraineer(
			@ModelAttribute("courseEnrolledUserForm") CourseEnrolledUserForm courseEnrolledUserForm,
			BindingResult bindingResult, HttpSession session, Model model) {
		if(checkAccess(session))
			return "redirect:login.fssai";
		int loginId = Integer.parseInt(session.getAttribute("loginIdUnique")
				.toString());
		CourseName courseName = traineeService.getCourseDetails(loginId);
		model.addAttribute("courseName", courseName);
		return "generateCertificatetraineer";
	}

	@RequestMapping(value = "/contactTrainer", method = RequestMethod.GET)
	public String contactTrainee(
			@ModelAttribute("contactTrainee") ContactTrainee contactTrainee, HttpSession session) {
		if(checkAccess(session))
			return "redirect:login.fssai";
		return "contactTrainer";
	}

	@RequestMapping(value = "/generateAdmitCardTrainer", method = RequestMethod.GET)
	public String generateAdmitCardTrainer(
			@ModelAttribute("courseEnrolledUserForm") CourseEnrolledUserForm courseEnrolledUserForm,
			BindingResult bindingResult, HttpSession httpSession, Model model) {
		if(checkAccess(httpSession))
			return "redirect:login.fssai";
		String responseText = "";
		int loginId = -1;
		try {
			loginId = (int) httpSession.getAttribute("loginIdUnique");
		} catch (Exception e) {
			responseText = "generic_error";
			new ZLogger("contactTrainer",
					"Exception while   " + e.getMessage(),
					"TrainerController.java");
		}
		CourseName courseName = traineeService.getCourseName(loginId);
		model.addAttribute("courseName", courseName);
		responseText = "generateAdmitCardTrainer";
		return responseText;
	}

	@RequestMapping(value = "/admit-cardtrainer", method = RequestMethod.GET)
	public String admitcardtrainee(
			@ModelAttribute("basicTrainee") CourseEnrolledUserForm courseEnrolledUserForm,
			@ModelAttribute("state") State state,
			@ModelAttribute("tp") TrainingPartner_old tp, BindingResult result,
			HttpSession session, Model model) {
		if(checkAccess(session))
			return "redirect:login.fssai";
		if (session.getAttribute("loginIdUnique") != null) {
			String loginid = session.getAttribute("loginIdUnique").toString();
			AdmitCardForm admitCardForm = traineeService
					.generateTrainerAdmitCard(Integer.parseInt(loginid),
							Profiles.TRAINER.value());
			model.addAttribute("admitCardForm", admitCardForm);
		}
		return "admit-cardtrainer";
	}

	@RequestMapping(value = "/course-training-trainer", method = RequestMethod.GET)
	public String coursetraining(
			@ModelAttribute("registrationFormTrainer") RegistrationFormTrainer registrationFormTrainer, HttpSession session) {
		if(checkAccess(session))
			return "redirect:login.fssai";
		return "course-training-trainer";
	}

	@RequestMapping(value = "/contactTrainerSave", method = RequestMethod.POST)
	public String contactSave(
			@ModelAttribute("contactTrainee") ContactTrainee contactTrainee,
			HttpSession session, Model modal) {
		new ZLogger("contactTrainerSave", "in controller contactTrainerSave",
				"TrainerController.java");
		String id = (String) session.getAttribute("logId");
		new ZLogger("contactTrainerSave", "id " + id, "TrainerController.java");
		String contactSave = assessmentAgencyService.contactAssessorSave(
				contactTrainee, id);
		if (contactSave.equalsIgnoreCase("created")) {
			modal.addAttribute("created", "Your mail has been sent");
		} else {
			modal.addAttribute("created", "Oops , something went wrong !!!");
		}
		return "contactTrainer";
	}

	@RequestMapping(value = "/changePasswordTrainer", method = RequestMethod.GET)
	public String contactTrainee(
			@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm, HttpSession session) {
		if(checkAccess(session))
			return "redirect:login.fssai";
		return "changePasswordTrainer";
	}

	@RequestMapping(value = "/changePasswordTrainerSave", method = RequestMethod.POST)
	public String changePasswordTrainerSave(
			@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm,
			HttpSession session, BindingResult result, Model model) {
		if (result.hasErrors()) {
			new ZLogger("changePasswordTrainerSave",
					"bindingResult.hasErrors  " + result.hasErrors(),
					"TrainerController.java");
			new ZLogger("changePasswordTrainerSave",
					"bindingResult.hasErrors  " + result.getErrorCount()
							+ " All Errors " + result.getAllErrors(),
					"TrainerController.java");
			return "changePasswordTrainee";
		}
		String id = (String) session.getAttribute("logId");
		boolean changePasswordTrainerSave = trainerContactService
				.changePasswordTrainerSave(changePasswordForm, id);
		if (changePasswordTrainerSave) {
			model.addAttribute("created", "Your password has changed !!!");
		} else {
			model.addAttribute("created", "Oops, something went wrong !!!");
		}
		return "changePasswordTrainer";
	}

	/************************************************************ FOSREST *********************************************************************************/

	/**
	 * @author Jyoti Mekal
	 */
	@RequestMapping(value = "/PersonalInformationTrainer", method = RequestMethod.GET)
	public String listSubjectMaster(
			@ModelAttribute("PersonalInformationTrainer") PersonalInformationTrainer personalInformationTrainer,
			Model model, HttpServletRequest request,HttpSession session) {
		System.out.println("PersonalInformationTrainer");
		int idd=0;//for tainer-registeraion without login.
		if(request.getParameter("id")!=null)
		idd=Integer.parseInt(request.getParameter("id"));
		System.out.println("idd "+idd);
		if(idd!=4 && (int)session.getAttribute("profileId")!=2 && (int)session.getAttribute("profileId")!=1&& (int)session.getAttribute("profileId")!=4){	
				new ZLogger("Illegal profileId Access","By profileId  " +session.getAttribute("profileId") ,"TrainerController.java");
			return "redirect:login.fssai";
			}
			
		/*	int sid=Integer.parseInt(s);*/
		List<Languages> LanguagesList=pageLoadService.loadLanguages();
		model.addAttribute("LanguagesList", LanguagesList);
		model.addAttribute("listStateMaster",
				this.adminService.listStateMaster());
		Map<String, String> titleMap = lst.titleMap;
		List<Designation> DesignationList=pageLoadService.loadDesignation();
		model.addAttribute("DesignationList", DesignationList);
		model.addAttribute("titleMap", titleMap);
		
		model.addAttribute("listTrainingInstitude",
				this.adminService.listTrainingInstitude());
		model.addAttribute("allModules", this.adminService.allUnitModules());
		
		String userId = request.getParameter("userId");
		/*int ui= (int) session.getAttribute("Id");
		System.out.println("dddddddddddd"+ui);*/
		if (userId != null && Integer.parseInt(userId) > 0) {
			personalInformationTrainer = this.traineeService
					.FullDetailTrainer(Integer.parseInt(userId));
			model.addAttribute("PersonalInformationTrainer",
					personalInformationTrainer);
			model.addAttribute("isUpdate", "Y");
			
		}else if (session.getAttribute("Id")!=null) {
		personalInformationTrainer = this.traineeService
					.FullDetailTrainer((int)session.getAttribute("Id"));
			model.addAttribute("PersonalInformationTrainer",
					personalInformationTrainer);
			model.addAttribute("isUpdate", "Y");
		}
		
		else {
			/*if(session.getAttribute("profileId")==null){
				model.addAttribute("listStateMaster",
						this.adminService.listStateMaster());
			}
			else{
				int sid=Integer.parseInt( (String) session.getAttribute("stateId"));
				model.addAttribute("listStateMaster",
						this.adminService.listStateMaster2(sid));
			}*/
			model.addAttribute("PersonalInformationTrainer",
					new PersonalInformationTrainer());	
			
		}
		if(session.getAttribute("profileId")==null)
		{
			return "PersonalInformationTrainer";
		}
		else{
			return "updatetrainerinfo";
		}
		
	}

	@RequestMapping(value = "/PersonalInformationTrainerAdd", method = RequestMethod.POST)
	public String addPersonalInfoTrainer(
			@Valid @ModelAttribute("PersonalInformationTrainer") PersonalInformationTrainer p,
			BindingResult result, Model model,HttpServletRequest request,HttpSession session) {
		String personalInformationTrainer = null;
		String pid="";
		if(session.getAttribute("profileId")==null)
			pid=(String) session.getAttribute("profileId");
		try {
			if (p.getId() == 0) {
				personalInformationTrainer = this.traineeService
						.addPersonalInfoTrainer(p,pid);
			} else {
				if(session.getAttribute("Id")==null){
					return "redirect:/trainerUserManagementForm.fssai";
				}else{
					personalInformationTrainer = this.traineeService
							.updatePersonalInfoTrainer(p);
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();

			return "PersonalInformationTrainer";
		}

		if (personalInformationTrainer != null
				&& !personalInformationTrainer.equalsIgnoreCase("updated")) {
			String[] all = personalInformationTrainer.split("&");
			model.addAttribute("id", all[1]);
			model.addAttribute("pwd", all[0]);
			new Thread(new Mail("Thanks", p.getEmail(), all[1], all[0],
					p.getFirstName())).start();
			if(pid==null){
				return "welcomeTrainer";
			}
			return "welcome";
		} else if (personalInformationTrainer.equalsIgnoreCase("updated")) {
			if (session.getAttribute("Id")!=null) {
				return "redirect:/loginProcess.fssai";
			}
			return "redirect:/trainerUserManagementForm.fssai";
		} else {
			return "PersonalInformationTrainer";
		}

	}

	/**
	 * @author Jyoti Mekal
	 */
	@RequestMapping(value = "/PersonalInformationTrainingInstitute", method = RequestMethod.GET)
	public String PersonalInformationTrainingInst(
			@ModelAttribute("PersonalInformationTrainer") PersonalInformationTrainingInstitute personalInformationTrainingInstitute,
			HttpServletRequest request, Model model,HttpSession session) {
		System.out.println("PersonalInformationTrainingInstitute");
		int idd=0;//for tainer-institute superadmin login.
		if(request.getParameter("id")!=null)
		idd=Integer.parseInt(request.getParameter("id"));
		
		if((int)session.getAttribute("profileId")!=2 && (int)session.getAttribute("profileId")!=1 && (int)session.getAttribute("profileId")!=5){	
			new ZLogger("Illegal profileId Access","By profileId  " +session.getAttribute("profileId") ,"TrainerController.java");
		return "redirect:login.fssai";
		}

		//int sid=Integer.parseInt( (String) session.getAttribute("stateId"));
		String userId = request.getParameter("userId");
		Map<String, String> userType = lst.userTypeMap;
		Map<String, String> titleMap = lst.titleMap;
		Map<String, String> opt = lst.noOfOptionMap;
		Map<String, String> trainingTypeMap = lst.trainingTypeMap;

		// titleMap
		model.addAttribute("userType", userType);
		model.addAttribute("titleMap", titleMap);
		model.addAttribute("trainingTypeMap", trainingTypeMap);
		model.addAttribute("ExpInYearMap", opt);
		model.addAttribute("ExpInMonthMap", opt);
		/*model.addAttribute("listTrainingPartner",
				adminService.listTrainingPartner());*/
		model.addAttribute("listStateMaster",
				this.adminService.listStateMaster());
		if (userId != null && Integer.parseInt(userId) > 0) {
			personalInformationTrainingInstitute = this.traineeService
					.FullDetailTrainingInstitude(Integer.parseInt(userId));
			model.addAttribute("PersonalInformationTrainingInstitute",
					personalInformationTrainingInstitute);
			model.addAttribute("isUpdate", "Y");
		} 
		else if (session.getAttribute("Id")!=null) {
			personalInformationTrainingInstitute = this.traineeService
						.FullDetailTrainingInstitude((int)session.getAttribute("Id"));
				model.addAttribute("PersonalInformationTrainingInstitute",
						personalInformationTrainingInstitute);
				model.addAttribute("isUpdate", "Y");
			}
		else {

			model.addAttribute("PersonalInformationTrainingInstitute",
					new PersonalInformationTrainingInstitute());

		}
		if(session.getAttribute("profileId")==null)
		{
		return "PersonalInformationTrainingInstitute";
		}
		else{
			return "updateinstituteinfo";
		}
	}

	@RequestMapping(value = "/PersonalInformationTrainingInstituteAdd", method = RequestMethod.POST)
	public String addPersonalInfoTrainer(
			@Valid @ModelAttribute("PersonalInformationTrainingInstitute") PersonalInformationTrainingInstitute p,
			BindingResult result, Model model,HttpSession session) {
		System.out.println("Add PersonalInformationTrainingInstitute");
		String personalInformationTrainingInstitute = null;
		int pid=0;
		pid=(int) session.getAttribute("profileId");
			System.out.println("PIDDDDDDDDDDDDDDDDDDDdd"+pid);
		
			
		try {
			if (p.getId() == 0) {
				personalInformationTrainingInstitute = this.traineeService
						.addPersonalInfoTrainingInstitute(p,pid);
			} else {
				if(session.getAttribute("Id")==null)
				{
					System.out.println("tcccccccccccc");
					return "redirect:/trainingCenterUserManagementForm.fssai";
				}
				else{
					System.out.println("tcccccccccccc111111111111111");
					personalInformationTrainingInstitute = this.traineeService
							.updatePersonalInfoTrainingInstitute(p);
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();

			return "PersonalInformationTrainingInstitute";
		}

		if (personalInformationTrainingInstitute != null
				&& !personalInformationTrainingInstitute
						.equalsIgnoreCase("updated")) {
			String[] all = personalInformationTrainingInstitute.split("&");
			model.addAttribute("id", all[1]);
			model.addAttribute("pwd", all[0]);
			new Thread(new Mail("Thanks", p.getEmail(), all[1], all[0], all[1]))
					.start();
			return "welcome";
		} else if (personalInformationTrainingInstitute
				.equalsIgnoreCase("updated")) {
			 if (session.getAttribute("Id")!=null) 
			 {
				 return "redirect:/loginProcess.fssai";
			 }
			return "redirect:/trainingCenterUserManagementForm.fssai";
		} 
		else {
			return "PersonalInformationTrainingInstitute";
		}

	}

	@RequestMapping(value = "/TrainerRequest", method = RequestMethod.GET)
	public String TrainerRequest(
			@ModelAttribute("TrainerRequestForm") TrainerRequestForm trainerRequestForm,
			Model model, HttpSession session) {
		
		System.out.println("listTrainerRequest");

		if(checkAccess(session))
			return "redirect:login.fssai";
		// Map<String, String> trainingType = lst.trainingTypeMap;
		// Map<String, String> usertype = lst.userTypeMap;
		// Map<String, String> status = lst.userStatusMap;

		// model.addAttribute("trainingtype", trainingType);
		// model.addAttribute("usertype", usertype);
		// model.addAttribute("status", status);

		// model.addAttribute("listTraningRequest",this.trainerService.listTrainingRequest());

		model.addAttribute("listTrainingType", lst.trainingTypeMap);
		model.addAttribute("listUserType", lst.userTypeMap);
		model.addAttribute("listStatusType", lst.userStatusMap);
		// model.addAttribute("TrainingRequestForm", new TrainingRequestForm());

		return "TrainerRequest";
	}

	@RequestMapping(value = "/ListTrainerRequest", method = RequestMethod.POST)
	public String ListTrainerRequest(
			@Valid @ModelAttribute("TrainerRequestForm") TrainerRequestForm trainerRequestForm,
			BindingResult result, Model model) {

		System.out.println(result.getErrorCount());
		/*
		 * if(result.hasErrors()) { return "redirect:/TrainingRequest.fssai"; }
		 */

		// Map<String, String> trainingType = lst.trainingTypeMap;
		// Map<String, String> usertype = lst.userTypeMap;
		// Map<String, String> status = lst.userStatusMap;
		//
		// model.addAttribute("trainingType", trainingType);
		// model.addAttribute("usertype", usertype);
		model.addAttribute("listTrainerRequest",
				this.trainerService.listTrainerRequest(trainerRequestForm));
		// model.addAttribute("TrainingRequestForm", new TrainingRequestForm());

		return "TrainerRequest";
	}

	/*@RequestMapping(value = "/MyCalendar", method = RequestMethod.GET)
	public String MyCalendar(
			@ModelAttribute("MyCalendarForm") MyCalendarForm MyCalendarForm,
			Model model) {
		System.out.println("listMyCalendar");

		Map<String, String> trainingType = lst.trainingTypeMap;
		Map<String, String> usertype = lst.userTypeMap;
		Map<String, String> status = lst.userStatusMap;
		Map<String, String> state = lst.stateMap;
		// Map<String, String> module = lst.moduleMap;
		// Map<String, String> unit = lst.unitMap;

		model.addAttribute("trainingtype", trainingType);
		model.addAttribute("usertype", usertype);
		model.addAttribute("status", status);
		model.addAttribute("state", state);
		// model.addAttribute("unit", unit);
		// model.addAttribute("module", module);
		// model.addAttribute("listMyCalendar",this.trainerService.listMyCalendar());

		model.addAttribute("listTrainingType", lst.trainingTypeMap);
		model.addAttribute("listUserType", lst.userTypeMap);
		model.addAttribute("listStatusType", lst.userStatusMap);
		model.addAttribute("MyCalendarForm", new MyCalendarForm());
		return "MyCalendar";
	}

	@RequestMapping(value = "/ListMyCalendar", method = RequestMethod.POST)
	public String ListMyCalendar(
			@ModelAttribute("MyCalendarForm") MyCalendarForm MyCalendarForm,
			Model model) {

		System.out.println("listMyCalendar" + MyCalendarForm.getTrainingType());

		Map<String, String> trainingType = lst.trainingTypeMap;
		Map<String, String> usertype = lst.userTypeMap;
		Map<String, String> status = lst.userStatusMap;
		Map<String, String> state = lst.stateMap;
		// Map<String, String> unit = lst.unitMap;
		// Map<String, String> module = lst.moduleMap;

		model.addAttribute("trainingType", trainingType);
		model.addAttribute("usertype", usertype);
		model.addAttribute("status", status);
		model.addAttribute("state", state);
		model.addAttribute("listMyCalendar",
				this.trainerService.listMyCalendar());
		model.addAttribute("MyCalendarForm", new MyCalendarForm());

		return "MyCalendar";
	}*/

	/*
	 * @RequestMapping(value = "/TrainerHome", method = RequestMethod.GET)
	 * public String TrainerHome(@ModelAttribute("TrainerHomeForm")
	 * TrainerHomeForm TrainerHomeForm ,Model model){
	 * 
	 * System.out.println("listCertificate"); Map<String , String> trainingType
	 * = lst.trainingTypeMap;
	 * 
	 * model.addAttribute("trainingType",trainingType);
	 * model.addAttribute("TrainerHomeForm", new TrainerHomeForm());
	 * model.addAttribute("listTrainerHome",
	 * this.trainerService.listTrainerHome()); return "TrainerHome";
	 * 
	 * }
	 */
	@RequestMapping(value = "/trainerUpdateResult", method = RequestMethod.GET)
	public String UploadAssessment(
			@ModelAttribute("UploadAssessmentForm") UploadAssessmentForm UploadAssessmentForm, Model model, HttpSession session) {
		int trainerId=(int) session.getAttribute("loginUser2");
				System.out.println("UploadAssessment");
		/*if(checkAccess(session))
			return "redirect:login.fssai";*/
		Map<String , String> trainingType = lst.trainingTypeMap;
		Map<String , String> userType = lst.userTypeMap;
		model.addAttribute("batchCodeList", this.trainerService.listBatchCodeListforTrainer(trainerId));
model.addAttribute("trainingType",trainingType);
		model.addAttribute("userType",userType);

		return "trainerUpdateResult";
	}
	@RequestMapping(value = "/searchupdateresult", method = RequestMethod.POST)
	public String saveuploadassessment(@ModelAttribute("UploadAssessmentForm") UploadAssessmentForm UploadAssessmentForm,
			Model model, HttpSession session) {
	int trainerId=(int) session.getAttribute("loginUser2");
String batchCode=UploadAssessmentForm.getBatchCode();
System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBb "+batchCode);
System.out.println("batchcode          "+batchCode);
model.addAttribute("batchCodeList", this.trainerService.listBatchCodeListforTrainer(trainerId));
model.addAttribute("SubjectList", this.trainerService.listofSubjects(trainerId,batchCode));
	model.addAttribute("listofTrainer", this.trainerService.listofTrainer(trainerId,batchCode));
		return "trainerUpdateResult";
	}
	@RequestMapping(value = "/uploadassessmentresult/{data}", method = RequestMethod.POST)
	public String uploadassessmentresult(@PathVariable("data") String data,
			@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,@ModelAttribute("UploadAssessmentForm") UploadAssessmentForm UploadAssessmentForm,
			Model model, HttpSession session,HttpServletResponse response) throws IOException {
	int trainerId=(int) session.getAttribute("loginUser2");
 this.trainerService.uploadinfo(data,trainerId);
return "redirect:trainerUpdateResult.fssai";
	}
	
	
	@RequestMapping(value="/getTrainingStartDate" , method=RequestMethod.POST)
	@ResponseBody
	public void getTrainingStartDate(@RequestParam("data") String data ,@RequestBody GenerateCourseCertificateForm generateCourseCertificateForm,HttpServletRequest httpServletRequest, HttpServletResponse response,HttpSession session) throws IOException{
		new ZLogger("getTrainingInstitute","getTrainingInstitute............" + data  , "CommonController.java");
		String courseName =  data;
		//int stateId=Integer.parseInt( (String) session.getAttribute("stateId"));
		List batchCodeList = trainerService.getTrainingStartDate(courseName);
		PrintWriter out = response.getWriter();
		Gson g =new Gson();
		String newList = g.toJson(batchCodeList); 
		System.out.println("newList "+newList);
		out.write(newList);
		out.flush();
	}
}
 