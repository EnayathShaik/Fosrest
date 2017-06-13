<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="website/js/commonController.js"></script>
<script>
	   function OnStart() {
	     
		
		   
	  	flatpickr("#trainingStartDate" , {
	  		
	  		enableTime: true
	  	});	
		
	   	
	   	if('${profileId}' == 2){
	   		/*$("#searchbtn").css("display" , 'none');
	   	 $("#createbtn").css("display" , 'block'); */
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
									class="orange-font">Welcome Admin</span>
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
									</legend>
									<div class="row">
										<div class="col-xs-12">
											<%-- <cf:input type="hidden" path="trainingScheduleId" /> --%>
											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Designation:</strong></li>
															<li class="style-li error-red"><cf:errors
																	path="designation" cssClass="error" /></li>
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
																class="style-li error-red">Please Select Training
																Type.</li>
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
																class="style-li error-red">Please Select Training
																Phase.</li>
															<li class="style-li error-red"><label
																class="error visibility" id="courseError">*
																	error</label></li>
														</ul>
													</div>
													<cf:select path="trainingPhase" class="form-control" onchange="redirectScheduleCode2(this.value,'scheduleCode')">
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
															<li id="trainingPhaseErr" style="display: none;"
																class="style-li error-red">Please Select Schedule Code.</li>
															<li class="style-li error-red"><label
																class="error visibility" id="courseError">*
																	error</label></li>
														</ul>
													</div>
													<cf:select path="scheduleCode" class="form-control">
														<cf:option value="0" label="Select Training Phase" />
														<cf:options items="${sched}"
															itemValue="trainingScheduleId" itemLabel="trainingScheduleCode" />
													</cf:select>
												</div>
												<%-- <div class="form-group">
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
														<cf:select path="trainingInstitute" class="form-control">
															<cf:option value="" label="Select training phase" />
															<cf:options items="${listTrainingInstitute}" />
														</cf:select>
														<cf:select path="trainingInstitude" class="form-control"
													onchange="getTrainer(this.value , 'trainer_id')">
													<cf:option value="0" label="Select Training Institute" />
													<cf:options items="${listTrainingInstitude}" itemValue="id"
														itemLabel="trainingCenterName" />
												</cf:select>
													</div>
												</div> --%>
											<%-- 	<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Trainer:</strong></li>
															<li id="trainingInstitudeErr" style="display: none;"
																class="style-li error-red">Please Select Training
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
													<!-- <input type="submit" id="createbtn"
														style="display: none; float: right; margin-right: 122px;"
														value="Create" class="btn login-btn" /> -->
														 <input
														type="submit" id="searchbtn" value="Search"
														class="btn login-btn" formaction="trainingcalendarsearch.fssai"/>
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
											<legend>Search Result </legend>
											<ct:if test="${!empty listCalendarSearch}">
												<table border="1" id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Designation</th>
															<th>Training Type</th>
															<th>Schedule Code</th>
															<th>Subject</th>
															<th>Training Duration</th>
														
															<th>Training End Date</th>
															<th>Trainer</th>
															
															

														</tr>
													</thead>

													<ct:forEach items="${listCalendarSearch}" var="listCalendarSearch"
														varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															 <td>${listCalendarSearch[0]}</td>
															<td>${listCalendarSearch[1]}</td>
															<td>${listCalendarSearch[2]}</td>
														 <td>${listCalendarSearch[3]}</td>
														 <input type="hidden" class="form-control" name='subject' value="${listCalendarSearch[3]}"
														type="text"  />
														 <td>${listCalendarSearch[4]}</td>
													
														<td><input type="text" class="form-control" id="trainingEndDate${loop.count}"
														type="text"  /></td>
														
														
													<td><div class="form-group">
												
													<select name='trainer' class="form-control">
															<option value="" label="Select Trainer" />
														<ct:forEach items="${listPersonalInfoTrainer}" var="listPersonalInfoTrainer"
														varStatus="loop">
													
														<option value="${listPersonalInfoTrainer.trainerId.id}" >${listPersonalInfoTrainer.firstName}</option>
													</ct:forEach>
													</select>
												</div></td>
														


														</tr>
													</ct:forEach>
												</table>
												 <input
														type="submit" id="searchbtn" value="create"
														class="btn login-btn"  />
											</ct:if>
										</fieldset>
									</div>
								</div>
								
								
							</div>
							<!-- search Results 22222 -->
							<div class="col-xs-12 " id="testt">

								<!-- table -->
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Training Calendar</legend>
											<ct:if test="${!empty listCalendar}">
										
												<table border="1" id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Designation</th>
															<th>Training Type</th>
															<th>Schedule Code</th>
															<th>Total Duration</th>
															<th>Training Start Date</th>
															<th>Training End Date</th>
															<th>Trainer</th> 
															
															

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
														<td>s</td>
														<td>s</td>
														<td>s</td>


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

   <script>
   function redirectScheduleCode1(trType,id){
	   alert(trType);
   
	  if(trType!=3){// 3 for induction
   	   getScheduleCode(document.getElementById("designation").value,trType,'0',id);

	  }
		  
   }
   
  function redirectScheduleCode2(trPhase,id){
                    	   alert(trPhase+id);
                    	
                    	   getScheduleCode(document.getElementById("designation").value,document.getElementById("trainingType").value,trPhase,id);
                    	   
                       }
  
 
                       
                
                       </script>