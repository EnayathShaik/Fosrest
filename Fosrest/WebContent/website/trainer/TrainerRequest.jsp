<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function OnStart() {

		flatpickr("#trainingStartDate" , {
    		enableTime: true
    	});	
    	
     	flatpickr("#trainingEndDate" , {
     		enableTime: true
    	});	
	}
	window.onload = OnStart;
</script>

<cf:form action="ListTrainerRequest.fssai" name="myForm" method="POST"
	commandName="TrainerRequestForm" onsubmit="return validateFields();">
	<section>
		<%@include file="../roles/top-menu.jsp"%>
	</section>
	<%="aaaaaaaa"%>
	<!-- main body -->
	<section class="main-section-margin-top">
		<div class="container-fluid">
			<div id="wrapper">
				<!-- Sidebar -->
				<div>
					<%@include file="../roles/slider.jsp"%>
				</div>
				<!-- /#sidebar-wrapper -->
				<!-- Page Content -->
				<div id="page-content-wrapper">
					<div class="container-fluid">
						<!-- vertical button -->
						<div class="row">
							<div class="col-lg-12">
								<a href="#menu-toggle" class="vertical-menu-position-btn"
									id="menu-toggle"> <i class="fa fa-bars"></i> <span
									class="orange-font">Welcome Trainer</span>
								</a>
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
														<cf:errors path="trainingType" style="color:red"/>
													
														 <li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> ${created }</li>
													</ul>
												</div>
												<cf:select path="trainingType" class="form-control">
													<cf:option value="" label="Select training type" />
													
													<cf:options items="${listTrainingType}" />
													
												</cf:select>
											</div>
											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>User Type:</strong></li>
														<cf:errors path="userType" style="color:red"/>
														<li class="style-li error-red"><label
															class="error visibility" id="courseError">* error</label></li>
													</ul>
												</div>
												<cf:select path="userType" class="form-control">
													<cf:option value="" label="Select user type" />
													<cf:options items="${listUserType}" />
												</cf:select>
											</div>
											<div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training End Date:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												
                                         		<cf:input path="trainingEndDate" type="text" class="form-control" />
                                                </div>
											
										</div>
										
										<!-- left side ends -->

										<!-- right side -->
										<div class="col-xs-6">

											<div class="form-group">
												<div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Start Date:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												
                                         		<cf:input path="trainingStartDate" type="text" class="form-control" />
                                                </div>
											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training
																status:</strong></li>
																<cf:errors path="status" style="color:red"/>
														<li class="style-li error-red"><label
															class="error visibility" id="courseError">* error</label></li>
													</ul>
												</div>
												<cf:select path="status" class="form-control">
													<cf:option value="" label="Select training status" />
													<cf:options items="${listStatusType}" />
												</cf:select>
											</div>
										</div>
										
										</div>
										<!-- rigth side ends -->
										<!-- button -->
										<div class="row">
											<div class="col-md-6 col-xs-12"></div>
											<div class="col-md-6 col-xs-12">

												<input type="submit"
													class="btn login-btn show-details-vacancy collapsed"
													data-toggle="collapse" data-target="#show-result"
													aria-expanded="false" value="Search" />
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
											<legend>Training Request Result</legend>
											<ct:if test="${!empty listTrainerRequest}">
												<table id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Training Type</th>
															<th>User type</th>
															<!-- <th>Unit</th>
															<th>Module</th>
															<th>Training center</th> -->
															<th>Training start date</th>
															<th>Training end date</th>
															<!-- <th>End Time</th> -->
															<!-- <th>No. of Participants</th> -->
															<th>Training Status</th>
															<th>Accept/Update</th>
															<th>Cancel/Reject</th>
															<th>Update History</th>
														</tr>
													</thead>
													<ct:forEach items="${listTrainerRequest}"
														var="TrainerRequest" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<td>${TrainerRequest.trainingType}</td>
															<td>${TrainerRequest.userType}</td>
															<%-- <td>${TrainingRequest.unit}</td>
															<td>${TrainingRequest.module}</td>
															<td>${TrainingRequest.trainingCenter}</td> --%>
															<td>${TrainerRequest.trainingStartDate}</td>
															<td>${TrainerRequest.trainingEndDate}</td>
															<%-- <td>${TrainingRequest.endTime}</td> --%>
														    <%--<td>${TrainingRequest.nop}</td> --%>
															<td>${TrainerRequest.status}</td>
															<td>${TrainerRequest.accUpd}<input type="submit"
																class="btn login-btn show-details-vacancy collapsed"
																data-toggle="collapse" data-target="#show-result"
																aria-expanded="false" value="Update" /></td>
															<td>${TrainerRequest.canRej}<input type="submit"
																class="btn login-btn show-details-vacancy collapsed"
																data-toggle="collapse" data-target="#show-result"
																aria-expanded="false" value="Cancel" /></td>
															<td><a href="">see details</a></td>
															<%-- ${TrainingRequest.updateHistory} --%>
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

	<input type="hidden" id="idHidden" value="" />
	<input type="hidden" id="hiddenCourseType" value="" />
</cf:form>