<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
<script type="text/javascript"
	src="website/js/jquery-toaster/jquery.toaster.js"></script>

 -->
 <script src="website/js/commonController.js"></script>
<script>
	function OnStart() {
	/* 	alert("");

if('${search}'==0){
	alert("aa");
	var a='${listtrainingScheduleMaster}';
	alert(a.length);
}
	 */
	


		flatpickr("#trainingDate", {

		});
	}
	window.onload = OnStart;
</script>
<%-- <ct:url var="addAction" value="/activateAssessmentOfTraineelist.fssai"></ct:url> --%>
<ct:url var="addAction" value="/trainingScheduleMasterlist.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="TrainingScheduleForm" onsubmit="return validateFields();">

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
									class="orange-font"> Welcome ${userName }</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>
									Training Schedule Master <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Training Schedule Master</legend>
											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Type:</strong></li>
															<li id="trainingTypeErr" style="display: none;"
																class="style-li error-red">Please Select Training
																Type.</li>
															<li class="style-li error-red"><span
																id="name_status" class="clear-label"> </span> ${created }</li>
														</ul>
													</div>
													 <cf:select path="TrainingType" class="form-control" onchange="getTrainingPhase(this.value , 'trainingPhase')">
															<cf:option value="" label="Select Training Type" />
															<cf:options items="${TrainingTypeList}"
																itemValue="trainingTypeId" itemLabel="trainingTypeName" />
														</cf:select>
												</div>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training
																	Phase:</strong></li>
															<li id="trainingPhaseErr" style="display: none;"
																class="style-li error-red">Please Select Training
																Phase.</li>
															<li class="style-li error-red"><label
																class="error visibility" id="courseError">*
																	error</label></li>
														</ul>
													</div>
													 <cf:select path="trainingPhase" class="form-control">
															<cf:option value="" label="Select Training Type" />
															<cf:options items="${TrainingPhaseList}"
																itemValue="trainingPhaseId" itemLabel="trainingPhaseName" />
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
													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong>Designation:</strong></li>
																<li class="style-li error-red"><cf:errors
																		path="status" cssClass="error" /></li>
															</ul>
														</div>
														<cf:select path="Designation" class="form-control">
															<cf:option value="" label="Select Designation" />
															<cf:options items="${DesignationList}"
																itemValue="designationId" itemLabel="designationName" />
														</cf:select>

													</div>
													<div class="col-md-06 col-xs-12" style="margin-top: 39px;">
														<input type="submit" id="searchbtn" value="Search"
															style="float: right; padding: 10px 50px 10px 50px"
															class="btn login-btn" />
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
											<legend>Training Schedule Master</legend>
											<ct:if test="${!empty listtrainingScheduleMaster}">
												<table id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Designation</th>
															<th>Training Phase</th>
															<th>Training Type</th>
															<th>Chapter Name</th>
															<th>Module Names</th>
															<th>Day</th>
															<th>Start & End Time</th>
															
		</tr>
													</thead>
													<ct:forEach items="${listtrainingScheduleMaster}"
														var="listtrainingScheduleMaster" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<td>${listtrainingScheduleMaster.designation}</td>
															<td>${listtrainingScheduleMaster.trainingPhase}</td>
															<td>${listtrainingScheduleMaster.trainingType}</td>
															<td>${listtrainingScheduleMaster.chapter}</td>
															<td>${listtrainingScheduleMaster.moduleName}</td>
															
														<td> <cf:select path="TrainingType" class="form-control" >
																<ct:forEach var="i" begin="0" end="30" varStatus="loop">
	<cf:option value='${loop.count}' label='${loop.count}' />
	
	</ct:forEach>
															 
															
														</cf:select></td>
															<td>${listtrainingScheduleMaster.trainingStartDate}
																&nbsp &nbsp
																${listtrainingScheduleMaster.trainingEndDate}</td>

															
														</tr>
													</ct:forEach>
												</table>
												<div class="col-md-06 col-xs-12" style="margin-top: -72px;">
													<input type="button" id="savebtn" value="Save"
														style="float: right;" class="btn login-btn" />
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

<!-- <script>
	function validateFields() {

		if ($("#courseName").val() == '') {
			$("#courseNameErr").css("display", "block");
			return false;
		}
		if ($("#trainingDate").val() == 0) {
			$("#trainingDateErr").css("display", "block");
			return false;
		}
		if ($("#trainingLab").val() == '') {
			$("#courseNameErr").css("display", "block");
			return false;
		}
		if ($("#traineeName").val() == 0) {
			$("#trainingDateErr").css("display", "block");
			return false;
		}
	}
</script> -->

