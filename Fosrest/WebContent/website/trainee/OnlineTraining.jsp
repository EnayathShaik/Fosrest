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
import com.ir.form.GenerateCertificateForm;<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <script type="text/javascript">

 function OnStart(){
	var steps = 1;
	var traineeSteps =
		<%=(Integer) session.getAttribute("traineeSteps")%>
	alert(" steps "+steps + " traineeSteps "+traineeSteps);
	if(steps >= traineeSteps){
	}else{
		if(steps-1 == traineeSteps){
			alert('Please Complete Your Previous Training First')
		}else{
			alert('Please Flow Step By Step..');
		}
		window.location.href ='/Fosrest/loginProcess.fssai';
	}
}
window.onload = OnStart; 

</script> 


 <%-- <ct:url var="addAction" value="/TrainingSchedule/add.fssai" ></ct:url> --%>
<cf:form action="ListOnlineTraining.fssai" name="myForm" method="POST" commandName="OnlineTrainingForm" onsubmit="return validateFields();"> 

    <section>
         <%@include file="../roles/top-menu.jsp"%>
    </section>
    <!-- main body -->
    <section class="main-section-margin-top">
        <div class="container-fluid">
            <div id="wrapper">
                <!-- Sidebar -->
                <div > <%@include file="../roles/slider.jsp" %>
                </div>
                <!-- /#sidebar-wrapper -->
                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <!-- vertical button -->
                        <div class="row">
                            <div class="col-lg-12">
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome ${userName}</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                       
                        <div class="row">
                             <div class="container-fluid">
                            <div class="row">
                                <!-- legend -->
                                <div class="col-xs-12">
                                    <fieldset>
                                    
                                     
                                        <legend> Online Training</legend>
                                        
                                        <h4> Training Type: ${listOnlineTraining.trainingType}</h4>
                                        <h4>Training Phase: ${listOnlineTraining.trainingPhase}</h4>
                                        <h4>Training Duration: ${listOnlineTraining.trainingstartdate} to ${listOnlineTraining.trainingenddate} </h4>
                                        <%--  <ct:out value="${listOnlineTraining}"></ct:out> --%>
                                          
                                           <%-- <ct:forEach items="${listOnlineTraining}" var="OnlineTraining">
                                                 ${OnlineTraining.trainingPhase}
                                                    </ct:forEach>  --%>
                                                     
                                       
                                    
                                    
                                        <br> </fieldset>
                                    <br> </div>
                              
                              
                              
                                
                                <!-- search Results -->
                                          <div class="col-xs-12">
                                    <fieldset>
                                        <legend> Course Curriculum</legend>
                                        
                                         <h4>${listTrainingTopic.unitName}</h4>
                                         <ul> <li>${listOnlineTraining.moduleName}
                                         <ul><li>${listTrainingTopic.contentType}</li></ul>
                                          <ul> <li>${listTrainingTopic.contentName}</li></ul>
                                         <ul> <li><a href="">${listTrainingTopic.contentLink}</a></li> 
                                           </li></ul>
                             <!-- search div ends -->
                        </div><!-- row ends -->
                    </div>
                </div>
            </div>
        </div>
    </section>
 
 <input type="hidden" id="idHidden" value="" />
 <input type="hidden" id="hiddenCourseType" value="" />                                             
   </cf:form>