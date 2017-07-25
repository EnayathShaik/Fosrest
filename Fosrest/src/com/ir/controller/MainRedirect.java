package com.ir.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ir.bean.common.IntStringBean;
import com.ir.bean.common.PropertyUtils;
import com.ir.form.ContactTrainee;
import com.ir.form.GenerateCertificateForm;
import com.ir.form.LoginForm;
import com.ir.form.NominateTraineeForm;
import com.ir.form.TrainerForm;
import com.ir.model.City;
import com.ir.model.CourseName;
import com.ir.model.HolidayMaster;
import com.ir.model.ManageCourseContent;
import com.ir.model.PersonalInformationTrainee;
import com.ir.model.PersonalInformationTrainingInstitute;
import com.ir.model.PersonalInformationTrainer;
import com.ir.model.State;
import com.ir.model.TrainingCalendar;
import com.ir.model.TrainingSchedule;
import com.ir.model.Utility;
import com.ir.service.AdminService;
import com.ir.service.PageLoadService;
import com.zentech.logger.ZLogger;

@Controller
public class MainRedirect {
	@Autowired
	@Qualifier("adminService")
	AdminService adminService;
	
	@Autowired
	@Qualifier("pageLoadService")
	PageLoadService pageLoadService;
	
	   @RequestMapping(value="/showTrainingCalendarDetails" , method=RequestMethod.POST)
		@ResponseBody
		public void getApplicationStatusDetails(@RequestBody Utility utility,HttpServletRequest httpServletRequest, HttpServletResponse response) throws IOException{
		   new ZLogger("showTrainingCalendarDetails", "Get Application Status............", "MainRedirect.java");
			List<Object[]> list=new ArrayList<>();
			try{
				 list = pageLoadService.loadTrainingDetails(utility);
				 response.setContentType("text/html;charset=UTF-8");
			        PrintWriter out = response.getWriter();
			        out.print(new Gson().toJson(list));
			        out.flush();
			}catch(Exception e){
				e.printStackTrace();
				new ZLogger("showTrainingCalendarDetails", "Exception while showTrainingCalendarDetails "+e.getMessage(), "MainRedirect.java");
			}
			
		}
	   
	   @RequestMapping(value="/calendarSearch" ,method = RequestMethod.GET)
	   public String calendarSearch(@ModelAttribute("utility")Utility utility,HttpSession session,BindingResult result ,  Model model) {
		   try{
			   List<CourseName> courseNameList=pageLoadService.getCouserNameList(utility.getCourseTypeId());
			   List<IntStringBean> mangePartnerList=pageLoadService.getTrainingPartnerList(utility.getCourseTypeId());
			   List<City> citys=pageLoadService.loadCity(0);
			   List<State> states=pageLoadService.loadState();
			   model.addAttribute("courseNameList", new Gson().toJson(courseNameList));
			   model.addAttribute("mangePartnerList", new Gson().toJson(mangePartnerList));
			   model.addAttribute("citys", new Gson().toJson(citys));
			   model.addAttribute("states", new Gson().toJson(states));
			   model.addAttribute("courseTypeId", utility.getCourseTypeId());
			   model.addAttribute("trainingDate", utility.getTrainingDate());
		   }catch(Exception e){
			   e.printStackTrace();
			   new ZLogger("calendarSearch", "Exception while calendarSearch "+e.getMessage(), "MainRedirect.java");
		   }
		   return "calendarSearch";
	   }
	   
	   @RequestMapping(value="/basic-level" ,method = RequestMethod.GET)
	   public String basicLevel(@ModelAttribute("login") LoginForm loginForm,HttpSession session,BindingResult result ,  Model model) {
		   try{
			   List<CourseName> courseNameList=pageLoadService.getCouserNameList(Integer.parseInt(PropertyUtils.basicLevel));
			   List<String> trainingPartnerNameList=pageLoadService.getTrainingPartnerNameList();
			   List<ManageCourseContent> manageCourseContents=pageLoadService.getManageCourseContentList(Integer.parseInt(PropertyUtils.basicLevel));
			   model.addAttribute("courseNameList", new Gson().toJson(courseNameList));
			   model.addAttribute("trainingPartnerNameList", new Gson().toJson(trainingPartnerNameList));
			   model.addAttribute("manageCourseContents", new Gson().toJson(manageCourseContents));
		   }catch(Exception e){
			   e.printStackTrace();
			   new ZLogger("basic-level", "Exception while basic-level "+e.getMessage(), "MainRedirect.java");
		   }
		    return "basic-level";
	   }
	   
	   @RequestMapping(value="/advance-level" ,method = RequestMethod.GET)
	   public String advanceLevel(@ModelAttribute("login") LoginForm loginForm,HttpSession session,BindingResult result ,  Model model) {
		   try{
			   List<CourseName> courseNameList=pageLoadService.getCouserNameList(Integer.parseInt(PropertyUtils.advanceLevel));
			   List<String> trainingPartnerNameList=pageLoadService.getTrainingPartnerNameList();
			   List<ManageCourseContent> manageCourseContents=pageLoadService.getManageCourseContentList(Integer.parseInt(PropertyUtils.advanceLevel));
			   model.addAttribute("courseNameList", new Gson().toJson(courseNameList));
			   model.addAttribute("trainingPartnerNameList", new Gson().toJson(trainingPartnerNameList));
			   model.addAttribute("manageCourseContents", new Gson().toJson(manageCourseContents));
		   }catch(Exception e){
			   e.printStackTrace();
			   new ZLogger("advance-level", "Exception while advance-level "+e.getMessage(), "MainRedirect.java");
		   }
	     return "advance-level";
	   }
	   @RequestMapping(value="/special-level" ,method = RequestMethod.GET)
	   public String specialLevel(@ModelAttribute("login") LoginForm loginForm,HttpSession session,BindingResult result ,  Model model) {
		   try{
			   List<CourseName> courseNameList=pageLoadService.getCouserNameList(Integer.parseInt(PropertyUtils.specialLevel));
			   List<String> trainingPartnerNameList=pageLoadService.getTrainingPartnerNameList();
			   List<ManageCourseContent> manageCourseContents=pageLoadService.getManageCourseContentList(Integer.parseInt(PropertyUtils.specialLevel));
			   model.addAttribute("courseNameList", new Gson().toJson(courseNameList));
			   model.addAttribute("trainingPartnerNameList", new Gson().toJson(trainingPartnerNameList));
			   model.addAttribute("manageCourseContents", new Gson().toJson(manageCourseContents));
		   }catch(Exception e){
			   e.printStackTrace();
			   new ZLogger("special-level", "Exception while special-level "+e.getMessage(), "MainRedirect.java");
		   }
	     return "special-level";
	   }
	   @RequestMapping(value="/fostac" ,method = RequestMethod.GET)
	   public String fostac(HttpSession session) {
		   session.invalidate();
		   return "redirect:index.jsp";
	   }
	   @RequestMapping(value="/contact" ,method = RequestMethod.GET)
	   public String contact() {
		   return "contact";
	   }
	   @RequestMapping(value="/about" ,method = RequestMethod.GET)
	   public String about() {
		   return "about";
	   }
	   @RequestMapping(value="/disclaimer" ,method = RequestMethod.GET)
	   public String disclaimer() {
		   return "disclaimer";
	   }
	   @RequestMapping(value = "/feedback", method = RequestMethod.GET)
		public String feedback(@ModelAttribute("ContactTrainee") ContactTrainee contactTrainee,Model model, HttpSession session) {
			System.out.println("Feedback....................!");
			/*if(checkAccess(session))
				return "redirect:login.fssai";*/
			//model.addAttribute("listPhotoGallery", this.adminService.listPhotoGallery());
			return "feedback";
		}
	   @RequestMapping(value="/feedbacksave" , method=RequestMethod.POST)
	   public String contactTrainee1(@ModelAttribute("ContactTraineee") ContactTrainee contactTrainee
	   		,BindingResult result , HttpSession session, Model model
	   		){
	   	if(result.hasErrors()){
	   		new ZLogger("feedbacksave", "bindingResult.hasErrors  "+result.hasErrors() , "MainRedirect.java");
	   		new ZLogger("feedbacksave", "bindingResult.hasErrors  "+result.getErrorCount() +" All Errors "+result.getAllErrors(), "MainRedirect.java");
	   		return "shareInitiativesave";
	   	}
	   	model.addAttribute("ContactTrainee",  new ContactTrainee());
	   	try{
	   		//String id=(String) session.getAttribute("userName");
	   		String id="01";
	   		//int id1=(int) session.getAttribute("userId");
	   		//new ZLogger("feedbacksave","userid   "+ id  , "AdminController.java");
	   		String feedbacksave = pageLoadService.feedbacksave(contactTrainee , id);
	   		if(feedbacksave.equalsIgnoreCase("created")){
	   			model.addAttribute("created" , "Your request has been sent successfully !!!");
	   		}else{
	   			model.addAttribute("created" , "Oops, something went wrong !!!");
	   		}
	   	}catch(Exception e){
	   		e.printStackTrace();
	   		
	   	}
	   	return "feedback";
	   	
	   }
	   
	   @RequestMapping(value="/faq" ,method = RequestMethod.GET)
	   public String faq() {
		   return "faq";
	   }
	   @RequestMapping(value="/knowYourTrainingPartner" ,method = RequestMethod.GET)
	   public String knowYourTrainingPartner() {
		   return "knowYourTrainingPartner";
	   }
	   @RequestMapping(value="/basicFoodSafetyCertification" ,method = RequestMethod.GET)
	   public String basicFoodSafetyCertification(@ModelAttribute("login") LoginForm loginForm,HttpSession session,BindingResult result ,  Model model) {
		   List<CourseName> courseNameList=pageLoadService.getCouserNameList(Integer.parseInt(PropertyUtils.basicLevel));
		   List<String> trainingPartnerNameList=pageLoadService.getTrainingPartnerNameList();
		   List<ManageCourseContent> manageCourseContents=pageLoadService.getManageCourseContentList(Integer.parseInt(PropertyUtils.basicLevel));
		   model.addAttribute("courseNameList", new Gson().toJson(courseNameList));
		   model.addAttribute("trainingPartnerNameList", new Gson().toJson(trainingPartnerNameList));
		   model.addAttribute("manageCourseContents", new Gson().toJson(manageCourseContents));
		   return "basicFoodSafetyCertification";
	   }
	   @RequestMapping(value="/certificationProcess" ,method = RequestMethod.GET)
	   public String certificationProcess() {
		   return "certificationProcess";
	   }
	   @RequestMapping(value="/viewEnrolledCourse" ,method = RequestMethod.GET)
	   public String viewEnrolledCourse() {
		   return "viewEnrolledCourse";
	   }

	   @RequestMapping(value="/afterLoginContact" ,method = RequestMethod.GET)
	   public String afterLoginContact() {
		   return "afterLoginContact";
	   }
	  
	   @RequestMapping(value="/trainee" ,method = RequestMethod.GET)
	   public String trainee() {
		   return "trainee";
	   }
	   
	   @RequestMapping(value="/trainer" ,method = RequestMethod.GET)
	   public String trainer(@ModelAttribute("TrainerForm") TrainerForm trainerForm, Model model) {
		   model.addAttribute("trainerForm", new TrainerForm());
		   model.addAttribute("listTrainer", this.pageLoadService.listTrainer());
		   return "trainer";
	   }
	   @RequestMapping(value="/PersonalInformationTrainer" ,method = RequestMethod.POST)
	   public String trainerform() {
		   return "PersonalInformationTrainerOUT";
	   }
	   
	   @RequestMapping(value = "/trainingInstitute", method = RequestMethod.GET)
		public String trainingInstitute(
				@ModelAttribute("PersonalInformationTrainingInstitute") PersonalInformationTrainingInstitute PersonalInformationTrainingInstitute, Model model, HttpSession session) {
		   System.out.println("trainingInstitute");
		   model.addAttribute("trainingInstituteList", this.pageLoadService.trainingInstituteList());
		   model.addAttribute("PersonalInformationTrainingInstitute", new PersonalInformationTrainingInstitute());
		   
		   
		   return "trainingInstitute";
	   }
	  
	   @RequestMapping(value="/assessor" ,method = RequestMethod.GET)
	   public String assessor() {
		   return "assessor";
	   }
	  
	   @RequestMapping(value="/learningresource" ,method = RequestMethod.GET)
	   public String learningResource(Model model) {
		 System.out.println( pageLoadService.learningResource());
		   model.addAttribute("learningResourceList",pageLoadService.learningResource());
		   return "learningresource";
	   }
	   
	   @RequestMapping(value="/TotCalendar" ,method = RequestMethod.GET)
	   public String TotCalendar(Model model) {
		   System.out.println( "inside TotCalendar");
		   model.addAttribute("listTotCalendar",pageLoadService.totCalendarlist());
		   return "TotCalendar";
	   }
	  /* @RequestMapping(value="/mastertrainer" ,method = RequestMethod.GET)
	   public String mastertrainer(Model model) {
		   System.out.println("mastertrainer");
		   model.addAttribute("mastertrainerList",pageLoadService.masterTrainer());
		   return "mastertrainer";
	   }*/
	   @RequestMapping(value="/upcomingevents" ,method = RequestMethod.GET)
	   public void mastertrainer2(@ModelAttribute("TrainingSchedule") TrainingSchedule TrainingSchedule,Model model,HttpServletResponse response) throws IOException {
		   System.out.println("mastertrainer");
		   //model.addAttribute("listTrainingSchedule", this.adminService.listTrainingSchedule(0, 0));
		   List<TrainingSchedule> data1=this.adminService.listTrainingSchedule(0, 0);
			PrintWriter out = response.getWriter();
			Gson g = new Gson();
			String newList = g.toJson(data1);
			System.out.println("newList " + newList);
			out.write(newList);
			out.flush();
		  // return "index";
		  // return "redirect:index.fssai";
	   }
	   
	   
	   
	   @RequestMapping(value="/disPhotoGallery" ,method = RequestMethod.GET)
	   public void disPhotoGallery(@ModelAttribute("TrainingSchedule") TrainingSchedule TrainingSchedule,Model model,HttpServletResponse response) throws IOException {
		   System.out.println("disPhotoGallery");
		   List<String> links=this.adminService.disPhotoGallery();
		 PrintWriter out = response.getWriter();
			Gson g = new Gson();
			String newList = g.toJson(links);
			System.out.println("newList " + newList);
			out.write(newList);
			out.flush();
	   }
	  
}
