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

 <%-- <ct:url var="addAction" value="/verifyTraineeEnrollment/list.fssai"></ct:url> --%> 
<cf:form action="verifyTraineeEnrollmentlist.fssai" name="myForm" method="POST"
	commandName="verifyTraineeEnrollmentForm" onsubmit="return validateFields();">

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
									class="orange-font">Welcome Fotest</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>
									Verify Trainee Enrollment <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Verify Trainee Enrollment</legend>
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
											
													<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Trainee Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="traineeNameErr" style="display:none;" class="style-li error-red" > Training Name should not be blank.</li>

														</ul>
													</div>
													<cf:input path="traineeName" placeholder="Training Lab"
														class="form-control" />
													
												</div>
                                                           <div class="col-md-4 hidden-xs"></div>
                                                        <div class="col-md-4 col-xs-12">
                                                            <a href="login.html">
                                                            
                                                                <input type="submit" class="form-control login-btn" value="Search"> </a>
                                                        </div>
                                                        <div class="col-md-4 hidden-xs"></div>

													<!-- <input type="submit" id="updatebtn"
														style="display: none; float: right; margin-right: 122px;"
														value="Update" class="btn login-btn" /> <input
														type="submit" id="createbtn" value="Create"
														class="btn login-btn" /> -->
												</div>
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
											<legend>Verify Trainee Enrollment</legend>
											<ct:if test="${!empty listVerifyTraineeEnrollment}">
												<table id="datatablesfosrest" class="table table-bordered table-responsive">
														<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Course Name</th>
															<th>Training Date</th>
															<th>Training Time</th>
															<th>Training Lab</th>
															<th>Trainee Name</th>
															<th>View Profile</th>
															<th>Activate</th>
															<th>Deactivate</th>
														</tr>
													</thead>

													<ct:forEach items="${listVerifyTraineeEnrollment}" var="VerifyTraineeEnrollment"
														varStatus="loop">

														<tr>
															<td>${VerifyTraineeEnrollment.id}</td>
															<td>${VerifyTraineeEnrollment.courseName}</td>
															<td>${VerifyTraineeEnrollment.trainingDate}</td>
															<td>${VerifyTraineeEnrollment.trainingTime}</td>
															<td>${VerifyTraineeEnrollment.trainingLab}</td>
															<td>${VerifyTraineeEnrollment.traineeName}</td>
															<td><a href="">open</a>
															 <td class="text-center">
                                                            <input type="radio" name="act">
                                                             </td>
			                                                  <td class="text-center">
                                                            <input type="radio" name="act">
                                                             </td>
															<%-- <td><button onclick='editRegion(${RegionMapping.id});return false;' >Edit</button></td>
														<td><a href="<ct:url value='/RegionMapping/remove/${RegionMapping.id}.fssai' />" >Delete</a></td> --%>
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
 
  <!--<script>
             /*    var id = localStorage.getItem('activeID');
                document.getElementById(id).className = "active";
                 */

 function editRegion(id){

                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'RegionMapping/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#id").val(mainData1.id);
            	    $("#regionName").val(mainData1.regionName);
            	    $("#district").val(mainData1.district);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }
                 
                 
                 
                 function validateFields(){
                     
                  	if($("#regionName").val() == ''){
                 		 $("#regionNameErr").css("display" , "block");
                  		return false; 
                 	 }
                  	if($("#district").val() == 0){
                		 $("#districtErr").css("display" , "block");
                 		return false; 
                	 }
              }
                </script> -->