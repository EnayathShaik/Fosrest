<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function OnStart() {

		flatpickr("#trainingDate", {
			enableTime : true
		});

	}
	window.onload = OnStart;
</script>

<cf:form action="managetrainingcalendarlist.fssai" name="myForm"
	method="POST" commandName="manageTrainingCalendar">

	<section>
		<%@include file="../roles/top-menu.jsp"%>
	</section>
	<!-- main body -->
	<section class="main-section-margin-top">
		<div class="container-fluid">
			<div id="wrapper">
				<!-- Sidebar -->
				<%@include file="../roles/slider.jsp"%>
				<!-- /#sidebar-wrapper -->
				<!-- Page Content -->
				<div id="page-content-wrapper">
					<div class="container-fluid">
						<!-- vertical button -->
						<div class="row">
							<div class="col-lg-12">
								<a href="#menu-toggle" class="vertical-menu-position-btn"
									id="menu-toggle"> <i class="fa fa-bars"></i> <span
									class="orange-font"> Welcome ${userName }</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">
							<section class="section-form-margin-top">
								<!-- fostac logo -->
								<!-- login form -->

								<div class="col-xs-12">
									<!-- <form> -->
									<!-- personal information -->
									<div class="personel-info">
										<fieldset>
											<legend class="text-capitalize heading-3-padding">
												Manage Training Calendar Requests</legend>
											<!-- left side -->
											<div class="col-md-6 col-xs-12">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Course Name:</strong></li>
															<li class="style-li error-red"><cf:errors
																	path="courseName" cssClass="error" /></li>
														</ul>
													</div>
													<cf:select path="courseName" class="form-control">
														<cf:option value="0">Select Course Name</cf:option>
														<cf:options items="${courseNameMap}" />
													</cf:select>
												</div>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Date:</strong></li>
															<li class="style-li error-red"></li>
														</ul>
													</div>
													<cf:input path="trainingDate" class="form-control" />

												</div>
											</div>
											<!-- right side -->
											<div class="col-md-6 col-xs-12">


												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Lab:</strong></li>
															<li class="style-li error-red"><cf:errors
																	path="trainingLab" cssClass="error" /></li>
														</ul>
													</div>
													<cf:input path="trainingLab" placeholder="Training Lab"
														class="form-control" />
												</div>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Type:</strong></li>
															<li class="style-li error-red"></li>
														</ul>
													</div>
													<cf:select path="Type" class="form-control">
														<cf:option value="0">Select Type</cf:option>
														<cf:options items="${TypeMap}" />
													</cf:select>
													<!-- <input type="hidden" path="profileID" name="profileID" id="profileID" value="1"/>
                                                            			<input type="hidden" path="logindetails" name="logindetails" id="logindetails" value=""/> -->
												</div>
											</div>
								
									<div class="col-md-12 col-xs-12">
									
													<input type="submit" 
														style=" float: right; "
														value="Search" class="btn login-btn" />
										
									</div>
										</fieldset>
									</div>

									<div class="row" style="height: 20px;"></div>
									<!-- captcha -->
									<!-- buttons -->
									

									<!--  </form> -->
									<br> <br> <br>
								</div>
							</section>
							<fieldset>
								<legend>Search Results</legend>
								<section class="section-form-margin-top">
									<!-- fostac logo -->
									<!-- login form -->

														
								
												<ct:choose>
												<ct:when test="${not empty listManageTrainingCalendar }">
													<div class="row">
										<div class="col-xs-12">
											<table id="datatablesfosrest"
												class="table table-bordered table-responsive">
												<!--    <table class="table table-hover table-bordered table-responsive"> -->
												<thead>
													<th>S.No</th>
													<th>Course Name</th>
													<th>Training LAB</th>
													<th>Training Date</th>
													<th>Training Time</th>
													<th>No. Of Seats</th>
													<th>Applied Trainer</th>
													<th>Enrolled Trainer</th>
													<th>Status</th>
													<th>Cancel Calendar</th>
													<th>Comments</th>
												</thead>
												<tbody>
													
															<ct:forEach var="listManageTrainingCalendar"
																items="${listManageTrainingCalendar}" varStatus="loop">
																<tr>
																	<td>1</td>
																	<td>${listManageTrainingCalendar.courseName}</td>
																	<td>${listManageTrainingCalendar.trainingLab}</td>

																	<td>${listManageTrainingCalendar.trainingDate}</td>
																	<%-- <cf:input path="trainingDate"  class="form-control"  /> --%>
																	<td>time</td>
																	<td><input type="text" class="form-control"></td>
																	<td><cf:select path="trainerName"
																			class="form-control">
																			<cf:options items="${TrainerMap}" />
																		</cf:select></td>
																	<td><cf:select path="trainerName"
																			class="form-control">
																			<cf:options items="${TrainerMap}" />
																		</cf:select></td>
																	<td>${listManageTrainingCalendar.status}</td>
																	<td><input type="checkbox" class="form-control">
																	</td>
																	<td>${listManageTrainingCalendar.comments}</td>

																</tr>
															</ct:forEach>
												</tbody>
											</table>
											
										
											</div>
											</div>
																<div class="col-md-4 hidden-xs"></div>
									<div  class="col-md-12 col-xs-2"  >
										<input type="button"style=" float: right; "   class="btn login-btn"
											value="Save">
									</div>
														</ct:when>
												
<ct:otherwise>
													Nothing to show
														</ct:otherwise>
														
													
											
</ct:choose>

										
										<div class="col-md-2 hidden-xs"></div>
									
									
									
								
									<br /> <br />
											
								</section>
							</fieldset>
						</div>
						<!-- row -->
					</div>
				</div>
			</div>
		</div>
	</section>
</cf:form>

