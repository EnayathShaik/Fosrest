<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="website/js/commonController.js"></script>
<script>
	function OnStart() {
		
		flatpickr("#trainingStartDate", {

		});
		
		
		/* if(${profileId}==1){  
			 
			$("#datatablesfosrest th:last-child, #datatablesfosrest td:last-child").remove();
		}
  */ 
		/* if ('${profileId}' == 2) {
		$("#searchbtn").css("display" , 'none');
		$("#createbtn").css("display" , 'block'); 
	} */
	
	if('${search}'=='Y'){ 
		var trPhase=$("#trainingPhase").val();
		redirectScheduleCode2(trPhase,'scheduleCode');
	}
	if('${isEdit}'=='Y'){
			 
		$("#designation").val('${TrainingCalendarForm.designation}');
		$("#trainingType").val('${TrainingCalendarForm.trainingType}');

		var trPhase='${TrainingCalendarForm.trainingCalendarId}';
		redirectScheduleCode2(trPhase,'${TrainingCalendarForm.trainingCalendarId}');
		$("#trainingPhase").val('${TrainingCalendarForm.trainingPhase}');
		 $("#trainingPhase").trigger("change");
         window.setTimeout(function() { 
        	 //alert("timeptu");  
         	$("#scheduleCode").val('${TrainingCalendarForm.scheduleCode}');
         }, 1000); 
		$("#trainingInstitute").val('${TrainingCalendarForm.trainingInstitute}');
		$("#trainingStartDate").val('${TrainingCalendarForm.trainingStartDate}');
		//$("#endDate").val();
		$("#trainingCalendarId").val('${TrainingCalendarForm.trainingCalendarId}'); 
		
		
	 	$("#designation").prop("disabled", "disabled"); 
	 	 $("#trainingType").prop("disabled", "disabled"); 
	 	$("#trainingPhase").prop("disabled", "disabled");  
		$("#trainingInstitute").prop("disabled", "disabled"); 
		$("#scheduleCode").prop("disabled", "disabled");    
        $("#createbtn").val("Save");

		
		}
	
	if('${searchwhileedit}'=='Y'){  
		//alert("search while edit");
		
		  window.setTimeout(function() { 
	        	 
	        	 $("#scheduleCode").val($("#scheduleCode2").val());
	        	 }, 1000);
		 
		  $("#designation").prop("disabled", "disabled"); 
	 	 $("#trainingType").prop("disabled", "disabled"); 
	 	$("#trainingPhase").prop("disabled", "disabled");  
		$("#trainingInstitute").prop("disabled", "disabled"); 
		$("#scheduleCode").prop("disabled", "disabled"); 
        $("#createbtn").val("Save");

		 
	}
	}
	window.onload = OnStart;
</script>
<ct:url var="addAction" value="/trainingcalendaradd.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="TrainingCalendarForm" onsubmit="">

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
									class="orange-font">Welcome ${userName }</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

<%if ((Integer)session.getAttribute("profileId")==2) {%>
							<div class="col-xs-12">
								<fieldset>
									<legend>
										<h1>Training Calendar</h1>
										<cf:hidden path="trainingCalendarId" />
									</legend>
									<div class="row">
										
										<div class="col-xs-12">
											<!-- left side -->
											
											<div class="col-xs-6">
										
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Designation:</strong></li>
															<li id="designationErr" style="display: none;"
																class="style-li error-red">Select Designation.</li>
														</ul>
													</div>
													<cf:select path="designation" class="form-control">
														<cf:option value="" label="Select Designation" />
														<cf:options items="${DesignationList}"
															itemValue="designationId" itemLabel="designationName" />
													</cf:select>

												</div>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Type:</strong></li>
															<li id="trainingTypeErr" style="display: none;"
																class="style-li error-red">Select Training Type.</li>
															<li class="style-li error-red"><span
																id="name_status" class="clear-label"> </span> ${created }</li>
														</ul>
													</div>
													<cf:select path="trainingType" class="form-control"
														onchange="getTrainingPhase(this.value , 'trainingPhase');redirectScheduleCode1(this.value,'scheduleCode')">
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
																class="style-li error-red">Select Training Phase.</li>
															<li class="style-li error-red"><label
																class="error visibility" id="courseError">*
																	error</label></li>
														</ul>
													</div>
													<cf:select path="trainingPhase" class="form-control"
														onchange="redirectScheduleCode2(this.value,'scheduleCode')">
														<cf:option value="0" label="Select Training Phase" />
														<cf:options items="${TrainingPhaseList}"
															itemValue="trainingPhaseId" itemLabel="trainingPhaseName" />
													</cf:select>
												</div>



											</div>
											<!-- left side ends -->

											<!-- right side -->
											<div class="col-xs-6">


												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Schedule Code:</strong></li>
															<li id="scheduleCodeErr" style="display: none;"
																class="style-li error-red">Select Schedule Code.</li>
															<li class="style-li error-red"><label
																class="error visibility" id="courseError">*
																	error</label></li>
														</ul>
													</div>
													<cf:select path="scheduleCode" class="form-control">
														<cf:option value="0" label="Select Schedeule Code" />
													<ct:forEach items="${listtrainingScheduleMaster}" var="ltsm">
													<cf:option value="${ltsm[3]}" label="${ltsm[3]}" />
													</ct:forEach>  
													</cf:select>
												</div>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training
																	Institute:</strong></li>
															<li id="trainingInstituteErr" style="display: none;"
																class="style-li error-red">Select Training
																Institute.</li>
															<li class="style-li error-red"></li>
														</ul>
													</div>


													<div class="form-group">
														<cf:select path="trainingInstitute" class="form-control">
															<cf:option value="" label="Select Training Institute" />
															<cf:options items="${listTrainingInstitute}"
																itemValue="id" itemLabel="trainingCenterName" />
														</cf:select>
														<%-- <cf:select path="trainingInstitude" class="form-control"
													onchange="getTrainer(this.value , 'trainer_id')">
													<cf:option value="0" label="Select Training Institute" />
													<cf:options items="${listTrainingInstitude}" itemValue="id"
														itemLabel="trainingCenterName" />
												</cf:select> --%>
													</div>
												</div>
												<%-- 	<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Trainer:</strong></li>
															<li id="trainingInstitudeErr" style="display: none;"
																class="style-li error-red">  Select Training
																Institute.</li>
															<li class="style-li error-red"></li>
														</ul>
													</div>


													<div class="form-group">
														<cf:select path="trainerName" class="form-control">
															<cf:option value="" label="Select training phase" />
															<cf:options items="${listPersonalInfoTrainer}"
																itemValue="firstName" itemLabel="firstName" />
														</cf:select>
															<cf:select path="trainingInstitude" class="form-control"
													onchange="getTrainer(this.value , 'trainer_id')">
													<cf:option value="0" label="Select Training Institute" />
													<cf:options items="${listTrainingInstitude}" itemValue="id"
														itemLabel="trainingCenterName" />
												</cf:select>
													</div>
												</div> --%>


												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Start
																	Date:</strong></li>
																	<li class="style-li error-red"><span
																id="error_time" class="clear-label"> </span> ${errorTime }</li>

															<li id="trainingStartDateErr" style="display: none;"
																class="style-li error-red">Select Training Start
																Date.</li>
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
													<!-- <input type="submit" id="createbtn"
														style="display: none; float: right; margin-right: 122px;"
														value="Create" class="btn login-btn" /> -->
													<input type="submit" id="searchbtn" value="Search Date Availability" 
														class="btn login-btn"
														formaction="trainingcalendarsearch.fssai"
														onclick="return validateFields();" />
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
							<!-- search Results 11111 -->

							<div class="col-xs-12 " id="testt">

								<!-- table -->
								<div class="row">
									<div class="col-xs-12"> 
										<fieldset>
											<legend>Search Result and Create Calendar </legend>
											<ct:if test="${!empty listCalendarSearch}">
												<table border="1" 
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Designation</th>
															<th>Training Type</th>
															<th>Schedule Code</th>
															<!-- <th>Training Duration</th> -->
															<th>Training Start Date</th>
															<th>Training End Date</th>
															<th>Subject</th>
															<th>	<ul><li id="trainerErr" style="display: none;"
																class="style-li error-red">Select TRAINER for each subject.</li></ul>Trainer</th>



														</tr>
													</thead>

													<ct:forEach items="${listCalendarSearch}"
														var="listCalendarSearch" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<td>${listCalendarSearch[0]}</td>
															<td>${listCalendarSearch[1]}</td>
															<td>${listCalendarSearch[6]}</td>
															<%-- <td>${listCalendarSearch[7]} hrs</td> --%>
															<cf:hidden path="designation2"
																value="${listCalendarSearch[3]}" />
															<cf:hidden path="trainingType2"
																value="${listCalendarSearch[4]}" />
															<cf:hidden path="trainingPhase2"
																value="${listCalendarSearch[5]}" />
															<cf:hidden path="scheduleCode2"
																value="${listCalendarSearch[6]}" />


															<%-- <cf:hidden path='totalDuration'
																value="${listCalendarSearch[7]}" /> --%>
																<cf:hidden path='totalDays'
																value="${listCalendarSearch[8]}" />

															<td>${startDate}</td>
															<td>${endDate}</td>


															<td><ct:forEach items="${listSchCodeSubjects}"
																	var="subjects" varStatus="loop2">
																	<input type="hidden" name="subject"
																		value="${subjects[1]}" />
													${subjects[0]}<br />
																	<br />
																	<br />
																</ct:forEach></td>

															<td><div class="form-group">
																	<ct:forEach items="${listSchCodeSubjects}"
																		var="subjects" varStatus="loop2">
																		<select id="trainer_${loop2.count}" name='trainer'
																			class="form-control">
																			<option value="" label="Select Trainer" />
																			<ct:forEach items="${listPersonalInfoTrainer}"
																				var="listPersonalInfoTrainer" varStatus="loop">

																				<option 
																					value="${listPersonalInfoTrainer.trainerId.id}">${listPersonalInfoTrainer.firstName}</option>
																			</ct:forEach>
																		</select>
																	</ct:forEach>
																</div></td>



														</tr>
													</ct:forEach>
												</table><!--     margin-top: 96px; -->
												<div    style="margin-left: 868px; "><input type="submit" id="createbtn" value="create"
													class="btn login-btn" onclick="return validate2();" />
													</div>
												<cf:hidden path="trainingInstitute2" value="${institute}" />
												<cf:hidden path="trainingStartDate2" value="${startDate}" />
												<cf:hidden path="trainingEndDate2" value="${endDate}" />

											</ct:if>
										</fieldset>
									</div>
								</div>


							</div>
							<%} %>
							<!-- search Results 22222 -->
							<div class="col-xs-12 " id="testt">

								<!-- table -->
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Training Calendar List</legend>
											<ct:if test="${!empty listCalendar}">

												<table border="1" id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>BatchCode</th>
															<th>Designation</th>
															<th>Training Type</th>
															<th>Schedule Code</th>
															<th>Training Institute</th>
															<th>Total Days</th>

															<th>Training Start Date</th>
															<th>Training End Date</th>
														<%if ((Integer)session.getAttribute("profileId")==2) {%>	<th>Edit</th>   <%} %>


 

														</tr>
													</thead>

													<ct:forEach items="${listCalendar}" var="listCalendar"
														varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<td>${listCalendar[0]}</td>
															<td>${listCalendar[1]}</td>
															<td>${listCalendar[2]}</td>
															<td>${listCalendar[3]}</td>
															<td>${listCalendar[4]}</td>
															<td>${listCalendar[5]}</td>
															<td>${listCalendar[6]}</td>
															<td>${listCalendar[7]}</td>
														<%if ((Integer)session.getAttribute("profileId")==2) {%>	<td><input type="submit" id="searchbtn" value="Edit" 
														class="btn login-btn"
														formaction="edittrainingcalendar.fssai?id=${listCalendar[8]}"
														 /></td>	<%} %>
														 														<%-- <td><a href="remove/trainingcalendar/${listCalendar[8]}.fssai">Delete</a></td> --%>

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

<script>

	</script>
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

<script>
	function validateFields() {
		$("#designationErr").css("display", "none");

		$("#trainingTypeErr").css("display", "none");
		$("#trainingPhaseErr").css("display", "none");
		$("#scheduleCodeErr").css("display", "none");

		$("#trainingInstituteErr").css("display", "none");
		$("#trainingStartDateErr").css("display", "none");
		$("#trainingEndDateErr").css("display", "none");
		$("#trainerErr").css("display", "none");

		if ($("#designation").val() == '') {
			$("#designationErr").css("display", "block");
			return false;
		}
		if ($("#trainingType").val() == 0) {
			$("#trainingTypeErr").css("display", "block");
			return false;
		}
		if ($("#trainingType").val() == 3 && $("#trainingPhase").val() == 0) {// 3 for induction
			$("#trainingPhaseErr").css("display", "block");
			return false;
		}
		if ($("#scheduleCode").val() == 0) {
			$("#scheduleCodeErr").css("display", "block");
			return false;
		}
		if ($("#trainingInstitute").val() == 0) {
			$("#trainingInstituteErr").css("display", "block");
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

	}

	function redirectScheduleCode1(trType, id) {
		//alert(trType);

		if (trType != 3) {// 3 for induction
			getScheduleCode(document.getElementById("designation").value,
					trType, '0', id);

		}

	}

	function redirectScheduleCode2(trPhase, id) {
		//	alert(trPhase + id);

		getScheduleCode(document.getElementById("designation").value, document
				.getElementById("trainingType").value, trPhase, id);

	}

	function validate2() {

		<ct:forEach items="${listSchCodeSubjects}" 
			var="subjects" varStatus="loop2"> // just for iteration 

		if ($("#trainer_" + '${loop2.count}').val() == '') {
			alert("Select TRAINER");
			$("#trainerErr").css("display", "block");
			$("#trainer_" + '${loop2.count}').focus();
			
			return false;
		}
		</ct:forEach>

	}

	/* 	function calDate(val,id){
	 alert(val);
	 var d=val.split('-')
	 alert(d);
	 var temp=d[0];
	 d[0]=d[1];
	 d[1]=temp;
	 alert(d);
	
	 d = new Date(d).getTime() ;
	 alert(d);
	 var s = new Date(parseInt(d)); 
	 alert(s);

	 var endDate="";
	 endDate=s.getDate()+"-"+(s.getMonth()+1)+"-"+s.getFullYear()+" "+s.getHours()+":"+s.getMinutes();
	 alert(endDate);
	 document.getElementById(id).value=endDate;
	
	 }  */
</script>