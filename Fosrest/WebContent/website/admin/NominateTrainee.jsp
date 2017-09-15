<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="website/js/commonController.js"></script>

<script type="text/javascript">
	function OnStart() {
		/* var des='${des}';
		var ttype='${t}';
		var tphase='${p}'; */
		 var des=document.getElementById("designation").value;
		 var ttype=document.getElementById("trainingType").value;
		var tphase=document.getElementById("trainingPhase").value;
		if(ttype!=3){
			getTrainingInstitute(des,ttype, '0', 'trainingInstitute');
		}
		else{
			getTrainingInstitute(des,ttype, tphase, 'trainingInstitute');
			//TrainingInstituteInfo2(des, ttype, tphase, 'trainingInstitute');	
		} 
		var userList = '${listEligibleuser}';
		if (userList != '') {
			//alert("Y" +userList);
			$("#moduleDIV").css("display", "block");
			$("#unitDIV").css("display", "block");
			$("#batchCodeDIV").css("display", "block");
			
		} 
	}
	window.onload = OnStart;
</script>

<cf:form action="ListEligibleUser.fssai" name="myForm" method="POST"
	commandName="NominateTraineeForm" onsubmit="return validateFields();">

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
									class="orange-font">Welcome ${userName }</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>Nominate Trainee</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<!-- <legend>Search Subject Master</legend> -->
											<!-- table starts here -->
											<!-- left side -->
											<div class="col-md-6 col-xs-12">
                                         <div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Designation:</strong></li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> ${created }</li>
															 <li id="designationErr" style="display:none;" class="style-li error-red" >Please Select Designation.</li>
													</ul>
												</div>
												<cf:select path="designation" class="form-control">
													<cf:option value="" label="Select Designation" />
													<cf:options items="${DesignationList}" itemValue="designationId" itemLabel="designationName"/>
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
														onchange="getTrainingPhase(this.value , 'trainingPhase'); TrainingInstituteInfo(this.value,'trainingInstitute')">
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
														onchange="TrainingInstituteInfo2(this.value,'trainingInstitute')">
														<cf:option value="0" label="Select Training Phase" />
														<cf:options items="${TrainingPhaseList}"
															itemValue="trainingPhaseId" itemLabel="trainingPhaseName" />
													</cf:select>
												</div>
												<div class="col-md-6 col-xs-12">

												<input type="submit" class="btn btn-primary btn-lg" 
													
													style="margin-top: 24px;     margin-left: 350px;" aria-expanded="false"
													value="Get List"/>

											</div>
											</div>
											
											<!-- right side -->
											<div class="col-md-6 col-xs-12">
											<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training
																	Institute:</strong></li>
																		<li class="style-li error-red"><label
																class="error visibility" id="courseError">*
																	error</label></li> 
														<li id="trainingInstituteErr" style="display: none;"
																class="style-li error-red">Please SelectTraining Institute.</li>
														
														</ul>
													</div>
													<cf:select path="trainingInstitute" class="form-control" onchange="getTrainingStartDate(this.value,'batchCode2')">
														<cf:option value="0" label="Select  Training Institute" />
												 </cf:select>
												</div>
												
											  <div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Batch:</strong></li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> ${created }</li>
															  <li id="batchCode2Err" style="display: none;"
												class="style-li error-red">Please Select Batch.</li>
													</ul>
												</div>
												<cf:select path="batchCode2" class="form-control" >
														<cf:option value="0" label="Select Batch" />
													</cf:select>
											</div>
											<div class="form-group">
										<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Select State for Eligible user list:</strong></li>
											<li class="style-li error-red"></li>	
										</ul>
										<button type="button" class="btn btn-primary btn-lg"
												data-toggle="modal" data-target="#myModal3">Select States</button>
									</div>
												
										  </div>
										  
										  
												<div class="row">
													<div class="col-md-6 col-xs-12" style="margin-top: 25px;">
													<!-- c data-target="#myModal2" -->
												<button type="button" id="batchDetails" class="btn btn-primary btn-lg"  data-toggle="modal" style="    margin-top: -4px;"
												 >View Details</button>
													</div>
													<div class="col-md-6 col-xs-12" style="margin-top: 25px;">
														<!--   <button  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false">Show Details</button> -->
													</div>
												</div>
											</div>
										</fieldset>
									</div>


								</div>
							</div>




			<!-- Modal -->
							<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">All States</h4>
										</div>
									<div class="modal-body">

							<!-- table -->
							<div class="row">
								<div class="col-xs-12">
								<table class="table table-bordered table-responsive"
												id="testTable2">
												<thead>
													<tr class="background-open-vacancies">

														<th>S.No.</th>
														<th>State Id</th>
														<th>State Name</th>
														 <th>Enroll States</th>
													</tr>
												</thead>
												<ct:forEach items="${listStateMaster}" var="listStateMaster"
													varStatus="loop">
													<tr>
													<td>${loop.count}</td>
													<td>${listStateMaster.stateId}</td>
													<td id="stateName_${loop.index}">${listStateMaster.stateName}
													</td>
												
													<td class="text-center" ><input type="checkbox" id="statecheck_${listStateMaster.stateId}" onclick='selectStates(${listStateMaster.stateId})' >
													</td>


													</tr>
												</ct:forEach>

											</table>
											
											
								</div>
							</div>
						</div>
								<div class="modal-footer">
											<div>
												<input type="button"
													class="btn login-btn show-details-vacancy collapsed"
													data-toggle="collapse" data-target="#show-result"
													aria-expanded="false" data-dismiss="modal" onclick="setAllStates();"  value="OK" />

											</div>
										</div>
</div>
									</div>
								</div>
















						<!-- Modal -->
							<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content" style="  width: 750px;">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Details</h4>
										</div>
									<div class="modal-body">

										<div class="col-xs-12 " >

								<!-- table -->
								<div class="row">
									<div class="col-xs-12 ">
										<fieldset>
											<legend>Information</legend>
									<table class="table table-bordered table-responsive" id="newTable">
												  <thead>
                                                
                                                </thead>
										<tbody></tbody>
												</table>
										</fieldset>
									</div>
								</div>
							</div>	
										</div>

										<div class="modal-footer">
											<div>
												<input type="button"
													class="btn login-btn show-details-vacancy collapsed"
													data-toggle="collapse" data-target="#show-result"
													aria-expanded="false" onclick="return false;" data-dismiss="modal" value="OK" />

											</div>
										</div>

									</div>
								</div>
							</div>
					
							<!-- Modal -->
								<div class="container-fluid" >
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" >
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Training Calendar</h4>
										</div>
									<div class="modal-body">

											<div class="form-group" id="batchCodeDIV"
												style="display: none">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Batch:</strong></li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> ${created }</li>
													</ul>
												</div>
												<cf:select path="batchCode" class="form-control" id="batchCode">
												<cf:option value="0" label="Select Batch" />
												<ct:forEach items="${batchCodeList}" var="batchcodelist">
												<cf:option value="${batchcodelist[0] }" label="${batchcodelist[1] }" />
												</ct:forEach>
												</cf:select>
											</div>
											
										</div>

										<div class="modal-footer">

											<!-- 	<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button> -->
											<!-- <button type="submit" class="btn btn-primary">Submit</button> -->

											<div>
												<input type="button"
													class="btn login-btn show-details-vacancy collapsed"
													data-toggle="collapse" data-target="#show-result"
													aria-expanded="false" onclick="getUser();return false;" data-dismiss="modal"
													value="OK"  />

											</div>
										</div>

									</div>
								</div>
							</div>
							
							</div>
							
							<div class="col-xs-12 " id="testt">

							<!-- table -->
							<div class="row">
								<div class="col-xs-12">
									<fieldset>
										<legend>Eligible User List</legend>
										<ct:if test="${!empty listEligibleuser}">
											<table class="table table-bordered table-responsive"
												id="testTable">
												<thead>
													<tr class="background-open-vacancies">

														<th>S.No.</th>
														<th>Designation</th>
														<th>Trainee Name</th>
														<th>State</th>
														<th>Enroll for Trainee</th>



													</tr>
												</thead>
												  <ct:set var="count" value="0" scope="page" />
                                                <ct:set var="count" value="${count + 1}" scope="page"/>
												<ct:forEach items="${listEligibleuser}" var="EligibleUser"
													varStatus="loop">
													<tr>
													<td>${loop.count}</td>
													<td>${EligibleUser.designation}</td>
													<td id="userName_${loop.index}">${EligibleUser.firstName}
														<input type="hidden" id="userId_${loop.index}"
														value="${EligibleUser.id}" />
													</td>
													<td>${EligibleUser.correspondenceState}</td>
													<td class="text-center"><input type="checkbox">
													</td>


													</tr>
												</ct:forEach>

											</table>
											<div class="col-md-6 col-xs-12"></div>
											<button type="button" id="enrollId" class="btn btn-primary btn-lg" onClick="validateFields(); return false;"  >Enroll</button>
											<!-- <button type="button" class="btn btn-primary btn-lg"
												data-toggle="modal" data-target="#myModal" onClick="validateFields();validate2();  return false;" >Enroll</button> -->
								</div>
							</div>
							</ct:if>
                                <ct:if test="${empty listEligibleuser}">
                               <strong> No Records Available</strong>
                                </ct:if>
							</fieldset>

						</div>
							<!-- search div ends -->

						</div>
						<!-- row ends -->
<cf:hidden path="multiState" value="" />
					</div>
				</div>
			</div>
		</div>
		
		
	</section>
</cf:form>
<script>
	function getUser() {

		if($("#batchCode").val()==0)
			{
			return false;
			}
		var loginIds = "";
		$('#testTable').find('input[type="checkbox"]').each(
				function(i) {
					if (this.checked) {
						// console.log($("#userId_"+i).val());
						if (loginIds == "") {
							loginIds = $("#userId_" + i).val() + "@"+ $("#userName_" + i).text();
							
						} else {
							loginIds = loginIds + "," + $("#userId_" + i).val()+ "@" + $("#userName_" + i).text();
						}
					}
				});

		console.log(loginIds);
	var trainingPhase= $("#trainingPhase").val();
		var batchCode = $("#batchCode").val();
		var name = JSON.stringify({
			courseType : 0
		});
		var result = loginIds + "-" +batchCode+"-"+trainingPhase;
				
		$.ajax({
			type : 'post',
			url : 'enrollUser.fssai?data=' + result,
			contentType : "application/json",
			data : name,
			success : function(response) {
				alert(response);
				location.reload();
			}
		});

	}
</script>
<script>
 function TrainingInstituteInfo(val, id){
	if (val != 3) {// 3 for induction
		getTrainingInstitute(document.getElementById("designation").value,
				val, '0', id);

	}
	
} 
 function TrainingInstituteInfo2(val, id){
	getTrainingInstitute(document.getElementById("designation").value, document
					.getElementById("trainingType").value, val, id);
		
 }
 function getTrainingStartDate(val, idName){
	 var designation=document.getElementById("designation").value;
	 var trType=document.getElementById("trainingType").value;
	 var trPhase=document.getElementById("trainingPhase").value;
	 var data=designation+"-"+trType+"-"+trPhase+"-"+val;
	var name=JSON.stringify({
			courseType:0
	  })
		$.ajax({
		      type: 'post',
		      url: 'getTrainingStartDate.fssai?data='+data,
		      contentType : "application/json",
			  data:name,
		      success: function (response) {   

		      var mainData1 = jQuery.parseJSON(response);
	 	        $('#'+idName+' option').remove();
		      $('#'+idName).append('<option value="" label="Select Batch" />');
		        $.each(mainData1 , function(i , obj)
		  		{
		        	console.log(obj[0]);
		  				$('#'+idName).append('<option value='+obj[0]+' >'+obj[1]+'</option>');		
		  		});  
		      }
		      });
 }

 function batchcodeinfo(){
	var a=document.getElementById("batchCode2").value;
	var name1=JSON.stringify({
 		courseName:0
   })
  
   
	
	   $.ajax({
 	      type: 'post',
 	     url : 'batchCodeInfo.fssai?id=' + a,
 	      contentType : "application/json",
 		  data:name1,
 	  success: function (response) { 
 	      var mainData1 = jQuery.parseJSON(response);
 	      $('#newTable tr').remove();
 	 $('#newTable').append( '<tr  class="background-open-vacancies"><th>S.No.</th><th>Trainer Name</th><th>Subject</th><th>Training Institute</th><th>Training Type</th><th>Training Phase</th>  <th>Training Start Date</th><th>Training End Date</th></tr>')
 	       var j = 1;
			 $.each(mainData1,function(i, obj) {$('#newTable').append(
			    		
                               '<tr id="tableRow"><td>' + j++
                               + '</td><td>' + obj[0] + '</td><td>' + obj[1] + '</td><td>' + obj[2] +'<br>'+ obj[3] + '</td><td>' + obj[4] + '</td><td>' + obj[5] + '</td><td>' + obj[6] + '</td><td>' + obj[7] + '</td></tr>');
                   });
			    
 	      }
 	      });  
     $('#newTable').show();
     return result;
     }
 




 

	function validateFields() {
		$("#designationErr").css("display" , "none");
		$("#trainingTypeErr").css("display" , "none");
		$("#trainingPhaseErr").css("display" , "none");
		$("#trainingInstituteErr").css("display" , "none");
		 if($("#designation").val() == ''){
	   		 
		   		$("#designationErr").css("display" , "block");
		   		return false;
		   	 } 
		 if($("#trainingType").val() == 0){
	   		 
		   		$("#trainingTypeErr").css("display" , "block");
		   		return false;
		   	 } 
		 var tt=$("#trainingType").val();
		 
		 if(tt==3){
			 if($("#trainingPhase").val() == 0){
		   		 
			   		$("#trainingPhaseErr").css("display" , "block");
			   		return false;
			   	 } 
		 }
		 if($("#trainingInstitute").val() == 0){
		   		$("#trainingInstituteErr").css("display" , "block");
		   		return false;
		   	 } 
		 
	}
	jQuery(function($){
		
		$("#batchDetails").click(function(){
			$("#designationErr").css("display", "none");
			$("#trainingTypeErr").css("display", "none");
			$("#trainingPhaseErr").css("display", "none");
			$("#trainingInstituteErr").css("display", "none");
			$("#batchCode2Err").css("display", "none");
	       // ev.preventDefault();
	       var tInstitute=document.getElementById("trainingInstitute").value;
		 
    	 var des=document.getElementById("designation").value;
		 var tType=document.getElementById("trainingType").value;
		var tPhase=document.getElementById("trainingPhase").value
		var tStartDate=document.getElementById("batchCode2").value;
		if(des==''){
			$("#designationErr").css("display", "block");
			return false;
		}
		if(tType==''){
			$("#trainingTypeErr").css("display", "block");
			return false;
		}
		if(tType==3){
			if(tPhase==0){	
			$("#trainingPhaseErr").css("display", "block");
			return false;
			}
		}
		if(tInstitute==''){
			$("#trainingInstituteErr").css("display", "block");
			return false;
		}
		if(tStartDate==''){
			$("#batchCode2Err").css("display", "block");
			return false;
		}
		else{ 
			 $("#myModal2").modal('show');
			 batchcodeinfo();
		 }  
	    });
		
		$("#enrollId").click(function(){
			  if($("#testTable").find('input[type=checkbox]:checked').length == 0)
			{
			     alert('Please select atleast one Trainee');
			     return false;
			}
			  else{
				  $("#myModal").modal('show');
			  }
		});
	});
	
	window.stateArray = [];
	 function selectStates(stateId){
		 console.log(stateId);
		 var ischecked = document.getElementById("statecheck_"+stateId).checked;
		 console.log(ischecked);
		 
		if(document.getElementById("statecheck_"+stateId).checked  ){
			window.stateArray.push(stateId);	
		}
	else if(!document.getElementById("statecheck_"+stateId).checked){
			 var index = window.stateArray.indexOf(""+stateId+"");
			if(index != -1){
				window.stateArray.splice(index , 1);	
			}
		}
	 }
	 
	 function setAllStates(){
		 var a=window.stateArray;
			 $('#multiState').val(a);
		 } 

</script>
