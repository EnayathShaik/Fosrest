<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>

 <%-- <ct:url var="addAction" value="/TrainingSchedule/add.fssai" ></ct:url> --%>
<cf:form action="ListTrainingSchedule.fssai" name="myForm" method="POST" commandName="TrainingScheduleForm" onsubmit="return validateFields();"> 

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
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Admin</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                        <div class="row">

                                <div class="col-xs-12">
                                    <h1>Training Schedule Master</h1>
                                    <div class="row">
                                        <div class="col-xs-12">

                                            <!-- left side -->
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Type:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="trainingType" class="form-control">
													<cf:option value="" label="Select training" />
													<cf:options items="${trainingType}" />
												</cf:select>
											</div>
                                                
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Phase:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:select path="trainingPhase" class="form-control">
													<cf:option value="" label="Select training phase" />
													<cf:options items="${trainingPhase}"/>	
												</cf:select>
                                                </div>
                                                
                                            
                                            </div> <!-- left side ends -->

                                            <!-- right side -->
                                            <div class="col-xs-6">

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong></strong></li>
														<li class="style-li error-red"><span id="name_status">
														</span><span id="err"> </span> <label id=userTypeError
															class="error visibility">* Select UserType </label> <cf:errors
																path="userType" cssClass="error" />${created }</li>
													</ul>
												</div>
												<cf:select path="userType" class="form-control">
													<cf:option value="" label="Select User Type" />
													<cf:options items="${userType}" />
												</cf:select>
											</div>

											<div class="form-group">
                                                    <div>
													<ul class="lab-no">
														<li class="style-li"><strong>Status:</strong></li>
														<li class="style-li error-red"><cf:errors
																path="status" cssClass="error" /></li>
													</ul>
												</div>
  																<cf:select path="status" class="form-control">
                                                                    <cf:option value="A" label="Active" />
                                                                    <cf:option value="I" label="In-Active" />
                                                                </cf:select>

                                                </div>
                                                
                                         
                                         
                                                
                                            </div> <!-- rigth side ends -->
                                            
                                            <!-- button -->
                                            <div class="row">
                                                <div class="col-md-6 col-xs-12"></div>
                                                
                                                <div class="col-md-6 col-xs-12">

                                                    <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Search"/> 
                                               
                                                </div>
                                            </div>
                                           
                                        </div>

                                       
                                    </div>
                                </div>

                                
                                <!-- search Results -->
                                            <div class="col-xs-12 " id="testt">

                                                <!-- table -->
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                            <fieldset>
                                           <legend>Unit Master</legend>
                                            <ct:if test="${!empty listTrainingSchedule}">
                                            <table class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>User Type</th>
                                                        <th>Training Type</th>
                                                        <th>Training Phase</th>
                                                        <th>Unit Name</th>
                                                        <th>Status</th>
                                                        <th>Edit</th>
                                                        
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listTrainingSchedule}" var="TrainingSchedule">
                                                <tr>
												
												<td>${TrainingSchedule.userType}</td>
												<td>${TrainingSchedule.trainingType}</td>
												<td>${TrainingSchedule.trainingPhase}</td>
												<td>${TrainingSchedule.day}</td>
												<td>${TrainingSchedule.unit}</td>
												<td>${TrainingSchedule.module}</td>
												<td>${TrainingSchedule.duration}</td>
												
											</tr>
										</ct:forEach>
                                            </table>
                                           </ct:if>
                                        </fieldset>
                                                    </div>
                                                </div>
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