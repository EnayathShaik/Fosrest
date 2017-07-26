<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="website/js/commonController.js"></script>
<script>
	function OnStart() {
		
		flatpickr("#trainingStartDate", {

		});
		
		flatpickr("#trainingEndDate2", {

		});
		
		<ct:forEach items="${listSchCodeSubjects}"
			var="subjects" varStatus="loop2">
		flatpickr("#subjectDates_"+'${loop2.count}', {

		});
		</ct:forEach>
		/* if(${profileId}==1){  
			 
			$("#datatablesfosrest th:last-child, #datatablesfosrest td:last-child").remove();
		}
  */ 
		/* if ('${profileId}' == 2) {
		$("#searchbtn").css("display" , 'none');
		$("#createbtn").css("display" , 'block'); 
	} */
	
	
	if('${profileId}'==2){ 
 		$("#stateId").val('${stateId}');
	 	$("#stateId").prop("disabled", "disabled"); 
}
	
	
	if('${search}'=='Y'){ 
		var trPhase=$("#trainingPhase").val();
		redirectScheduleCode2(trPhase,'scheduleCode');
	}
	if('${isEdit}'=='Y'){

		alert("Data loaded for edit");
		$("#designation").val('${TrainingCalendarForm.designation}');
		$("#trainingType").val('${TrainingCalendarForm.trainingType}');

		var trPhase='${TrainingCalendarForm.trainingCalendarId}';
		redirectScheduleCode2(trPhase,'${TrainingCalendarForm.trainingCalendarId}');
		$("#trainingPhase").val('${TrainingCalendarForm.trainingPhase}');
		 $("#trainingPhase").trigger("change");
         window.setTimeout(function() { 
        	  
         	$("#scheduleCode").val('${TrainingCalendarForm.scheduleCode}');
         }, 1000); 
 		$("#stateId").val('${TrainingCalendarForm.stateId}');

		$("#trainingInstitute").val('${TrainingCalendarForm.trainingInstitute}');
		$("#trainingStartDate").val('${TrainingCalendarForm.trainingStartDate}');
		$("#trainingEndDate2").val('${TrainingCalendarForm.trainingEndDate}'); 
		
		$("#trainingCalendarId").val('${TrainingCalendarForm.trainingCalendarId}'); 
		
		
	 	$("#designation").prop("disabled", "disabled"); 
	 	 $("#trainingType").prop("disabled", "disabled"); 
	 	$("#trainingPhase").prop("disabled", "disabled");  
	 	$("#stateId").prop("disabled", "disabled"); 
		$("#trainingInstitute").prop("disabled", "disabled");
		$("#scheduleCode").prop("disabled", "disabled");    
        $("#createbtn").val("Save");

        <ct:forEach items="${listPreSelectedTrainers}" var="lpt" varStatus="loop" > 
        $("#trainer_"+'${loop.count}').val('${lpt}');   
		</ct:forEach> 
        
        <ct:forEach items="${listEnteredSubjectDates}" var="lesd" varStatus="loop" > 
        $("#subjectDates_"+'${loop.count}').val('${lesd[0]}');  
		</ct:forEach>
 
	}
	if('${searchwhileedit}'=='Y'){
		
		  window.setTimeout(function() { 
	        	 
	        	 $("#scheduleCode").val($("#scheduleCode2").val());
	        	 }, 1000);
		 
		  $("#designation").prop("disabled", "disabled"); 
	 	 $("#trainingType").prop("disabled", "disabled"); 
	 	$("#trainingPhase").prop("disabled", "disabled");
		$("#stateId").val('${stateId}');//jo
	 	$("#stateId").prop("disabled", "disabled"); 

		$("#trainingInstitute").prop("disabled", "disabled"); 
		$("#scheduleCode").prop("disabled", "disabled");  
        $("#createbtn").val("Save");

        <ct:forEach items="${listPreSelectedTrainers}" var="lpt" varStatus="loop" > 
        $("#trainer_"+'${loop.count}').val('${lpt}');   
		</ct:forEach> 
		
        <ct:forEach items="${listEnteredSubjectDates}" var="lesd" varStatus="loop" > 
        $("#subjectDates_"+'${loop.count}').val('${lesd[0]}');  
		</ct:forEach>
        
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
 											<%-- 	  <div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>email:</strong></li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> ${created }</li>
													</ul>
												</div>
												 <cf:select path="email" class="form-control" id="batchCode">
												<ct:forEach items="${listPersonalInfoTrainer}" var="listPersonalInfoTrainer">
													<cf:option value="${listPersonalInfoTrainer }" label="${listPersonalInfoTrainer }" />
												</ct:forEach>
												</cf:select> 
											</div> --%>


											</div>
											<!-- left side ends -->

											<!-- right side -->
											<div class="col-xs-6">

												<div class="col-xs-9" style="padding-left: 0px;">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Select Schedule:</strong></li>
															<li id="scheduleCodeErr" style="display: none;"
																class="style-li error-red">Select Schedule.</li>
															<li class="style-li error-red"><label
																class="error visibility" id="courseError">*
																	error</label></li>
														</ul>
													</div>
													<cf:select path="scheduleCode" class="form-control">
														<cf:option value="0" label="Select Schedeule" />
													<ct:forEach items="${listtrainingScheduleMaster}" var="ltsm">
													<cf:option value="${ltsm[3]}" label="${ltsm[3]}" />
													</ct:forEach>  
													</cf:select>
												</div>
												</div>
												<div class="col-md-3 col-xs-12">	
												<input type="button" onclick="showSchedules();return false;" value="--> Show subject" class="btn login-btn" style="margin-top: 26px; margin-left: -18px; padding: 6px 6px;">
												</div>
												<div class="form-group">
													<div >
														<ul class="lab-no">
															<li class="style-li"><strong>Select State:&nbsp&nbsp&nbsp&nbsp</strong></li>
															<li id="statesErr" style="display: none;"
																class="style-li error-red">Select state.</li>
															<li class="style-li error-red"></li>
														</ul>
														<cf:select path="stateId" class="form-control" onchange="getTrainingInstitude(this.value,'trainingInstitute');">
															<cf:option value="0" label="Select state" />
															<cf:options items="${listStateMaster}"
																itemValue="stateId" itemLabel="stateName" />
														</cf:select>
														<%-- <cf:select path="trainingInstitude" class="form-control"
													onchange="getTrainer(this.value , 'trainer_id')">
													<cf:option value="0" label="Select Training Institute" />
													<cf:options items="${listTrainingInstitude}" itemValue="id"
														itemLabel="trainingCenterName" />
												</cf:select> --%>
													</div>


												</div>
												<div class="form-group">
													<div id="instituteField">
														<ul class="lab-no">
															<li class="style-li"><strong>Training
																	Institute:</strong></li>
															<li id="trainingInstituteErr" style="display: none;"
																class="style-li error-red">Select Training
																Institute.</li>
															<li class="style-li error-red"></li>
														</ul>
														<cf:select path="trainingInstitute" class="form-control">
															<cf:option value="0" label="Select Training Institute" />
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
													<cf:hidden path="stateId2" />
														
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

							<div class="col-xs-12 " >

								<!-- table -->
								<div class="row">
									<div class="col-xs-12"> 
										<fieldset>
											<legend>Search Result and Create Calendar </legend>
											<ct:if test="${!empty listCalendarSearch}">
												<table border="1"  style='text-align:center;'
													class="table table-bordered table-responsive" id="testTable">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<!-- <th>Designation</th>
															<th>Training Type</th> -->
															<!-- <th>Schedule Code</th> -->
															<!-- <th>Training Duration</th> -->
															<th>Training Start Date</th>
															<th><ul><li id="trainingEndDateErr" style="display: none;"
																class="style-li error-red">Select End Date.</li></ul>Training End Date</th>
															<th>Day</th>
															<th><ul><li id="onDateErr" style="display: none;"
																class="style-li error-red">Fill all the Dates.</li></ul>On-Date</th>
															<th>Subject</th>
															<th>	<ul><li id="trainerErr" style="display: none;"
																class="style-li error-red">Select TRAINER for each subject.</li></ul>Trainer</th>
															<th>Checkbox</th>


														</tr>
													</thead>

													<ct:forEach items="${listCalendarSearch}"
														var="listCalendarSearch" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<%-- <td>${listCalendarSearch[0]}</td>
															<td>${listCalendarSearch[1]}</td> --%>
															<%-- <td>${listCalendarSearch[6]}</td> --%>
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
															<%-- <td>${endDate}</td> --%>
															<td ><cf:input path="trainingEndDate2"  class="form-control"  /></td>
																
																<td    style=" width: 75px; padding-top: 14px;"><ct:forEach items="${listSchCodeSubjects}"
																	var="subjects" varStatus="loop2">
																	Day ${subjects[2]}
															<input id="days" type="hidden" name="days"  class="form-Control" value="${subjects[2]}"  />
																	
													<br /><br /><br />
																	 
																</ct:forEach></td>
																
																<ct:set var="subindex" value="1" />
																<td><ct:forEach items="${listSchCodeSubjects}"
																	var="subjects" varStatus="loop2">
																	<ct:choose>
																	<ct:when test="${subjects[2]!=i}">
																	<div style="margin-bottom: 8px;"><input  id="subjectDates_${subindex}" type="text" name="subjectDates"  class="form-Control"  /></div>
																	<ct:set var="subindex" value="${subindex+1}" />
																	</ct:when>
																	<ct:otherwise>
																	<p style="padding-top: 6px;
  																			  padding-bottom: 6px;">Same as above </p>
																	</ct:otherwise>
																	</ct:choose>
																	<ct:set var="i" value="${subjects[2]}" />
																	
													<br />
																	 
																</ct:forEach></td>

															<td style="    padding-top: 14px;"> <ct:forEach items="${listSchCodeSubjects}"
																	var="subjects" varStatus="loop2">
																	<input type="hidden" name="subject"  id="subj_${loop2.count}"
																		value="${subjects[1]}"/>
													${subjects[0]}<br />
																	<br />
																	<br />
																</ct:forEach></td>

															<td><div class="form-group">
																	<ct:forEach items="${listSchCodeSubjects}"
																		var="subjects" varStatus="loop2">
																		<select style="margin-top:2px; margin-bottom: 30px;" id="trainer_${loop2.count}" name='trainer'
																			class="form-control">
																			<option value="" label="Select Trainer" />
																			<%--  <ct:forEach items="${listPersonalInfoTrainer}"
																				var="listPersonalInfoTrainer" varStatus="loop">

																				<option 
																					value="${listPersonalInfoTrainer.trainerId.id}">${listPersonalInfoTrainer.firstName}</option>
																			</ct:forEach> --%>
																			<ct:forEach items="${listPersonalInfoTrainer}"
																				var="listPersonalInfoTrainer" varStatus="loop">

																				<option 
																					value="${listPersonalInfoTrainer[0]}">${listPersonalInfoTrainer[1]}</option>
																			</ct:forEach>
																			
																		</select>
																		
																	</ct:forEach>
																</div></td>
																<td>
																<ct:forEach items="${listSchCodeSubjects}" 	var="subjects" varStatus="loop2">
																<input type="checkbox" onclick="trainerMailData('${loop2.count}');" >
											<br><br><br>					
																<ct:forEach items="${listPersonalInfoTrainer}"
																				var="listPersonalInfoTrainer" varStatus="loop1">
																				
															
                                                                  <input type="hidden" id="mail_${loop1.count}" value="${listPersonalInfoTrainer[0]}">
														<input type="hidden" id="emailId_${listPersonalInfoTrainer[0]}"
														value="${listPersonalInfoTrainer[2]}"/>
																			</ct:forEach>
																	</ct:forEach>		
														
														</td>
														</tr>
													</ct:forEach>
												</table><!--     margin-top: 96px; -->
												<div    style="margin-left: 868px; "><input type="submit" id="createbtn" value="create"
													class="btn login-btn" onclick="allTrainerMailData(); return validate2();" />
													</div>
													
												<cf:hidden path="trainingInstitute2" value="${institute}" />
												<cf:hidden path="trainingStartDate2" value="${startDate}" />
												<%-- <cf:hidden path="trainingEndDate2" value="${endDate}" /> --%>

											</ct:if>
										</fieldset>
									</div>
								</div>


							</div>
						
							
							<div class="col-xs-12 " >

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
															<!-- <th>BatchCode</th> -->
															<!-- <th>Designation</th>
															<th>Training Type</th> -->
															<!-- <th>Schedule Code</th> -->
															<th>Training Institute</th>
															<th>Total Days</th>

															<th>Training Start Date</th>
															<th>Training End Date</th>
													<th>Edit</th> 
															<th>View</th> 
														</tr>
													</thead>

													<ct:forEach items="${listCalendar}" var="listCalendar"
														varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<%-- <td>${listCalendar[0]}</td> --%>
															<%-- <td>${listCalendar[1]}</td>
															<td>${listCalendar[2]}</td> --%>
															<%-- <td>${listCalendar[3]}</td> --%>
															<td>${listCalendar[4]}</td>
															<td>${listCalendar[5]}</td>
															<td>${listCalendar[6]}</td>
															<td>${listCalendar[7]}</td>
														<td><input type="submit" id="searchbtn" value="Edit" 
														class="btn login-btn"
														formaction="edittrainingcalendar.fssai?id=${listCalendar[8]}"
														 /></td>
														 														<%-- <td><a href="remove/trainingcalendar/${listCalendar[8]}.fssai">Delete</a></td> --%>
															<td><input type="button" id="viewbtn" data-toggle="modal" data-target="#myModal2"  value="View" 
														class="btn login-btn"
														onclick="viewtrainingcalendar(${listCalendar[8]}); return false;"
														 /></td>
														</tr>
													</ct:forEach> 
												</table>
											</ct:if>
										</fieldset>
									</div>
								</div>
							</div>
							
								<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" style="padding-right: 500;">
								<div class="modal-dialog" role="document"> 
									<div class="modal-content" style="  width: 947px;">
										<div class="modal-header"> 
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Training calendar</h4>
										</div>
									<div class="modal-body" >

										<div class="col-xs-12 " >
 
								<!-- table -->
								<div class="row">
									<div class="col-xs-12 " id="printDiv">
										<fieldset>
										<legend>Training Calendar</legend>
									<table class="table table-bordered table-responsive" id="calendarTable" style="width:882px; text-align: center;">
												  <thead>
                                                <th> </th>
                                                <th> </th>
                                                <th> </th>
                                                <th> </th>
                                                <th> </th>
                                                <th> </th>
                                                <th> </th> 
                                                
                                                </thead>
										<tbody></tbody>
												</table>
												<br />
												<table  class="table table-bordered table-responsive"  id="calendarTable2" style=" margin-left:91px; width:700px; text-align: center;">
												  <thead>
												<th> </th>
                                                <th> </th>
                                                <th> </th>
                                                <th> </th>
                                              
                                                </thead>
										<tbody></tbody>
												</table>
										</fieldset>
									</div>
								</div>
							</div>	
										</div> 

										<div class="modal-footer" style="border:0px;"> 
											<div>
											<input type="button"
													class="btn login-btn show-details-vacancy collapsed"
													data-toggle="collapse" data-target="#show-result"
													aria-expanded="false" onclick="printDiv();" data-dismiss="modal" value="Print"  />
													
												<input type="button"
													class="btn login-btn show-details-vacancy collapsed"
													data-toggle="collapse" data-target="#show-result"
													aria-expanded="false" onclick="return false;" data-dismiss="modal" value="Close"  />

											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>

<cf:hidden path="data" value="" />
</cf:form>

<script>

/* function getTrainingPhase2(val , idName) {
	$('#'+idName+' option').remove();
 	var name=JSON.stringify({
		courseType:0,
		courseName:0
  })
	$.ajax({
		type : 'post',
		url : 'loadTrainingPhase.fssai?data='+ val,
		contentType : "application/json",
	    data:name,
		success : function(response) {
			var mainData1 = jQuery.parseJSON(response);
			
			$('#'+idName+' option').remove(); 
			$('#'+idName).append(
					'<option value="0" label="Select Training Phase" >Select Training Phase</option>');
			$.each(mainData1, function(i, obj) {
				if((i+1)!=3)
				$('#'+idName).append('<option value='+(i+1)+' >' + mainData1[i]+ '</option>');
			});
		}
	});
}
 */
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
		$("#stateId2").val($("#stateId").val());
		
		
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
			$("#scheduleCode").focus();
			return false;
		}
		if ($("#trainingInstitute").val() == 0 && $("#trainingPhase").val() !=3) {
			$("#trainingInstituteErr").css("display", "block");
			return false;
		}

		if ($("#trainingStartDate").val() == 0) {
			$("#trainingStartDateErr").css("display", "block");
			return false;
		}
	 	
		var currDate=new Date();
		
		var currDateFormat=(currDate.getMonth()+1)+"-"+currDate.getDate()+"-"+currDate.getFullYear();
	
		var currmili=new Date(currDateFormat).getTime();
		var d1=$("#trainingStartDate").val().split('-');
		var temp=d1[0];
		d1[0]=d1[1];
		d1[1]=temp;
		
		var d1mili=new Date(d1).getTime();
		
		if(d1mili<currmili){
			alert("Today is "+currDate.getDate()+"-"+(currDate.getMonth()+1)+"-"+currDate.getFullYear()+". Selected Date("+$("#trainingStartDate").val()+") is a past Date.");
			$("#trainingStartDate").val("");
			$("#trainingStartDate").focus();
			return false;
			
		}
 

		
		
	}

	function showSchedules() {
		
		if($("#scheduleCode").val()!=0){
		var total=$("#scheduleCode").val();
		 var name1=JSON.stringify({
     		courseType:0,
     		courseName:0
       })
         $.ajax({
             type: 'post',
             async: false,
             url: 'getScheduleCodeDetails.fssai?data=' + total,
             contentType : "application/json",
		 	 	data:name1,
             success: function(response) {
        
            	 var mainData1 = jQuery.parseJSON(response);
           	
					alert("Schedule :  "+total+"\n\n Subjects: "+mainData1);

                // $('#name_status').html(response);
             }
         });
		
	
		}
		else
			alert("Select schedule to display its subjects");
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
		/* 	$("#instituteField").css("display", "block");
			if(trPhase==3)
			hideInstitute(); */
		
		getScheduleCode(document.getElementById("designation").value, document
				.getElementById("trainingType").value, trPhase, id);

	}
/* function hideInstitute(){
	
		
	$("#trainingInstitute").val(0);
	$("#instituteField").css("display", "none");
} */
	
	function validate2() {
		$("#trainingEndDateErr").css("display" , 'none');
		$("#trainerErr").css("display" , 'none');
		$("#onDateErr").css("display", "none");

		if ($("#trainingEndDate2").val() == 0) {
			$("#trainingEndDateErr").css("display", "block");
			$("#trainingEndDate2").focus();
			return false;
		}
		
		var d1=$("#trainingStartDate2").val().split('-');
		var d2=$("#trainingEndDate2").val().split('-');

		var temp=d1[0];
		d1[0]=d1[1];
		d1[1]=temp;
		
		temp=d2[0];
		d2[0]=d2[1];
		d2[1]=temp;
		
		var sd=new Date(d1).getTime();
		 var ed=new Date(d2).getTime();
	
		 if(sd>ed){
			 alert("End Date cannot be less than Start Date  ");
			 $("#trainingEndDate2").val("");
				$("#trainingEndDate2").focus();

		 return false;
		 }


		var totalDays=$("#totalDays").val();
		for(var i=0;i<totalDays;i++){
			var chk=$("#subjectDates_"+(i+1)).val().split('-');
			if(chk==''){
				$("#onDateErr").css("display", "block");
				return false;
			}
				
			var temp=chk[0];
			chk[0]=chk[1];
			chk[1]=temp;
			 var chkOnDate=new Date(chk).getTime();
			 if(chkOnDate>ed || chkOnDate<sd){
				alert("On-Date for Day"+(i+1)+" should be between "+$("#trainingStartDate2").val()+" and "+$("#trainingEndDate2").val());
				 $("#subjectDates_"+(i+1)).val("");
				 $("#subjectDates_"+(i+1)).focus();

			 return false;
			 }
			
		}
		
/* 		 for(var i=1;i<=totalDays;i++){
				if($("#subjectDates_"+(i-1)).val()==$("#subjectDates_"+(i)).val()){
					alert("Day"+(i-1)+" and Day"+i+" has same Date" );
					return false;
					
				}

			 } */
		 
		 for(var i=2;i<=totalDays;i++){
			 d1=$("#subjectDates_"+(i-1)).val().split('-');
			 d2=$("#subjectDates_"+(i)).val().split('-');
	
			  temp=d1[0];
				d1[0]=d1[1];
				d1[1]=temp;
				

				temp=d2[0];
				d2[0]=d2[1];
				d2[1]=temp;
				
				var d1milli=new Date(d1).getTime();
				 var d2milli=new Date(d2).getTime();
			

				 if(d1milli>d2milli){
				 alert("Date for Day"+(i-1)+" is should be LESS than Day"+i);
				 return false;
				 }

				 if(d1milli==d2milli){ 
					 alert("Date for Day"+(i-1)+" and Day"+i+" is EQUAL");
					 return false;
					 }
		
			 }
		
		
		<ct:forEach items="${listSchCodeSubjects}" 
			var="subjects" varStatus="loop2"> // just for iteration 

		if ($("#trainer_" + '${loop2.count}').val() == '') {
			alert("Select TRAINER");
			$("#trainerErr").css("display", "block");
			$("#trainer_" + '${loop2.count}').focus();
			
			return false;
		}
		</ct:forEach>
alert("Click on Nominate Trainee button to nominate Trainees into Training Calendar if needed.");
	}

	function viewtrainingcalendar(id){ 
		$.ajax({
		type: 'post',
		url: 'viewtrainingcalendar/'+id+'.fssai',
		async: false, 
		success: function (data){
		var mainData1 = jQuery.parseJSON(data);
	
		  $('#calendarTable tr').remove();
		  $('#calendarTable2 tr').remove();
		 	$('#calendarTable').append( '<tr  class="background-open-vacancies"><th>Training Details</th><th>BatchCode</th><th>ScheduleCode</th><th>Start Date</th><th>End Date</th><th>Total Days</th><th>Training Institute</th></tr>')
		 	var row1="<tr><td style='text-align:left;'><ul><li>"+mainData1[0][0]+"</li><br /><li>"+mainData1[0][1]+"</li><br /><li>"+mainData1[0][2]+"</li></td><td>"+mainData1[0][3]+"</td><td>"+mainData1[0][4]+"</td><td>"+mainData1[0][5]+"</td><td>"+mainData1[0][6]+"</td><td>"+mainData1[0][7]+"</td><td>"+mainData1[0][8]+"</td></tr>";
		 	 $('#calendarTable').append(row1); 
			 
			 $('#calendarTable2').append( '<tr  class="background-open-vacancies"><th>Sr.No.</th><th>Day</th><th>Date</th><th>Start & End Time</th><th>Subject</th><th>Trainer</th></tr>');
			 var row2=""; 
		 	var subjects="";
		 	 var trainers="";  
			 var time=""; 
		 	 
					/*  $.each(mainData1,function(i, obj) { 
						subjects=subjects+obj[9]+"<br /><br />";
						trainers=trainers+obj[10]+" "+obj[11]+"<br /><br />";
						time=time+obj[12]+"-"+obj[13]+"<br /><br />";
					 });
					 row2=row2+"<tr><td>"+time+"</td>"+"<td>"+subjects+"</td>"+"<td>"+trainers+"</td></tr>";
					 $('#calendarTable2').append(row2);  */
					 
			 $.each(mainData1,function(i, obj) { 
				 $('#calendarTable2').append("<tr><td>"+(i+1)+")</td><td>"+obj[14]+"</td><td>"+obj[15]+"</td><td>"+obj[12]+"-"+obj[13]+"</td><td>"+obj[9]+"</td><td>"+obj[10]+" "+obj[11]+"</td></tr>"); 

				 });
					
		}
		}); 
		return false;
	}

	function printDiv() {
		var printContents = document.getElementById('printDiv').innerHTML;
		var originalContents = document.body.innerHTML;
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
		location.reload();
		return false;
		
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
	 
	 window.trainerArray = [];
	 function trainerMailData(count){

		 var tid=$("#trainer_"+ count).val();
		// var q=$("#mail_"+ count).val();
		 var sid=$("#subj_"+ count).val();
 if(tid!=0){
			var e1=$("#emailId_"+ tid).val();
		 }
			var loginIds = "";
			$('#testTable').find('input[type="checkbox"]').each(
					function(i) {
						if (this.checked) {
							if (loginIds == "") {
									loginIds = tid + "%"+ e1+"%"+sid;
								window.trainerArray.push(loginIds);	
							}
							else {
							loginIds = loginIds + "," + tid+ "%" + e1+"%"+sid;
							}
						}
						 else{
							window.trainerArray.splice(i , 1);
						} 
					});
			
			console.log(loginIds);
	 }
	 function allTrainerMailData(){
		 var a=window.trainerArray;
		 $('#data').val(a);
	
	 }
</script>