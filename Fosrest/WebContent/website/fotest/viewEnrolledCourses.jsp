<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript"
	src="website/js/jquery-toaster/jquery.toaster.js"></script>
 <script>
                function OnStart() {
                   
                	flatpickr("#trainingDate" , {
                		
                	});	
                }
                window.onload = OnStart;

            </script>


<%-- <ct:url var="addAction" value="/viewEnrolledCourses/list"></ct:url>--%>
<cf:form action="viewEnrolledCourseslist.fssai" name="myForm" method="POST"
	commandName="viewEnrolledCoursesForm" onsubmit="return validateFields();">

	<section>
		<%@include file="/website/roles/top-menu.jsp"%>
	</section>
	<!-- main body -->
	<section class="main-section-margin-top">
		<div class="container-fluid">
			<div id="wrapper">
				<!-- Sidebar -->
				<%@include file="/website/roles/slider.jsp"%>
				<!-- /#sidebar-wrapper -->
				<!-- Page Content -->
				<div id="page-content-wrapper">
					<div class="container-fluid">
						<!-- vertical button -->
						<div class="row">
							<div class="col-lg-12">
								<a href="#menu-toggle" class="vertical-menu-position-btn"
									id="menu-toggle"> <i class="fa fa-bars"></i> <span
									class="orange-font">Welcome Admin</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>
									View Enrolled Courses <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>View Enrolled Courses</legend>
										<cf:input path="id" type="hidden" /> 

											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Lab: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="trainingLabErr" style="display:none;" class="style-li error-red" > Training Lab should not be blank.</li>

														</ul>
													</div>
													<cf:input path="trainingLab" placeholder="Training Lab"
														class="form-control" />
													
												</div>
												
												<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong>Course Name:</strong></li>
																<li class="style-li error-red"></li>
																<li id="courseNameErr" style="display:none;" class="style-li error-red" > Course Name should not be blank.</li>
															</ul>
														</div>

														<cf:select path="courseName" class="form-control">
															<cf:option value="" label="Select course Name" />
															<cf:options items="${courseNameMap}" />
														</cf:select>
													</div>

											</div>
											<!-- right side -->
											<div class="row">

												<!-- left -->
												<div class="col-xs-6">

												<div class="form-group">
												          <div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training Date:</strong></li>
														
														<li id="trainingDateErr" style="display: none;"
															class="style-li error-red">Please Select Training Date.</li>
															 	<li class="style-li error-red"><label
															class="error visibility" id="courseError">*</label></li>
													</ul>
												          </div>
												<cf:input class="form-control" path="trainingDate"
													type="text" placeholder="Training Date" />
											       </div>
                                             <!-- button -->
                                                     
                                                       <div class="col-md-4 col-xs-12">
                                                            <input type="button" class="form-control login-btn" value="Download">
                                                         </div>
                                                        <div class="col-md-4 col-xs-12">
                                                            <input type="submit" class="form-control login-btn" value="Search">
                                                         </div> 
                                          
                                              <!-- <input type="submit" id="updatebtn"
														style="display: none; float: right; margin-right: 122px;"
														value="Update" class="btn login-btn" /> <input
														type="submit" id="createbtn" value="Create"
														class="btn login-btn" /> -->                
                                                        
													
												
											</div>

										</fieldset>
									</div>
								</div>
							</div>

							<!-- search Results -->
							<div class="col-xs-12 " id="testt">

								<!-- table -->
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>View Enrolled Courses</legend>
											<ct:if test="${!empty listviewEnrolledCourses}">
												<table id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Trainer Name</th>
															<th>Course Name</th>
															<th>Training LAB</th>
															<th>Training Date</th>
															<th>Training Time</th>
															<th>No. Of Seats</th>
															<th>Trainee Name</th>
														    <th>Trainee Attendance Status</th>
														</tr>
													</thead>

													<ct:forEach items="${listviewEnrolledCourses}" var="viewEnrolledCourses"
														varStatus="loop">

														<tr>
															<td>${loop.count}</td>
															<td>${viewEnrolledCourses.trainerName}</td>
			                                                 <td>${viewEnrolledCourses.courseName}</td>
			                                                <td>${viewEnrolledCourses.trainingLab}</td>
			                                                <td>${viewEnrolledCourses.trainingDate}</td>
			                                                <td>${viewEnrolledCourses.trainingTime}</td>
			                                                  <td>${viewEnrolledCourses.noOfSeats}</td>
			                                               <td>${viewEnrolledCourses.traineeName}</td>
			                                                  <td>${viewEnrolledCourses.status}</td>
			
															<%-- <td><button onclick='editTraining(${manageTraining.id});return false;' >Edit</button></td>
														<td><a href="<ct:url value='/manageTraining/remove/${manageTraining.id}.fssai' />" >Delete</a></td> --%>
														</tr>
													</ct:forEach>
												</table>
											</ct:if>
										</fieldset>
									</div>
								</div>
							</div>

							<!-- search div ends -->

						</div>
						<!-- row ends -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<input type="hidden" id="idH" value="" />
</cf:form>
  <!-- <script>
             /*    var id = localStorage.getItem('activeID');
                document.getElementById(id).className = "active";
                 */

function editTraining(id){

                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'manageTraining/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#id").val(mainData1.id);
            	    $("#trainingName").val(mainData1.trainingName);
            	    $("#moduleName").val(mainData1.moduleName);
            	    $("#duration").val(mainData1.duration);
        		    $("#status").val(mainData1.status);
            	    
        		    $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }
                 
                 
                 
                 /* function validateFields(){
                     
                  	if($("#trainingName").val() == ''){
                 		 $("#trainingNameErr").css("display" , "block");
                  		return false; 
                 	 }
                  	if($("#moduleName").val() == 0){
                		 $("#moduleNameErr").css("display" , "block");
                 		return false; 
                	 }
                  	if($("#duration").val() == 0){
               		 $("#durationErr").css("display" , "block");
                		return false; 
               	 }
              } */
 </script> -->