<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="website/js/commonController.js"></script>
<script>
                function OnStart() {
                   
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
                window.onload = OnStart;

            </script>
<ct:url var="addAction" value="/TrainingSchedule/add.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="TrainingScheduleForm" onsubmit="return validateFields();">

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
								<h1>Training Schedule Master</h1>
								<div class="row">
									<div class="col-xs-12">
										<cf:input type="hidden" path="trainingScheduleId" />
										<!-- left side -->
										<div class="col-xs-6">

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Unit Name:</strong></li>
														<li id="unitIdErr" style="display: none;"
															class="style-li error-red">Please Select Unit Name.</li>
														<li class="style-li error-red"><label
															class="error visibility" id="courseError">*</label></li>
													</ul>
												</div>
												<cf:select path="unitId" class="form-control"
													onchange="getModule(this.value , 'moduleId')">
													<cf:option value="0" label="Select Unit name" />
													<cf:options items="${listUnitMaster}" itemLabel="unitCode"
														itemValue="unitId" />
												</cf:select>
											</div>


											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>User Type</strong></li>
														<li id="userTypeErr" style="display: none;"
															class="style-li error-red">Please Select User Type.</li>
														<li class="style-li error-red"><span id="name_status">
														</span><span id="err"> </span> <label id=userTypeError
															class="error visibility">* Select UserType </label> <cf:errors
																path="userType" cssClass="error" />${created }</li>
													</ul>
												</div>
												<cf:select path="userType" class="form-control">
													<cf:option value="" label="Select User Type" />
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

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong> Requested
																State:</strong></li>
														<li id="stateErr" style="display: none;"
															class="style-li error-red">Please Select State.</li>
														<li class="style-li error-red"></li>
													</ul>
												</div>
												<cf:select path="state" class="form-control">
													<cf:option value="0" label="Select state Name" />
													<cf:options items="${listStateMaster}" itemValue="stateId"
														itemLabel="stateName" />
												</cf:select>
											</div>

										</div>
										<!-- left side ends -->

										<!-- right side -->
										<div class="col-xs-6">
											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Module Name:</strong></li>
														<li id="moduleIdErr" style="display: none;"
															class="style-li error-red">Please Select Module
															Name.</li>
														<li class="style-li error-red"><label
															class="error visibility" id="courseError">*</label></li>
													</ul>
												</div>
												<cf:select path="moduleId" class="form-control">
													<cf:option value="0" label="Select Module name" />
													<cf:options items="${listModuleMaster}"
														itemLabel="moduleCode" itemValue="moduleId" />
												</cf:select>
											</div>

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training
																Partner Name:</strong></li>
														<li id="trainingPartnerErr" style="display: none;"
															class="style-li error-red">Please Select Training
															Partner Name.</li>
														<li class="style-li error-red"></li>
													</ul>
												</div>
												<cf:select path="trainingPartner" class="form-control"
													onchange="getTrainingInstitude(this.value , 'trainingInstitude')">
													<cf:option value="0" label="Select Training Partner" />
													<cf:options items="${listTrainingPartner}"
														itemValue="trainingPartnerId"
														itemLabel="trainingPartnerName" />
												</cf:select>
											</div>

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training
																Institude:</strong></li>
														<li id="trainingInstitudeErr" style="display: none;"
															class="style-li error-red">Please Select Training
															Institude.</li>
														<li class="style-li error-red"></li>
													</ul>
												</div>
												<cf:select path="trainingInstitude" class="form-control"
													onchange="getTrainer(this.value , 'trainer_id')">
													<cf:option value="0" label="Select Training Institude" />
													<cf:options items="${listTrainingInstitude}" itemValue="id"
														itemLabel="trainingCenterName" />
												</cf:select>
											</div>

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training
																Trainer:</strong></li>
														<li id="trainingTrainerErr" style="display: none;"
															class="style-li error-red">Please Select a trainer.</li>
														<li class="style-li error-red"></li>
													</ul>
												</div>
												<cf:select path="trainer_id" class="form-control"
													onchange="">
													<cf:option value="0" label="Select a Trainer" />
												<%-- 	 <ct:forEach var="twofields"
														items="${listPersonalInfoTrainer}">
														<cf:option value="${twofields.id}">
															<ct:out value="${twofields.id} - ${twofields.firstName}" />
														</cf:option>
													</ct:forEach>  --%>
												</cf:select>
											</div>

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training
																Institute's Status:</strong></li>
														<li id="trainingInstitudeStatusErr" style="display: none;"
															class="style-li error-red">Please Select Training
															Institude Status.</li>
														<li class="style-li error-red"><cf:errors
																path="trainingInstitudeStatus" cssClass="error" /></li>
													</ul>
												</div>
												<cf:select path="trainingInstitudeStatus"
													class="form-control">
													<cf:option value="" label="Select Status" />
													<cf:options items="${userStatusMap}" />
												</cf:select>

											</div>

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Training End
																Date:</strong></li>
														<li id="trainingEndDateErr" style="display: none;"
															class="style-li error-red">Please Select Training
															End date.</li>
														<li class="style-li error-red"><label
															class="error visibility" id="courseError">* </label></li>
													</ul>
												</div>
												<cf:input class="form-control" path="trainingEndDate"
													type="text" placeholder="Training End Date" />
											</div>


										</div>
										<!-- rigth side ends -->

										<!-- button -->
										<div class="row">


											<div class="col-md-6 col-xs-12">
												<input type="submit" id="updatebtn"
													style="display: none; float: right; margin-right: 122px;"
													value="Update" class="btn login-btn" /> 
													<input
													type="submit" id="createbtn" value="Create"
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
							</div>


							<!-- search Results -->
							<div class="col-xs-12 " id="testt">

								<!-- table -->
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Training Schedule </legend>
											<ct:if test="${!empty listTrainingSchedule}">
												<table  border="1" id="datatablesfosrest" class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>User Type</th>
															<th>Training Type</th>
															<th>Training Phase</th>
															<th>Training Start Date</th>
															<th>Training End Date</th>
															<th>Batch code</th>
															<th>Status</th>
															<th>Reschedule</th>
															<th>Deactivate</th>

														</tr>
													</thead>

													<ct:forEach items="${listTrainingSchedule}"
														var="TrainingSchedule" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<td>${TrainingSchedule.userType}</td>
															<td>${TrainingSchedule.trainingType}</td>
															<td>${TrainingSchedule.trainingPhase}</td>
															<td>${TrainingSchedule.trainingStartDate}</td>
															<td>${TrainingSchedule.trainingEndDate}</td>
															<td>${TrainingSchedule.batchCode}</td>
															<td>${TrainingSchedule.trainingInstitudeStatus}</td>
															<td><button
																	onclick='editTrainingSchedule(${TrainingSchedule.trainingScheduleId});return false;'>Reschedule</button></td>
															<td><a
																href="<ct:url value='/TrainingSchedule/remove/${TrainingSchedule.trainingScheduleId}.fssai' />">Deactivate</a></td>

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
          
                
                function editTrainingSchedule(id){
                
                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'TrainingSchedule/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#unitId").val(mainData1.unitId);
            	    $("#moduleId").val(mainData1.moduleId);
            	    $("#trainingScheduleId").val(mainData1.trainingScheduleId);
            	    $("#userType").val(mainData1.userType);
            	    $("#trainingType").val(mainData1.trainingType);
            	    $("#trainingPhase").val(mainData1.trainingPhase);
            	    $("#trainingInstitudeStatus").val(mainData1.trainingInstitudeStatus);
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
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }
                
                function validateFields(){
                	  $("#unitIdErr").css("display" , "none");
                	  	 $("#moduleIdErr").css("display" , "none");
                	  	 $("#userTypeErr").css("display" , "none");
                	  	 $("#statusErr").css("display" , "none");
                	  	 $("#trainingPartnerErr").css("display" , "none");
                	  	 $("#trainingTypeErr").css("display" , "none");
                	  	 $("#trainingInstitudeErr").css("display" , "none");
                	  	 $("#trainingPhaseErr").css("display" , "none");
                	  	 $("#trainingInstitudeStatusErr").css("display" , "none");
                	  	 $("#trainingStartDateErr").css("display" , "none");
                	  	 $("#trainingEndDateErr").css("display" , "none");
                	  	$("#trainingTrainerErr").css("display" , "none");
                	  	 $("#stateErr").css("display" , "none");
                	  	 
                	  	 
                	if($("#unitId").val() == 0){
                  		 
                 		$("#unitIdErr").css("display" , "block");
                 		return false;
                 	 }
                	if($("#moduleId").val() == 0){
                  		 
                 		$("#moduleIdErr").css("display" , "block");
                 		return false;
                 	 }
                    if($("#userType").val() == ''){
                   		 $("#userTypeErr").css("display" , "block");
                    		return false; 
                   	 }
                    if($("#trainingPartner").val() == 0){
                   		 
                 		$("#trainingPartnerErr").css("display" , "block");
                 		return false;
                 	 }
                     if($("#trainingType").val() == 0){
                   		 
                 		$("#trainingTypeErr").css("display" , "block");
                 		return false;
                 	 }
                    if($("#trainingInstitude").val() == 0){
                   		 
                  		$("#trainingInstitudeErr").css("display" , "block");
                  		return false;
                  	 }
                 	 if($("#trainingPhase").val() == 0){
                  		 
                 		$("#trainingPhaseErr").css("display" , "block");
                 		return false;
                 	 }
                 	if($("#trainer_id").val() == 0){
                		 
                 		$("#trainingTrainerErr").css("display" , "block");
                 		return false;
                 	 }
                 	if($("#trainingInstitudeStatus").val() == 0){
                  		 
                  		$("#trainingInstitudeStatusErr").css("display" , "block");
                  		return false;
                  	 }
                 	 if($("#trainingStartDate").val() == 0){
                  		 
                   		$("#trainingStartDateErr").css("display" , "block");
                   		return false;
                   	 }
                  	if($("#trainingEndDate").val() == 0){
                   		 
                  		$("#trainingEndDateErr").css("display" , "block");
                  		return false;
                  	 }
                 	if($("#state").val() == 0){
                  		 
                 		$("#stateErr").css("display" , "block");
                 		return false;
                 	 }
                 	
                    }
                
                
                function getTrainer(val , idName)
                {
                 	var name1=JSON.stringify({
                		courseType:0,
                		courseName:0
                  })
                	$.ajax({
                	      type: 'post',
                	      url: 'loadTrainer.fssai?data='+ val,
                	      contentType : "application/json",
                		  data:name1,
                		    success: function (response) {      
                			      var mainData1 = jQuery.parseJSON(response);
                			      $('#'+idName+' option').remove();	
                			      $('#'+idName).append('<option value="0" label="Select Trainer" />');
                			  	  $.each(mainData1 , function(i , obj)
                			  		{
                			  		$('#'+idName).append('<option value='+obj[0]+' >' + obj[0]+'-'+obj[20]
									+ '</option>');	
                			  		});
                			      }
                	      });     
                }

            </script>