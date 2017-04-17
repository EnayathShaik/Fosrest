<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
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
		window.location.href ='/Fssai_E-Learning_System/loginProcess.fssai';
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
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Trainee</span> </a>
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
                                        <h4>Training Type:</h4>
                                        <h4>Training Phase:</h4>
                                        <h4>Training Duration: </h4>
                                    
                                    
                                        <br> </fieldset>
                                    <br> </div>
                              
                              
                              
                                
                                <!-- search Results -->
                                           <div class="col-xs-12">
                                    <fieldset>
                                        <legend> Course Curriculum</legend>
                                      
                                      <!--   topic -->
                                         <ct:forEach items="${listTrainingTopic}" var="topic">
                                               <ct:out value="${topic}"/><p>
                                              
                                         <!--   module  -->
                                         <ul>
                                         <ct:forEach var="module" items="${listTopicModule}">
                                          <li><a href="?">${module}</a></li> 
                                       </ct:forEach></ul>
                                        </ct:forEach>
                                              
                                                
                                             
                                       
                                              
                                               
                                       
                                             
                                                 
                                                 
                                                  <%-- 
                                                   <ct:forEach items="${listTopicModule}" var="module">
                                                    <ct:out value="${module}"/><p> 
                                              </ct:forEach>
                                               --%>
                                              
                                                <%-- <a href="${module}"></a> --%>
                                               
                                               
                                                 <%--  <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Modules:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
                                                 <cf:select path="TopicModule" class="form-control">
													<cf:option value="" label="Select Topic Modules" />
													<cf:options items="${listTopicModule}" />	
												</cf:select>
                                                </div>   --%>
                                      <%--  <ul>
                                       <ct:forEach var="module" items="${listTopicModule}">
                                       <li><a href="???">${module}</a></li>
                                       </ct:forEach>
                                       </ul> --%>
                                       
                                       <!--  <h3><span class="f16">Topic 1:</span></h3>
                                        
                                        <h3><span class="f16">Topic 2:</span></h3>
                                      
                                        <h3><span class="f16">Topic 3:</span></h3> -->
                                       </fieldset>
                                    <br> </div>
                            </div>
                                          
                                          
                                         
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