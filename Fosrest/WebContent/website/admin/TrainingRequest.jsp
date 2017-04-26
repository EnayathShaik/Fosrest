<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
   <script>
   

   function OnStart() {
      
   	flatpickr("#startDate" , {
   		enableTime: true
   	});	
   	
    	flatpickr("#endDate" , {
    		enableTime: true
   	});	
   }
   window.onload = OnStart;

            </script>
 
<cf:form action="ListTrainingRequest.fssai" name="tiForm" method="POST" commandName="TrainingRequestForm" onsubmit="return validateFields();"> 

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
                                    <h1>Training Request</h1>
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
													
													<cf:options items="${trainingType}" />
												</cf:select>
											</div>
                                                
                                               <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>User Type:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:select path="userType" class="form-control">
													
													<cf:options items="${userType}"/>	
												</cf:select>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Status:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:select path="trainingStatus" class="form-control">
													
													<cf:options items="${trainingStatus}"/>	
												</cf:select>
                                                </div>
                                            
                                            </div> <!-- left side ends -->

                                            <!-- right side -->
                                            <div class="col-xs-6">

											 
                                                    <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Start Date:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:input class="form-control" path="startDate"  type="text" placeholder="Training Start Date"/>
                                                </div>							 
												 
                                                
                                             <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training End Date:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:input class="form-control" path="endDate"  type="text" placeholder="Training End Date"/>
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
                                           <legend>Training Request Result	</legend>
                                           <ct:choose>
                                            <ct:when test="${!empty listTrainingRequest}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                 <th>S.No</th>
                                                        <th>Training Type</th>
                                                        <th>User Type</th>
                                                      <th>Start Date</th>
                                                        <th>End Date</th>
                                                          <th>No of Enrollment</th>
                                                        <th>Training Status</th>
                                                        <th>Accept/Request</th>
                                                          <th>Cancel/Reject</th>
                                                        <th>Update History</th>
                                                       </tr>
                                                </thead>
                                                <ct:set var="i" value="0" />
                                                <ct:forEach items="${listTrainingRequest}" var="ti" varStatus="loop">
													
													
                                                <tr>
                                                <td>${loop.count}</td>
												<td>${ti.trainingType}</td>
												<td>${ti.userType}</td>
				
												<td>${ti.startDate}</td>
												<td>${ti.endDate}</td>
												<td>${ti.noE}</td>
												<td>${ti.trainingStatus}</td>
												<td><input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Update"/></td>
												<td><input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Cancel"/>
												<td><a href="">see details</a></td>
												
				
                                                      
												
											</tr>
										</ct:forEach>
										 
                                            </table>
                                            <div class="col-md-6 col-xs-12"></div>
                                               
                                                 <div class="col-md-6 col-xs-12">

                                                   
                                               
                                                </div>
                                                    </div>
                                           </ct:when>
                                           <ct:otherwise>Empty</ct:otherwise>
                                           </ct:choose>
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