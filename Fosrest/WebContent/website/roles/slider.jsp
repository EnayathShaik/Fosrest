<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 10);
	window.onunload = function() {
		null
	};
</script>
<%
	System.out.println("Profile ID : "
			+ session.getAttribute("profileId"));
	if (session.getAttribute("profileId").equals(3)) {
		System.out.println("Profile ID : "
				+ session.getAttribute("profileId"));
%>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		        <li><a href="OnlineTraining.fssai">Online Training </a></li>
				<li><a href="assessment-instructions-trainee.fssai">Online Assessment</a></li>
				<li><a href="GetScoreCard.fssai">Get Score Card </a></li>
				<li><a href="Certificate.fssai">Certificate</a></li>
		<!-- <li><a href="course-training.fssai?courseTypeId=1">Online Assessment</a></li>-->
		<!-- <li><a href="assessment-instructions-trainee.fssai">Assessment</a></li> -->
		<!-- <li><a href="feedbackForm.fssai">Feedback</a></li>
		<li><a href="generateCertificatetrainee.fssai">Certification</a>
		<li><a href="generateCourseCertificate.fssai">Past Certificate</a> </li> -->
		</li>
	</ul>
</div>
<%
	} else if (session.getAttribute("profileId").equals(4)) {
%>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<!-- <li><a href="search-and-apply.fssai">Search	& Apply Vacancy</a></li> -->
	<li><a href="TrainerRequest.fssai">Training Request</a></li>
	</ul>
</div>

<%
	} else if (session.getAttribute("profileId").equals(5)) {
%>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<!-- <li class="sidebar-brand">
                        </li> -->
		<li><a href="TrainingRequest.fssai">Training Request</a></li>
		<li> <a href="traineeAttendance.fssai">Mark Attendance</a> </li>
	
	</ul>
</div>

<%
	} else if (session.getAttribute("profileId").equals(6)) {
%>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<!-- <li class="sidebar-brand">
                    </li> -->
		<li><a href="viewAssessmentAgencyCalendar.fssai">Assessment
				Calendar</a></li>
		<!-- <li> <a href="trainingpartnermarkAttendence.fssai">Mark Attendance</a> </li> -->
		<li><a href="traineeAttendance.fssai">Trainee Attendance</a></li>
		<li><a href="update-result.fssai">Update Result</a></li>
		<li><a href="trainingpartnertrainingcalendar.fssai">Reschedule
				Assessment</a></li>
	</ul>
</div>

<%
	} else if (session.getAttribute("profileId").equals(7)) {
%>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<!-- <li class="sidebar-brand">
                        </li> -->
		<li><a href="postVacancyTrainingPartner.fssai">Post Vacancy
				for Trainer</a></li>
		<li><a href="trainingpartnerapplicationstatus.fssai">Application
				Status</a></li>
		<li><a href="trainingCalendarForm.fssai">View Training
				Calendar</a></li>
		<li><a href="viewFeedbackDetails.fssai">View Feedback</a></li>
		<li><a href="registrationFormTrainingPartner.fssai">Register
				Training Center</a></li>
	</ul>
</div>

<%
	} else if (session.getAttribute("profileId").equals(8)) {
%>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<!-- <li class="sidebar-brand"></li> -->
		<!-- TODO -->
		<!--                         <li><a href="viewTrainingCalendar.fssai">View Calendar</a></li> -->
		<li><a href="viewAssessmentAgencyCalendar.fssai">View
				Calendar</a></li>


	</ul>
</div>

<%
	} else if (session.getAttribute("profileId").equals(1)) {
%>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li><a href="TrainingSchedule.fssai">Training Schedule Master</a></li>
	<!-- 	<li><a href="TrainingClosure.fssai">Training Closure Report</a></li> -->
		<li><a href="GenerateCertificate.fssai">Generate Certificate</a>
		</li>
		<!-- <li><a href="UpdateTrainingSchedule.fssai">Update Training
				Schedule</a></li> -->
		<li><a href="HolidayMaster.fssai">Holiday Master</a></li>
		<li><a href="UnitMaster.fssai">Unit Master</a></li>
		<li><a href="ModuleMaster.fssai">Module Master</a></li>
		<li><a href="manageAssessmentQuestions.fssai">Assessment Questions</a></li>
		<li><a href="SubjectMaster.fssai">Subject Master</a></li>
		<li><a href="">Training Calendar</a></li>
		
                   
	</ul>
</div>

<%
	} else if (session.getAttribute("profileId").equals(2)) {
%>
<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<!-- <li class="sidebar-brand"></li> -->
		<li><a href="traineeUserManagementForm.fssai">Trainee User Management Form</a></li>
		<li><a href="NominateTrainee.fssai">Nominate Trainee</a></li>
		<li><a href="TrainingSchedule.fssai">Update Training Schedule</a></li>
</ul>
</div>

<%
	} else if(session.getAttribute("profileId").equals(20)){
%>

<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li> <a href="CustomerMaster.fssai">Customer</a> </li>
        <li> <a href="TaxMaster.fssai">Tax Master</a> </li>
        <li><a href="EmployeeMonthlyCharges.fssai">Employee Monthly Charges</a></li>
        <li><a href="CustomerDetails.fssai">Customer Details</a></li>
        <li><a href="InvoiceMaster.fssai">Invoice Details</a></li>
     <!--    <li><a href="invoicePrint.fssai">Invoice</a></li> -->
</ul>
</div>

<%
	} 
%>



