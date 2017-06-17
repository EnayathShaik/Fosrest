<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

 <script src="website/js/commonController.js"></script>
 <script type="text/javascript" src="website/js/jquery.min.js"></script>
<script type="text/javascript" src="website/js/bootstrap-clockpicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="website/css/bootstrap-clockpicker.min.css">

<style type="text/css">
.navbar h3 {
	color: #f5f5f5; 
	margin-top: 14px;
}
.hljs-pre {
	background: #f8f8f8;
	padding: 3px;
}
.footer {
	border-top: 1px solid #eee;
	margin-top: 40px;
	padding: 40px 0;
}
.input-group {
	width: 110px;
	margin-bottom: 10px;
}
.pull-center {
	margin-left: auto;
	margin-right: auto;
}
@media (min-width: 768px) {
  .container {
    max-width: 730px;
  }
}
@media (max-width: 767px) {
  .pull-center {
    float: right;
  }
}
</style>

 
<script>

function addRow(thisId){

	var noOfSubjects='${allSubjects}'.split(",").length;
	var getSrNo= $(thisId).closest('tr').attr('id');
	//alert("getSrNo<noOfSubjects------"+getSrNo+"<"+noOfSubjects);
	if(getSrNo<noOfSubjects){
		rowString = ""; 
	 	var mystrr;
	 	 mystrr="";
		var sName;
		var sId;
		var flag;
		
	 <ct:forEach items="${allSubjects}" var="aaa" > 
	flag=0;
	 for(var i=1;i<=getSrNo;i++){
			var e = document.getElementById("subject"+i);
			var strUser = e.options[e.selectedIndex].value;
			//alert("werere "+strUser);
			sId='${aaa[0]}';
			sName='${aaa[1]}';
			
			if((strUser==sId)){
			flag=1;
			}
		}

		if(flag==0){
			mystrr=mystrr+'<option value="';
			mystrr=mystrr+sId;
			mystrr=mystrr+'" >';
			mystrr=mystrr+sName;
			mystrr=mystrr+'</option>';
			}
	</ct:forEach>

	$("#addRow"+getSrNo).css("display" , "none");
	$("#deleteRow"+getSrNo).css("display" , "block");
	console.log("getSrNo "+getSrNo);
	var nextId = parseInt(getSrNo)+1;
	
	var time=generateOptionTexts( '01:00' );
	var days=dayNumbers();
	rowString = rowString + "<tr id="+nextId+"><td><select id='subject"+nextId+"' name='subject' class='form-control'>"+mystrr+"</select></td><td><select id='day"+nextId+"' name='day' class='form-control'>"+days+"</select></td><td><select id='startTime"+nextId+"' name='startTime' class='form-control'>"+time+"</select></td><td><select id='endTime"+nextId+"' name='endTime' class='form-control'>"+time+"</select></td><td><button id='addRow"+nextId+"' onclick='return addRow(this);'>Add</button><button style='display:none;' id='deleteRow"+nextId+"' onclick='return deleteRow(this);'>Remove</button></td></tr>";
	
	$("#subjectTable").append(rowString);
}
	
	else{
		alert("No More Subjects");
	}
	return false;
 }
 
 
 function deleteRow(id){
	$(id).parents('tr').remove();
	// alert("end "+$(id).closest('tr').attr('id'));
	 var delId= parseInt($(id).closest('tr').attr('id'));
	 var idval = $('#subjectTable tr:last').attr('id');
	// alert("last id="+idval);

	 var newId=0;
	for(var i=0;i<idval-1;i++){
	
		 newId=delId+i;
		// alert((delId+i+1)+">>"+newId);	
			document.getElementById(delId+i+1).setAttribute("id", newId);
			document.getElementById("subject"+(delId+i+1)).setAttribute("id", "subject"+newId);
			document.getElementById("duration"+(delId+i+1)).setAttribute("id", "duration"+newId);
			document.getElementById("day"+(delId+i+1)).setAttribute("id", "day"+newId);
			document.getElementById("startTime"+(delId+i+1)).setAttribute("id", "startTime"+newId);
			document.getElementById("endTime"+(delId+i+1)).setAttribute("id", "endTime"+newId);
		
			document.getElementById("addRow"+(delId+i+1)).setAttribute("id", "addRow"+newId);
			document.getElementById("deleteRow"+(delId+i+1)).setAttribute("id", "deleteRow"+newId);
	}
	 return false;
 }
 
 
 function addSubSchedule(){	
	
	 rowString = "";
		var time=generateOptionTexts( '01:00' );
		var days=dayNumbers();
	rowString = rowString + "<tr id='1'><td><select id='subject1' name='subject' class='form-control'><ct:forEach items="${allSubjects}" var="subb" varStatus="loop"><option value='${subb[0]}' >${subb[1]}</option></ct:forEach></select></td><td><select id='day1' name='day' class='form-control'>"+days+"</select></td><td><select id='startTime1' name='startTime' class='form-control'>"+time+"</select></td><td><select id='endTime1' name='endTime' class='form-control'>"+time+"</select></td><td><button id='addRow1' onclick='return addRow(this);'>Add</button><button style='display:none;' id='deleteRow1' onclick='return deleteRow(this);'>Remove</button></td></tr>";
	$("#subjectTable").append(rowString); 
 }

/*  function chkDur(obj){
	// alert(obj); 
	 
	 //alert("ff "+obj.value);   
	// alert(obj.id);
	//alert( obj.value.match(/^[0-9]{2}:[0-9]{2}$/)); 
	if( obj.value.match(/^[0-9]{2}:[0-9]{2}$/)==null){
		 alert("Invalid Duration:- Enter correct format(eg. 01:30 for 1hr 30min)");
		 return false;
	}

	
 }  */
 
 function chkDates(){
	 var idval = $('#subjectTable tr:last').attr('id');
	 //alert(idval);
		for(var i=1;i<=idval;i++){
			
			var sTime=$("#startTime"+i).val();
			var eTime=$("#endTime"+i).val();
			//alert(sTime+" "+eTime);
			var result=""+endTimeValidation(sTime,eTime);
			
			
			if(result=="false"){
				alert("invalid End date");
				$("#endTime"+i).focus();  
				
				return false;
			}
		}
		
	 
 }
 
	function OnStart() { 
	addSubSchedule();
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
											<legend>Create Schedule </legend>
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
																<li class="style-li"><strong>Status:</strong></li>
																	<li id="statusErr" style="display: none;"
																class="style-li error-red">Please Select Training
																Type.</li>
															</ul>
														</div>
														<cf:select path="status" class="form-control">
															<cf:option value="A" label="Active" />
															<cf:option value="I" label="In-Active" />
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
															<li class="style-li"><strong>Training Type:</strong></li>
															<li id="trainingTypeErr" style="display: none;"
																class="style-li error-red">Select Training
																Type.</li>
															<li class="style-li error-red"><span
																id="name_status" class="clear-label"> </span> ${created }</li>
														</ul>
													</div>
													 <cf:select path="trainingType" class="form-control" onchange="getTrainingPhase(this.value , 'trainingPhase')">
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
																class="style-li error-red">Select Training
																Phase.</li>
															<li class="style-li error-red"><label
																class="error visibility" id="courseError">*
																	error</label></li>
														</ul>
													</div>
													 <cf:select path="trainingPhase" class="form-control">
															<cf:option value="" label="Select Training Phase" />
															<cf:options items="${TrainingPhaseList}"
																itemValue="trainingPhaseId" itemLabel="trainingPhaseName" />
														</cf:select> 
												</div>

												
												</div>
													 <fieldset><legend>Add Subject</legend>
                                      		<table id="subjectTable" class="table table-bordered table-responsive">
                                      		<thead >
                                      		<tr class="background-open-vacancies">
                                      		
                                      		<th>Subject Name</th>
                                      		<th>Day</th>
                                      		<th>Start Time</th>
                                      		<th>End Time</th>
                                      		<!-- <th><ul><li id="trErr" style="display: none;"
																class="style-li error-red">Enter Duration for each SUBJECT	</li></ul>Duration</th> -->
                                      		<th>Operation</th>
                                      
                                      		</tr>
                                      		</thead>
                                      	
                                      		
                                      		</table>
													</fieldset>
													<div class="col-md-06 col-xs-12" style="margin-top: 39px;">
														<input type="submit" id="searchbtn" value="Create"
															style="float: right; padding: 10px 50px 10px 50px"
															class="btn login-btn" onclick="return chkDates();" />
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
															<th>Training Type</th>
															<th>Training Phase</th>
															<th>Schedule Code</th>
															
															<th>Total Days</th>
															
		                                                </tr>
													</thead>
													<ct:forEach items="${listtrainingScheduleMaster}"
														var="listtrainingScheduleMaster" varStatus="loop">
														<tr >
															<td>${loop.count}</td>
															<td>${listtrainingScheduleMaster[0]}</td>
															<td>${listtrainingScheduleMaster[1]}</td>
															<td>${listtrainingScheduleMaster[2]}</td>
															<td>${listtrainingScheduleMaster[3]}</td>
															<td>${listtrainingScheduleMaster[4]} </td>
															
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
	<input type="hidden" id="idH" value="" /> 
	
	<script>

</script>
</cf:form>
</body>
</html>

<script>
	function validateFields() {
	
		$("#designationErr").css("display", "none");

		$("#trainingTypeErr").css("display", "none");
		$("#trainingPhaseErr").css("display", "none");
		$("#trErr").css("display", "none");
		
		
		if ($("#designation").val() == 0) {
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
		/*  var idval = $('#subjectTable tr:last').attr('id');
	
		 for(var i=1;i<=idval;i++){
			
			 if($("#duration"+i).val()=='')
				 {
				 alert("Enter Duration for each SUBJECT");
				 $("#trErr").css("display", "block");
				 return false;
				 } 
		 } */
		

	}
</script> 
<script type="text/javascript">
 $('.clockpicker').clockpicker()
	.find('input').change(function(){
		console.log(this.value);
		alert(this.value);
		
	});
var input = $('#single-input').clockpicker({
	placement: 'bottom',
	align: 'left',
	autoclose: true,
	'default': 'now'
});

$('.clockpicker-with-callbacks').clockpicker({
		donetext: 'Done',
		init: function() { 
			console.log("colorpicker initiated");
		},
		beforeShow: function() {
			console.log("before show");
		},
		afterShow: function() {
			console.log("after show");
		},
		beforeHide: function() {
			console.log("before hide");
		},
		afterHide: function() {
			console.log("after hide");
		},
		beforeHourSelect: function() {
			console.log("before hour selected");
		},
		afterHourSelect: function() {
			console.log("after hour selected");
		},
		beforeDone: function() {
			console.log("before done");
		},
		afterDone: function() {
			console.log("after done");
		}
	})
	.find('input').change(function(){
		console.log(this.value);
	});

// Manually toggle to the minutes view
$('#check-minutes').click(function(e){
	// Have to stop propagation here
	e.stopPropagation();
	input.clockpicker('show')
			.clockpicker('toggleView', 'minutes');
});
if (/mobile/i.test(navigator.userAgent)) {
	$('input').prop('readOnly', true);
} 
</script>
