<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>

 <script>
                function OnStart() {
                   
                	flatpickr("#trainingDate" , {
                		
                	});	
                }
                window.onload = OnStart;

            </script>
 
<cf:form action="ListTrainingClosure.fssai" name="myForm" method="POST" commandName="TrainingClosureForm" onsubmit="return validateFields();"> 

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
                                    <h1>Training Closure Report</h1>
                                    <div class="row">
                                        <div class="col-xs-12">

                                            <!-- left side -->
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Type:</strong></li>
                                                          <!--  valid -->
                                                            <li id="trainingTypeErr" style="display:none;" class="style-li error-red" > Please Select Training Type.</li>
                                                            
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
                                                            <li class="style-li"><strong>Training Institute:</strong></li>
                                                           <!--  valid -->
                                                            <li id="trainingInstituteErr" style="display:none;" class="style-li error-red" >Please Select Training Institute.</li>
                                                            
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:select path="trainingInstitute" class="form-control">
													<cf:option value="" label="Select training institute" />
													<cf:options items="${listTrainingInstitude}"/>	
												</cf:select>
                                                </div>
                                                
                                                 <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Date:</strong></li>
                                                             <!--   valid -->
                                                             <li id="trainingDateErr" style="display:none;" class="style-li error-red" >Please Select Training Date.</li>
                                                             
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:input path="trainingDate" type="text" class="form-control" />
                                         
                                                </div>
                                                
                                            
                                            </div> <!-- left side ends -->

                                            <!-- right side -->
                                            <div class="col-xs-6">

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>User Type:</strong></li>
														 <!--   valid -->
                                                             <li id="userTypeErr" style="display:none;" class="style-li error-red" >Please Select User Type.</li>
                                                             
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
														<!--   valid -->
                                                             <li id="statusErr" style="display:none;" class="style-li error-red" >Please Select Status.</li>
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
                                           <legend>Training Closure Search Result</legend>
                                            <ct:if test="${!empty listTrainingClosure}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        
                                                       <th>Sr.No.</th>
                                                        <th>Training Type</th>
                                                         <th>User Type</th>
                                                         <th>Training Date</th>
                                                        <th>Training Institute</th>
                                                        <th>Training Status</th>
                                                         
                                                       
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listTrainingClosure}" var="TrainingClosure">
                                                <tr>
											    <td>${TrainingClosure.id}</td>
												<td>${TrainingClosure.trainingType}</td>
												<td>${TrainingClosure.userType}</td>
												<td>${TrainingClosure.trainingDate}</td>
												<td>${TrainingClosure.trainingInstitute}</td>
												<td>${TrainingClosure.status}</td>
												
												
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
   
    <!--   validation function -->
   <script>
   
   function validateFields(){
	   $("#userTypeErr").css("display" , "none");
  	 $("#trainingTypeErr").css("display" , "none");
  	 $("#trainingInstituteErr").css("display" , "none");
  	 $("#statusErr").css("display" , "none");
  	 $("#trainingDateErr").css("display" , "none");
  	 
  	 
   	 if($("#trainingType").val() ==''){
   		 
   		$("#trainingTypeErr").css("display" , "block");
   		return false;
   	 } else if($("#trainingInstitute").val() == ''){
   		 $("#trainingInstituteErr").css("display" , "block");
    		return false; 
   	 }else if($("#userType").val() == ''){
   		 $("#userTypeErr").css("display" , "block");
 		return false; 
	 }else if($("#trainingDate").val() == ''){
   		 $("#trainingDateErr").css("display" , "block");
 		return false; 
	 }else if($("#status").val() == ''){
   		 $("#statusErr").css("display" , "block");
  		return false;
	 }
   }
	 </script>