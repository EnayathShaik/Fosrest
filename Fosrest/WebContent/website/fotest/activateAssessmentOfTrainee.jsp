<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
<script type="text/javascript"
	src="website/js/jquery-toaster/jquery.toaster.js"></script>

 -->
 <script>
                function OnStart() {
                   
                	flatpickr("#trainingDate" , {
                		
                	});	
                }
                window.onload = OnStart;

            </script>
<%-- <ct:url var="addAction" value="/activateAssessmentOfTraineelist.fssai"></ct:url> --%>
<cf:form action="activateAssessmentOfTraineelist.fssai" name="myForm"
	method="POST" commandName="ActivateAssessmentOfTraineeForm">

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
									Activate Training of Trainee <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Activate Training of Trainee</legend>
											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Course Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="courseNameErr" style="display: none;"
																class="style-li error-red">State should not be
																blank.</li>

														</ul>
													</div>

													<cf:select path="courseName" class="form-control">
														<cf:option value="" label="Select Course Name" />
														<cf:options items="${courseNameMap}" />
													</cf:select>
												</div>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Date:</strong></li>
															<li class="style-li error-red"></li>
															<li id="trainingDateErr" style="display: none;"
																class="style-li error-red">State should not be
																blank.</li>
														</ul>
													</div>
													<cf:input path="trainingDate" placeholder="Training Date"
														class="form-control" />
												</div>


												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Trainee Name:</strong></li>
															<li class="style-li error-red"></li>
															<li id="traineeNameErr" style="display: none;"
																class="style-li error-red">State should not be
																blank.</li>
														</ul>
													</div>
													<cf:input path="traineeName" placeholder="Trainee Name"
														class="form-control" />
												</div>

											</div>
											<!-- right side -->
											<div class="row">

												<!-- left -->
												<div class="col-xs-6">

													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong>Training Lab:
																		<span style="color: red;">*</span>

																</strong></li>
																<li id="trainingLabErr" style="display: none;"
																	class="style-li error-red">State should not be
																	blank.</li>

															</ul>
														</div>
														<cf:input path="trainingLab" placeholder="Training Lab"
															class="form-control" />
													</div>


													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong> Training
																		Time:</strong></li>
																<li class="style-li error-red"></li>
															</ul>
														</div>
														<cf:input path="trainingTime" placeholder="Training Time"
															class="form-control" />
													</div>
													<div class="col-md-4 col-xs-12">
														<input type="submit" class="form-control login-btn"
															value="Search">
													</div>

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
											<legend>Activate Assessment Of Trainee</legend>
											<ct:if test="${!empty listactivateAssessmentOfTrainee}">
												<table id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Course Name</th>
															<th>Training Date</th>
															<th>Training LAB</th>
															<th>Trainee Name</th>
															<th>Attendance</th>
															<th>Activate Training</th>
														</tr>
													</thead>
													<ct:forEach items="${listactivateAssessmentOfTrainee}"
														var="listactivateAssessmentOfTrainee">
														<tr>
															<td>1</td>
															<td>${listactivateAssessmentOfTrainee.courseName}</td>
															<td>${listactivateAssessmentOfTrainee.trainingDate}</td>
															<td>${listactivateAssessmentOfTrainee.trainingLab}</td>
															<td>${listactivateAssessmentOfTrainee.traineeName}</td>
															<td>${listactivateAssessmentOfTrainee.attendance}</td>
															<td><input type="checkbox"></td>
														</tr>
													</ct:forEach>
												</table>
												<input type="Submit"
													class="btn login-btn show-details-vacancy collapsed"
													data-toggle="collapse" data-target="#show-result"
													aria-expanded="false" " value="Save" />
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
</body>
</html>