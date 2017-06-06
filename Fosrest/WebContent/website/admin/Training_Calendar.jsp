<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="website/js/commonController.js"></script>
<script>
	/*   function OnStart() {
	     
	  	flatpickr("#trainingStartDate" , {
	  		enableTime: true
	  	});	
	  	
	   	flatpickr("#trainingEndDate" , {
	   		enableTime: true
	  	});	
	   	
	   	if('${profileId}' == 2){
	   		$("#createbtn").css("display" , 'none');
	   	}
	  }
	  window.onload = OnStart; */
</script>
<ct:url var="addAction" value="/trainingcalendarsearch.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="TrainingScheduleForm" onsubmit="">

	<section>
		<%@include file="../roles/top-menu.jsp"%>
	</section>
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
									class="orange-font">Welcome Admin</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<fieldset><legend><h1>Training Calendar</h1></legend>
								<div class="row">
									<div class="col-xs-12">
										<cf:input type="hidden" path="trainingScheduleId" />
										<!-- left side -->
										<div class="col-xs-6">

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Designation</strong></li>
														<li id="userTypeErr" style="display: none;"
															class="style-li error-red">Please Select
															Designation.</li>
														<li class="style-li error-red"><span id="name_status">
														</span><span id="err"> </span> <label id=userTypeError
															class="error visibility">* Select UserType </label> <cf:errors
																path="userType" cssClass="error" />${created }</li>
													</ul>
												</div>
												<cf:select path="userType" class="form-control">
													<cf:option value="" label="Select Designation" />
													<cf:options items="${userType}" />
												</cf:select>
											</div>


											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training Type:</strong></li>
														<li id="trainingTypeErr" style="display: none;"
															class="style-li error-red">Please Select Training
															Type.</li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> ${created }</li>
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
														<li class="style-li"><strong>Training Phase:</strong></li>
														<li id="trainingPhaseErr" style="display: none;"
															class="style-li error-red">Please Select Training
															Phase.</li>
														<li class="style-li error-red"><label
															class="error visibility" id="courseError">* error</label></li>
													</ul>
												</div>
												<cf:select path="trainingPhase" class="form-control">
													<cf:option value="" label="Select training phase" />
													<cf:options items="${trainingPhase}" />
												</cf:select>
											</div>

										</div>
										<!-- left side ends -->

										<!-- right side -->
										<div class="col-xs-6">
											
<div class="form-group">
											<div>
												<ul class="lab-no">
													<li class="style-li"><strong>Training
															Institute:</strong></li>
													<li id="trainingInstitudeErr" style="display: none;"
														class="style-li error-red">Please Select Training
														Institute.</li>
													<li class="style-li error-red"></li>
												</ul>
											</div>


											<div class="form-group">

												<cf:select path="trainingInstitude" class="form-control"
													onchange="getTrainer(this.value , 'trainer_id')">
													<cf:option value="0" label="Select Training Institute" />
													<cf:options items="${listTrainingInstitude}" itemValue="id"
														itemLabel="trainingCenterName" />
												</cf:select>
											</div>
</div>
											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training Start
																Date:</strong></li>

														<li id="trainingStartDateErr" style="display: none;"
															class="style-li error-red">Please Select Training
															Start Date.</li>
														<li class="style-li error-red"><label
															class="error visibility" id="courseError">*</label></li>
													</ul>
												</div>
												<cf:input class="form-control" path="trainingStartDate"
													type="text" placeholder="Training Start Date" />
											</div>

										
										</div>
										<!-- rigth side ends -->

										<!-- button -->
										<div class="row">


											<div class="col-md-12 col-xs-12 text-center">
												<input type="submit" id="updatebtn"
													style="display: none; float: right; margin-right: 122px;"
													value="Update" class="btn login-btn" /> <input
													type="submit" id="createbtn" value="Search"
													class="btn login-btn" />
												<!--  <input type="submit"
													class="btn login-btn show-details-vacancy collapsed"
													data-toggle="collapse" style="margin-left: 381px;"
													data-target="#show-result" aria-expanded="false"
													value="Search" /> -->

											</div>
										</div>

									</div>


								</div>
								</fieldset>
							</div>


							<!-- search Results -->
											<div class="col-xs-12 " id="testt">

								<!-- table -->
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Search Result </legend>
											<ct:if test="${!empty listCalendar}">
												<table  border="1" id="datatablesfosrest" class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Designation</th>
															<th>Training Type</th>
															<th>Training Phase</th>
															<th>Training Institute</th>
															<th>training Topic</th>
															<th>Training Date</th>
															<th>Training Duration</th>
													
														</tr>
													</thead>

												 	<ct:forEach items="${listCalendar}"
														var="listCalendar" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<td>${listCalendar[0]}</td>
															<td>${listCalendar[1]}</td>
															 <td>${listCalendar[2]}</td>
															  <td>${listCalendar[3]}</td>
															   <td>${listCalendar[4]}</td>
															    <td>${listCalendar[5]}</td>
															    <td>${listCalendar[6]}</td>
															    
															
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


</cf:form>
<!-- 
<script>
	function editTrainingSchedule(id) {

		var name1 = JSON.stringify({
			courseName : 0
		})
		$.ajax({
			type : 'post',
			url : 'TrainingSchedule/edit/' + id + '.fssai',
			contentType : "application/json",
			data : name1,
			success : function(response) {
				var mainData1 = jQuery.parseJSON(response);
				$("#unitId").val(mainData1.unitId);
				$("#moduleId").val(mainData1.moduleId);
				$("#trainingScheduleId").val(mainData1.trainingScheduleId);
				$("#userType").val(mainData1.userType);
				$("#trainingType").val(mainData1.trainingType);
				$("#trainingPhase").val(mainData1.trainingPhase);
				$("#trainingInstitudeStatus").val(
						mainData1.trainingInstitudeStatus);
				$("#trainingStartDate").val(mainData1.trainingStartDate);
				$("#trainingEndDate").val(mainData1.trainingEndDate);
				$("#trainingPartner").val(mainData1.trainingPartner);
				$("#trainingPartner").trigger("change");
				window.setTimeout(function() {
					$("#trainingInstitude").val(mainData1.trainingInstitude);
					$("#trainingInstitude").trigger("change");
					window.setTimeout(function() {
						$("#trainer_id").val(mainData1.trainer_id);
					}, 1000);
				}, 1000);

				$("#state").val(mainData1.state);
				$("#updatebtn").css("display", "block");

				$("#createbtn").css("display", "none");
			}
		});

	}

	function validateFields() {
		$("#unitIdErr").css("display", "none");
		$("#moduleIdErr").css("display", "none");
		$("#userTypeErr").css("display", "none");
		$("#statusErr").css("display", "none");
		$("#trainingPartnerErr").css("display", "none");
		$("#trainingTypeErr").css("display", "none");
		$("#trainingInstitudeErr").css("display", "none");
		$("#trainingPhaseErr").css("display", "none");
		$("#trainingInstitudeStatusErr").css("display", "none");
		$("#trainingStartDateErr").css("display", "none");
		$("#trainingEndDateErr").css("display", "none");
		$("#trainingTrainerErr").css("display", "none");
		$("#stateErr").css("display", "none");

		if ($("#unitId").val() == 0) {

			$("#unitIdErr").css("display", "block");
			return false;
		}
		if ($("#moduleId").val() == 0) {

			$("#moduleIdErr").css("display", "block");
			return false;
		}
		if ($("#userType").val() == '') {
			$("#userTypeErr").css("display", "block");
			return false;
		}
		if ($("#trainingPartner").val() == 0) {

			$("#trainingPartnerErr").css("display", "block");
			return false;
		}
		if ($("#trainingType").val() == 0) {

			$("#trainingTypeErr").css("display", "block");
			return false;
		}
		if ($("#trainingInstitude").val() == 0) {

			$("#trainingInstitudeErr").css("display", "block");
			return false;
		}
		if ($("#trainingPhase").val() == 0) {

			$("#trainingPhaseErr").css("display", "block");
			return false;
		}
		if ($("#trainer_id").val() == 0) {

			$("#trainingTrainerErr").css("display", "block");
			return false;
		}
		if ($("#trainingInstitudeStatus").val() == 0) {

			$("#trainingInstitudeStatusErr").css("display", "block");
			return false;
		}
		if ($("#trainingStartDate").val() == 0) {

			$("#trainingStartDateErr").css("display", "block");
			return false;
		}
		if ($("#trainingEndDate").val() == 0) {

			$("#trainingEndDateErr").css("display", "block");
			return false;
		}
		if ($("#state").val() == 0) {

			$("#stateErr").css("display", "block");
			return false;
		}

	}

	function getTrainer(val, idName) {
		var name1 = JSON.stringify({
			courseType : 0,
			courseName : 0
		})
		$.ajax({
			type : 'post',
			url : 'loadTrainer.fssai?data=' + val,
			contentType : "application/json",
			data : name1,
			success : function(response) {
				var mainData1 = jQuery.parseJSON(response);
				$('#' + idName + ' option').remove();
				$('#' + idName).append(
						'<option value="0" label="Select Trainer" />');
				$.each(mainData1, function(i, obj) {
					$('#' + idName).append(
							'<option value='+obj[0]+' >' + obj[0] + '-'
									+ obj[20] + '</option>');
				});
			}
		});
	}
</script> -->