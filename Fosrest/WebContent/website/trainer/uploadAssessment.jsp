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
 
<cf:form action="searchuploadassessment.fssai" name="maForm" method="POST" commandName="UploadAssessmentForm" onsubmit="return validateFields();"> 

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
                                    <h1>Mark Attendance</h1>
                                     <fieldset>
                                           <legend>Attendance Search Result</legend>
                                    <div class="row">
                                        <div class="col-xs-12">

                                            <!-- left side -->
                                            <div class="col-xs-6">
                                                <div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>BatchCode:</strong></li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> ${created }</li>
													</ul>
												</div>
												<cf:select path="trainingCalendarId" class="form-control" id="batchCode">
													<cf:option value="0" label="Select Batch Code" />
												<ct:forEach items="${batchCodeList}" var="abc">
													<cf:option value="${abc[1] }" label="${abc[0]}" />
													</ct:forEach> 
												<%--  <cf:options items="${batchCodeList}" itemLabel="batchCode" itemValue="batchCode" />  --%>
												</cf:select>
											</div>
                                                
                                          <%--      <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>User Type:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:select path="userType" class="form-control">
													<cf:option value="" label="FSO" />
													<cf:options items="${userType}"/>	
												</cf:select>
                                                </div> --%>
                                                
                                            
                                            </div> <!-- left side ends -->
                                              <div class="row">
                                                <div class="col-md-6 col-xs-12"></div>
                                                
                                                <div class="col-md-6 col-xs-12">

                                                    <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Search"/> 
                                               
                                                </div>
                                            </div>
<div class="row">
								<div class="col-xs-12">
									<fieldset>
										<legend>Eligible User List</legend>
										<ct:if test="${!empty listofTrainer}">
											<table class="table table-bordered table-responsive"
												id="testTable">
												<thead>
													<tr class="background-open-vacancies">

														<th>S.No.</th>
														<!-- <th>User Type</th> -->
														<th>Trainee Name</th>
														<th>Marks</th>
														<th>Result</th>
														 <th>Upload</th> 



													</tr>
												</thead>
												  <ct:set var="count" value="0" scope="page" />
                                                <ct:set var="count" value="${count + 1}" scope="page"/>
												<ct:forEach items="${listofTrainer}" var="EligibleUser"
													varStatus="loop">
													<tr>
													<td>${loop.count}</td>
													<td>${EligibleUser[0]}</td>
													<input type="hidden" id="userId_${loop.index}"
														value="${EligibleUser[1]}" />
													<td><input type="text" path="marks"/></td>
													<td> <cf:select path="result" class="form-control">
													<cf:option value="" label="Select Result" />
													<cf:options items="${result}"/>	
												</cf:select></td>
													 <td> <input type="button"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" onclick="uploadinfo();" value="Upload"/> 
                                               </tr>
												</ct:forEach>

											</table>
											<div class="col-md-6 col-xs-12"></div>

											<!-- <button type="button" class="btn btn-primary btn-lg"
												data-toggle="modal" data-target="#myModal" onClick="validateFields();  return false;" >Enroll</button> -->
								</div>
							</div>
							</ct:if>
							
                                            <!-- right side -->
                                            <div class="col-xs-6">

											<%--  <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Date:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        	<li> <span id="name_status" class = "clear-label"> </span>
                                                            ${trainingDate}</li>
                                                            <cf:input path="trainingDate" type="text" class="form-control" />
                                                
                                                        </ul>
                                                    </div>
                                                
                                                </div> --%>
                                                                                 
                                                
                                            </div> <!-- rigth side ends -->
                                            
                                            <!-- button -->
                                          
                                           
                                        </div>

                                       
                                    </div>
                                </div>

                               </fieldset>
                                <!-- search Results -->
                                            <%-- <div class="col-xs-12 " id="testt">

                                                <!-- table -->
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                            <fieldset>
                                           <legend>Attendance Search Result</legend>
                                        
                                            <ct:if test="${!empty listMarkAttendance}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        
                                                        
                                                 <th>S.No.</th>
                                                        <th>Training Type</th>
                                                        <th>User Type</th>
                                                        <th>Training Date</th>
                                                        <th>Training Start Time</th>
                                                        <th>Participant Name</th>
                                                          <th>Aadhar Number</th>
                                                        <th>Attendance</th>
                                                        
                                                       
                                                        
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listMarkAttendance}" var="ti">
                                                <tr>
												
													<td>${ti.srNo}</td>
												<td>${ti.trainingType}</td>
												<td>${ti.userType}</td>
												<td>${ti.trainingDate}</td>
												<td>${ti.startTime}</td>
												<td>${ti.participantName}</td>
												  <td><cf:input path="aadharNo" type="text" class="form-control" /></td>
										 		<td><cf:select path="attendance" class="form-control">
													
														<cf:options items="${attendance1}" />
												</cf:select></td>  
												  <!-- <td>
                                                            <select class="form-control">
                                                                <option>Present</option>
                                                                <option>Absent</option>
                                                            </select>
                                                        </td> -->
												
				
                                                     
												
											</tr>
										</ct:forEach>
										 
                                            </table>
                                             <div class="col-md-6 col-xs-12"></div>
                                               
                                                 <div class="col-md-6 col-xs-12">

                                                    <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="save"/> 
                                               
                                                </div>
                                                    </div>
                                            </ct:if>
                                           
                                        
                                           
                                        </fieldset>
                                        
                                                </div>
                                                 
                                           
                                            </div> --%>
                                             
                                                                                        
                                           
                                        </div>
                             <!-- search div ends -->
                        </div><!-- row ends -->
                    </div>
                </div>
            </div>
        
    </section>
 
 <input type="hidden" id="idHidden" value="" />
 <input type="hidden" id="hiddenCourseType" value="" />                                             
   </cf:form>
<!--    <script>
   function uploadinfo(id) {
	   alert("HHHHHHHHHHHHHHHHh");
alert("aaaaaaaaaaaaaaaaaaaaa"+$("#userId_").val());
// console.log($("#userId_"+i).val());
		var name1 = JSON.stringify({
			courseName : 0
		})
		$.ajax({
			type : 'post',
			url : 'uploadInfo' + id + '.fssai',
			contentType : "application/json",
			data : name1,
			success : function(response) {
				var mainData1 = jQuery.parseJSON(response);
				
			}
		});

	}
   </script> -->