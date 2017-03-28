package com.ir.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ir.form.ChangePasswordForm;
import com.ir.form.ContactTrainee;
import com.ir.form.CourseEnrolledUserForm;
import com.ir.form.RegistrationFormTrainer;
import com.ir.model.AdmitCardForm;
import com.ir.model.CourseName;
import com.ir.model.FeedbackMaster;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.State;
import com.ir.model.TrainingPartner_old;
import com.ir.model.Utility;
import com.ir.service.AdminService;
import com.ir.service.AssessmentAgencyService;
import com.ir.service.PageLoadService;
import com.ir.service.TraineeService;
import com.ir.service.TrainerContactService;
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

	@RequestMapping(value="/assessment-instructions-trainer" , method=RequestMethod.GET)
	public String assessmentinstructionstrainer(@ModelAttribute("registrationFormTrainer") RegistrationFormTrainer registrationFormTrainer,BindingResult bindingResult, HttpSession session , Model model )
	{
		int loginId=Integer.parseInt(session.getAttribute("loginIdUnique").toString());
		CourseName courseName=traineeService.getCourseDetails(loginId);
		Utility utility=new Utility();
		//Need to write service for AsssessorAgency 
		model.addAttribute("courseName",courseName);
		model.addAttribute("utility",utility);
		return "assessment-instructions-trainer";
	}
	@RequestMapping(value="/feedbackFormTrainer" , method=RequestMethod.GET)
	public String feedback(@ModelAttribute("courseEnrolledUserForm") CourseEnrolledUserForm courseEnrolledUserForm ,BindingResult bindingResult, HttpSession session , Model model){
		int loginId=Integer.parseInt(session.getAttribute("loginIdUnique").toString());
		CourseName courseName=traineeService.getCourseDetails(loginId);
		List<FeedbackMaster> feedbackMasters=traineeService.getFeedMasterList(Profiles.TRAINER.value());
		model.addAttribute("courseName",courseName);
		model.addAttribute("feedbackMasters",feedbackMasters);
		return "feedbackFormTrainer";
	}
	
	@RequestMapping(value="/generateCertificateTrainer" , method=RequestMethod.GET)
	public String generateCertificatetraineer(@ModelAttribute("courseEnrolledUserForm") CourseEnrolledUserForm courseEnrolledUserForm ,BindingResult bindingResult, HttpSession session , Model model){
		int loginId=Integer.parseInt(session.getAttribute("loginIdUnique").toString());
		CourseName courseName=traineeService.getCourseDetails(loginId);
		model.addAttribute("courseName",courseName);
		return "generateCertificatetraineer";
	}
	
	@RequestMapping(value="/contactTrainer" , method=RequestMethod.GET)
	public String contactTrainee(@ModelAttribute("contactTrainee") ContactTrainee contactTrainee ){
		return "contactTrainer";
	}
	@RequestMapping(value="/generateAdmitCardTrainer" , method=RequestMethod.GET)
	public String generateAdmitCardTrainer(@ModelAttribute("courseEnrolledUserForm") CourseEnrolledUserForm courseEnrolledUserForm ,BindingResult bindingResult, HttpSession httpSession , Model model  ){
		String responseText = "";
		int loginId = -1;
		try{
		loginId = (int)httpSession.getAttribute("loginIdUnique");
		}catch(Exception e){
			responseText = "generic_error";
			new ZLogger("contactTrainer", "Exception while   "+e.getMessage(), "TrainerController.java");
		}
		CourseName courseName=traineeService.getCourseName(loginId);
		model.addAttribute("courseName", courseName);
		responseText =  "generateAdmitCardTrainer";
		return responseText;
	}
	
	@RequestMapping(value="/admit-cardtrainer" , method=RequestMethod.GET)
	public String admitcardtrainee(@ModelAttribute("basicTrainee") CourseEnrolledUserForm courseEnrolledUserForm ,
			@ModelAttribute("state") State state , @ModelAttribute("tp") TrainingPartner_old tp,BindingResult result ,HttpSession session, Model model ){
		if(session.getAttribute("loginIdUnique")!=null){
			String loginid=session.getAttribute("loginIdUnique").toString();
			AdmitCardForm admitCardForm=traineeService.generateTrainerAdmitCard(Integer.parseInt(loginid),Profiles.TRAINER.value());
			model.addAttribute("admitCardForm", admitCardForm);
		}
		return "admit-cardtrainer";
	}
	
	@RequestMapping(value="/course-training-trainer" , method=RequestMethod.GET)
	public String coursetraining(@ModelAttribute("registrationFormTrainer") RegistrationFormTrainer registrationFormTrainer )
	{
		return "course-training-trainer";
	}
	@RequestMapping(value="/contactTrainerSave" , method=RequestMethod.POST)
	public String contactSave(@ModelAttribute("contactTrainee") ContactTrainee contactTrainee,
			HttpSession session , Model modal){
		new ZLogger("contactTrainerSave", "in controller contactTrainerSave", "TrainerController.java");
		String id = (String) session.getAttribute("logId");
		new ZLogger("contactTrainerSave", "id "+id, "TrainerController.java");
		String contactSave = assessmentAgencyService.contactAssessorSave(contactTrainee , id);
		if(contactSave.equalsIgnoreCase("created")){
			modal.addAttribute("created" , "Your mail has been sent");
		}else{
			modal.addAttribute("created" , "Oops , something went wrong !!!");
		}
		return "contactTrainer";
	}
	
	@RequestMapping(value="/changePasswordTrainer" , method=RequestMethod.GET)
	public String contactTrainee(@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm ){
		return "changePasswordTrainer";
	}
	
	@RequestMapping(value="/changePasswordTrainerSave" , method=RequestMethod.POST)
	public String changePasswordTrainerSave(@ModelAttribute("changePasswordForm") ChangePasswordForm changePasswordForm,HttpSession session
			,BindingResult result , Model model
			){
		if(result.hasErrors()){
			new ZLogger("changePasswordTrainerSave", "bindingResult.hasErrors  "+result.hasErrors() , "TrainerController.java");
			new ZLogger("changePasswordTrainerSave", "bindingResult.hasErrors  "+result.getErrorCount() +" All Errors "+result.getAllErrors(), "TrainerController.java");
			return "changePasswordTrainee";
		}
		String id =(String) session.getAttribute("logId");
		boolean changePasswordTrainerSave = trainerContactService.changePasswordTrainerSave(changePasswordForm , id);
		if(changePasswordTrainerSave){
			model.addAttribute("created" , "Your password has changed !!!");
		}else{
			model.addAttribute("created" , "Oops, something went wrong !!!");
		}
		return "changePasswordTrainer";
	}
	
	
	/************************************************************  FOSREST *********************************************************************************/
	
	
	/**
	 * @author Jyoti Mekal
	 */
	@RequestMapping(value = "/PersonalInformationTrainer", method = RequestMethod.GET)
	public String listSubjectMaster(@ModelAttribute("PersonalInformationTrainer") PersonalInformationTrainer personalInformationTrainer ,Model model) {
			System.out.println("PersonalInformationTrainer");
			Map<String , String> userType = lst.userTypeMap;			
			Map<String , String> titleMap = lst.titleMap;
			Map<String , String> ExpBG = lst.expBGMap;
			Map<String , String> opt = lst.noOfOptionMap;
			
			//titleMap
			model.addAttribute("userType",userType);
			model.addAttribute("titleMap",titleMap);
			model.addAttribute("ExpBackgroundMap",ExpBG);
			model.addAttribute("ExpInYearMap",opt);
			model.addAttribute("ExpInMonthMap",opt);
			
			model.addAttribute("PersonalInformationTrainer", new PersonalInformationTrainer());
		return "PersonalInformationTrainer";
	}

	
	
	@RequestMapping(value = "/PersonalInformationTrainerAdd", method = RequestMethod.POST)
	public String addPersonalInfoTrainer(@Valid @ModelAttribute("PersonalInformationTrainer") PersonalInformationTrainer p , BindingResult result, Model model){
		System.out.println("Add PersonalInformationTrainer");
		String personalInformationTrainer = null;

		try{
			System.out.println(" city "+p.getCorrespondenceCity());
			personalInformationTrainer = this.traineeService.addPersonalInfoTrainer(p);
		}catch(Exception e){
			e.printStackTrace();
			
			return "PersonalInformationTrainer";
		}

		if(personalInformationTrainer != null && ! personalInformationTrainer.equalsIgnoreCase("")){
			String[] all = personalInformationTrainer.split("&");
			model.addAttribute("id" , all[1]);
			model.addAttribute("pwd" , all[0]);
			new Thread(new Mail("Thanks", p.getEmail(), all[1], all[0], p.getFirstName())).start();
			return "welcome";
		}else{
			return "PersonalInformationTrainer";
		}
	
	
	}
	
	
	
	/**
	 * @author Jyoti Mekal
	 */
	@RequestMapping(value = "/PersonalInformationTrainingInstitute", method = RequestMethod.GET)
	public String PersonalInformationTrainingInst(@ModelAttribute("PersonalInformationTrainer") PersonalInformationTrainer personalInformationTrainer ,Model model) {
			System.out.println("PersonalInformationTrainingInstitute");
			Map<String , String> userType = lst.userTypeMap;			
			Map<String , String> titleMap = lst.titleMap;
			Map<String , String> opt = lst.noOfOptionMap;
			Map<String , String> trainingParterMap = lst.trainingParterMap;
			Map<String , String> trainingTypeMap = lst.trainingTypeMap;
			
			//titleMap
			model.addAttribute("userType",userType);
			model.addAttribute("titleMap",titleMap);
			model.addAttribute("trainingTypeMap",trainingTypeMap);
			model.addAttribute("ExpInYearMap",opt);
			model.addAttribute("ExpInMonthMap",opt);
			model.addAttribute("trainingParterMap",trainingParterMap);
			model.addAttribute("listTrainingPartner", adminService.listTrainingPartner());
			model.addAttribute("PersonalInformationTrainingInstitute", new PersonalInformationTrainingInstitute());
		return "PersonalInformationTrainingInstitute";
	}

	
	
	@RequestMapping(value = "/PersonalInformationTrainingInstituteAdd", method = RequestMethod.POST)
	public String addPersonalInfoTrainer(@Valid @ModelAttribute("PersonalInformationTrainingInstitute") PersonalInformationTrainingInstitute p , BindingResult result, Model model){
		System.out.println("Add PersonalInformationTrainingInstitute");
		String personalInformationTrainingInstitute = null;

		try{
			System.out.println(" city "+p.getCorrespondenceCity());
			personalInformationTrainingInstitute = this.traineeService.addPersonalInfoTrainingInstitute(p);
		}catch(Exception e){
			e.printStackTrace();
			
			return "PersonalInformationTrainingInstitute";
		}

		if(personalInformationTrainingInstitute != null && ! personalInformationTrainingInstitute.equalsIgnoreCase("")){
			String[] all = personalInformationTrainingInstitute.split("&");
			model.addAttribute("id" , all[1]);
			model.addAttribute("pwd" , all[0]);
			new Thread(new Mail("Thanks", p.getEmail(), all[1], all[0], all[1])).start();
			return "welcome";
		}else{
			return "PersonalInformationTrainingInstitute";
		}
	
	
	}
	
	
}
