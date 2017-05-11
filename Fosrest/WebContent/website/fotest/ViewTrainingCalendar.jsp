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


<cf:form action="viewTrainingCalendarlist.fssai" name="myForm"
	method="POST" commandName="viewTrainingCalendar">

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
									<h3 class="text-capitalize heading-3-padding">View
										Training Calendar</h3>


									<div class="personel-info">
										<fieldset>
											<!-- left side -->
											<div class="col-md-6 col-xs-12">

												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Course Name:</strong></li>
															<li class="style-li error-red"></li>
														</ul>
													</div>
													<cf:select path="courseName" id="courseName"
														class="form-control">
														<cf:option value="0">Select Course Name</cf:option>
														<cf:options items="${courseNameMap}" />

													</cf:select>
												</div>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Date:</strong></li>
															<li class="style-li error-red"><cf:errors
																	path="trainingDate" cssClass="error" /></li>
														</ul>
													</div>
													<cf:input path="trainingDate" placeholder="Training Date"
														class="form-control" />
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
													<cf:select path="type" id="type" class="form-control">
														<cf:option value="0">Select Type</cf:option>
														<cf:options items="${TypeMap}" />
													</cf:select>
													<!-- <input type="hidden" path="profileID" name="profileID" id="profileID" value="1"/>
                                                            			<input type="hidden" path="logindetails" name="logindetails" id="logindetails" value=""/> -->
												</div>
											</div>
											<div class="col-md-12 col-xs-12">
<div class="btn-group" style="float:right;">
  <button type="submit" value="Search" class="btn login-btn" style="margin-right:15px;">Search</button>
  <button type="button" value="Download" class="btn login-btn" style="margin-right:15px;">Download</button>
</div>
	
		</div>							
												
										
									
										</fieldset>
									</div>

									<div class="row" style="height: 20px;"></div>
									<!-- captcha -->
									<!-- buttons -->
									<div class="col-md-4 hidden-xs"></div>
									<!-- 	<div class="col-md-4 col-xs-12">
											 <input type="submit"
												class="form-control login-btn" value="Search">
												<br />
											 <input type="button"
												class="form-control login-btn" value="Download">
														<br> <br> <br>
													
										</div> -->
									
									<div class="col-md-4 hidden-xs"></div>



								</div>
								<div class="col-md-2 hidden-xs"></div>

							</section>
							<section class="section-form-margin-top">
								<!-- fostac logo -->
								<!-- login form -->
								<div class="row" style="height: 20px;"></div>
								<div class="row">
									<div class="col-xs-12">
										<table id="datatablesfosrest"
											class="table table-bordered table-responsive">
											<!--    <table class="table table-hover table-bordered table-responsive"> -->
											<thead>
												<th width="80">S.No</th>
												<th width="120">Trainer Name</th>
												<th width="80">Course Name</th>
												<th width="120">Training LAB</th>
												<th width="120">Training Date</th>
												<th width="120">No. Of Seats</th>
												<th width="120">No .Of Enrollment</th>
											</thead>
											<tbody>
												<ct:choose>
													<ct:when test="${not empty listviewTrainingCalendar }">
														<ct:forEach var="listviewTrainingCalendar"
															items="${listviewTrainingCalendar}" varStatus="loop">
															<tr>
																<td>1</td>
																<td>${listviewTrainingCalendar.trainerName}</td>
																<td>${listviewTrainingCalendar.courseName}</td>
																<td>${listviewTrainingCalendar.trainingLab}</td>
																<td>${listviewTrainingCalendar.trainingDate}</td>
																<td>${listviewTrainingCalendar.noOfSeats}</td>
																<td>${listviewTrainingCalendar.noOfEnrollment}</td>

															</tr>
														</ct:forEach>
													</ct:when>
													<ct:otherwise>
														<tr>
															<td colspan="6"><label>No records available</label>
															</td>
														</tr>
													</ct:otherwise>
												</ct:choose>
											</tbody>
										</table>



									</div>
									<div class="col-md-2 hidden-xs"></div>
								</div>
							</section>
						</div>
						<!-- row -->
					</div>
				</div>
			</div>
		</div>
	</section>
</cf:form>

