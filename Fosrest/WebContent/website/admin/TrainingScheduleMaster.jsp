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
		//alert(getSrNo);
		
		
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
				
				sId='${aaa[0]}';
				sName='${aaa[1]}';
				
				if((strUser==sId)){
				flag=1;
				}
			}
	
			if(flag==0){
				mystrr=mystrr+'<option value="';
				mystrr=mystrr+sId+'"';
				mystrr=mystrr+' label="'+sName;
				mystrr=mystrr+'" >';
				mystrr=mystrr+sName;
				mystrr=mystrr+'</option>';
				}	
		</ct:forEach>
	
		$("#addRow"+getSrNo).css("display" , "none");
		$("#deleteRow"+getSrNo).css("display" , "block");
		console.log("getSrNo "+getSrNo);
		var nextId = parseInt(getSrNo)+1;
		
		//var sTime=generateOptionTexts( '01:00' );
		//var eTime=generateOptionTexts( '12:00' );	
		var days=dayNumbers();
		rowString = rowString + "<tr id="+nextId+"><td><select id='subject"+nextId+"' name='subject' class='form-control' onfocus='return onclick2(this);' onblur='return removeSingleOption(this);'>"+mystrr+"</select></td><td><select id='day"+nextId+"' name='day' class='form-control'>"+days+"</select></td><td><select id='startTime"+nextId+"' name='startTime' class='form-control' onchange='return calDuration(this);'>"+generateOptionTexts_15mins(document.getElementById("endTime"+(nextId-1)).value)+"</select></td><td><select id='endTime"+nextId+"' name='endTime' class='form-control' onchange='return calDuration(this);'>"+defaultEndTime(document.getElementById("endTime"+(nextId-1)).value)+"</select></td><td><input type='text' class='form-control' id='dispDuration"+nextId+"' value='1 hrs 0 mins' disabled='disabled' ><input type='hidden' class='form-control' id='duration"+nextId+"' name='duration' value='1 hrs 0 mins'  ></td><td><button id='addRow"+nextId+"' class='btn login-btn'  onclick='return addRow(this);'>Add Row</button><button style='display:none;' id='deleteRow"+nextId+"' class='btn login-btn'  onclick='return deleteRow(this);'>Remove Row</button></td></tr>";
		 
		$("#subjectTable").append(rowString);  	
	 
		var e = document.getElementById("subject"+getSrNo); 
		  
		if(typeof e.options[e.selectedIndex+1] =='undefined'){
			//alert("####################################################");  
			return false;
		}
		var strUser = e.options[e.selectedIndex+1].value;
		  
		for(var i=1;i<=getSrNo;i++){  
		
		$("#subject"+i+" option[value='"+strUser+"']").remove();  
		} 
	}	 
		 
		else{ 
			alert("No More Subjects");
		
		}

		return false; 
	 }   
	

	
	function defaultEndTime(prevEndTime){
		var timeArr=prevEndTime.split(":");
		return generateOptionTexts_15mins((parseInt(timeArr[0])+1)+":"+timeArr[1]);   
		
	}
	 	
	 	
	function calDuration(currObj){
 	
 	var currId=$(currObj).closest('tr').attr('id');
 
 var start=	$("#startTime"+currId).val(); 
 var end=	$("#endTime"+currId).val(); 
 start = start.split(":");
 end = end.split(":");
 var startDate = new Date(0, 0, 0, start[0], start[1], 0);
 var endDate = new Date(0, 0, 0, end[0], end[1], 0);
 var diff = endDate.getTime() - startDate.getTime();
 var hours = Math.floor(diff / 1000 / 60 / 60);
 diff -= hours * 1000 * 60 * 60;
 var minutes = Math.floor(diff / 1000 / 60);

 // If using time pickers with 24 hours format, add the below line get exact hours
 if (hours < 0)
    hours = hours + 24;
 //var dur=(hours <= 9 ? "0" : "") + hours + ":" + (minutes <= 9 ? "0" : "") + minutes;
var dur=(hours <= 9 ? "0" : "") + hours + " hrs " + (minutes <= 9 ? "0" : "") + minutes+" mins";

//alert(dur);		
 /* //alert("steeeart "+	s);
		//alert("end "+e);
		//alert(Math.abs(-33));
	 
		var hrsMinStart=s.split(":"); 
		//alert(hrsMinStart);
		var hrsMinEnd=e.split(":");	
		//alert(hrsMinEnd);
		
		alert("qqqqqqq"+parseInt(hrsMinStart[0]));
		var hrs=Math.abs((parseInt(hrsMinStart[0])==00?1:parseInt(hrsMinStart[0]))-parseInt(hrsMinEnd[0]));
		alert("aaa"+hrs);
		var mins=Math.abs(60-parseInt(hrsMinStart[1])+parseInt(hrsMinEnd[1]));
		
		
		if(mins<30 && hrs!=0) { 
			alert("asas");
			mins=60-mins;
		}
		
		 if(mins>59)
			{
			hrs=hrs+1;
			mins =mins -60;
			
			} 
		
		var dur=hrs+" hrs "+mins+" mins";
		//alert(dur); */
		
		$("#duration"+currId).val(dur);
		$("#dispDuration"+currId).val(dur);
	
		return false; 
	}
	 
	 function deleteRow(id){ 
		
		// alert("end "+$(id).closest('tr').attr('id'));
		 var delId= parseInt($(id).closest('tr').attr('id'));
		 
		 var sName=$("#subject"+delId+" option:selected").text();     
		 var sVal=$("#subject"+delId+" option:selected").val();
		// alert(sName+" "+sVal); 
		 var idval = $('#subjectTable tr:last').attr('id');
		var newId=0;
		 $(id).parents('tr').remove(); 
		for(var i=delId;i<idval;i++){
		 document.getElementById(i+1).setAttribute("id", i); 
				document.getElementById("subject"+(i+1)).setAttribute("id", "subject"+i);
				document.getElementById("duration"+(i+1)).setAttribute("id", "duration"+i);
				document.getElementById("dispDuration"+(i+1)).setAttribute("id", "dispDuration"+i);
				document.getElementById("day"+(i+1)).setAttribute("id", "day"+i);
				document.getElementById("startTime"+(i+1)).setAttribute("id", "startTime"+i);
				document.getElementById("endTime"+(i+1)).setAttribute("id", "endTime"+i);
			
				document.getElementById("addRow"+(i+1)).setAttribute("id", "addRow"+i);
				document.getElementById("deleteRow"+(i+1)).setAttribute("id", "deleteRow"+i);
				
		} 
		
		 for(var i=1;i<=idval-1;i++){ 
			 $("#subject"+i).append("<option value="+sVal+" label="+sName+">"+sName+"</option>");  
		 
		 }
		 return false;
	 }
	 
	  
	 function addSubSchedule(){ 
			 
			if('${allSubjects}'=="[]" )   {
				//alert("if"); 
			 	$('#subjectTable tr').remove(); 
				$('#subjectTable').append('<tr><th>No subjects available. Add subjects From Subject Master</th></tr>');
			}	
		
			else
				{
					// alert("else");
				    rowString = ""; 
					var days=dayNumbers();
					var sTime=generateOptionTexts_15mins( '09:00' );
					var eTime=generateOptionTexts_15mins( '10:00' );  

				rowString = rowString + "<tr id='1'><td><select id='subject1' name='subject' class='form-control' onfocus='return onclick2(this);' onblur='return removeSingleOption(this);'><ct:forEach items="${allSubjects}" var="subb" varStatus="loop"><option value='${subb[0]}' label='${subb[1]}' >${subb[1]}</option></ct:forEach></select></td><td><select id='day1' name='day' class='form-control'>"+days+"</select></td><td><select id='startTime1' name='startTime' class='form-control' onchange='return calDuration(this);'>"+sTime+"</select></td><td><select id='endTime1' name='endTime' class='form-control' onchange='return calDuration(this);'>"+eTime+"</select><td><input type='text' class='form-control' id='dispDuration1' value='1 hrs 0 mins' disabled='disabled'><input type='hidden' class='form-control' id='duration1' name='duration' value='1 hrs 0 mins' hidden='true'></td><td><button id='addRow1' class='btn login-btn'  onclick='return addRow(this);'>Add Row</button><button style='display:none;' id='deleteRow1' class='btn login-btn'  onclick='return deleteRow(this);'>Remove Row</button></td></tr>";
				$('#subjectTable').append('<tr><th>Subject Name</th><th>Day</th><th>Start Time</th><th>End Time</th><th>Duration</th><th>Operation</th></tr>');
 
				$("#subjectTable").append(rowString); 
	 			}
		
			
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
 
	 function removeSingleOption(currObj){
		
	
			var currId=$(currObj).closest('tr').attr('id');
			 var idval = $('#subjectTable tr:last').attr('id');
  
			// alert(currId+" "+idval);
			 var sVal=$("#subject"+currId+" option:selected").val();
			
			 for(var i=1;i<=idval;i++){
				 if(i!=currId)  	
					$("#subject"+i+" option[value='"+sVal+"']").remove();
			 } 
			 return false;
	 } 
		function OnStart() { 
		addSubSchedule();
		}
		window.onload = OnStart;
	</script>
	
	<script>
	
	function onclick2(currObj){
		
	
		 var currId=$(currObj).closest('tr').attr('id');
		 var idval = $('#subjectTable tr:last').attr('id');
		 //alert("sasasas"); 
		 var sVal1=$("#subject"+currId+"  option:selected").val();
		 var sName1=$("#subject"+currId+" option:selected").text();
		 for(var i=1;i<=idval;i++){
			 if(i!=currId)  	
				 $("#subject"+i).append("<option value="+sVal1+" label="+sName1+">"+sName1+"</option>"); 
		 } 

		 return false;

	}
	
/* 	function abcd(currObj){
	 var previous, new_value;
	
	 //alert("1111 "+sVal1+" "+sName1); 
	  $('select[id=subject2]').on({ 
  	
	
	    change: function(){
	   	 var sVal2=$("#subject"+currId+"  option:selected").val();
		 var sName2=$("#subject"+currId+" option:selected").text();
		 
	        // new_value = $(this).attr('id');
	        $(currObj).blur(); 
	    	
	   	 alert("2222 "+sVal2+" "+sName2);  
			// alert(currId+" "+idval);
			 var sVal=$("#subject"+currId+" option:selected").val();
			
			 for(var i=1;i<=idval;i++){
				 if(i!=currId)  	{
					$("#subject"+i+" option[value='"+sVal2+"']").remove(); 
				 } 
			 
			 }
	    }

	  });
	} */
	 
</script>
	<%-- <ct:url var="addAction" value="/activateAssessmentOfTraineelist.fssai"></ct:url> --%>
	<ct:url var="addAction" value="/saveEditTrainingScheduleMaster.fssai"></ct:url>
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
										Training Schedule Master 
									</h1>
									
									<div class="row">
										<div class="col-xs-12">
											<fieldset>
												<legend>Create/Edit Schedule <label id="result" class=" error-red">${result }</label>&nbsp </legend>
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
															<cf:select path="designation" name="designation" class="form-control">
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
														 <fieldset style="margin: 0 15px;"><legend>Add Subject</legend>
	                                      		<table id="subjectTable" class="table table-bordered table-responsive">
	                                      		<thead >
	                                      	
	                                      		</thead>
	                                      	
	                                      		
	                                      		</table>
														</fieldset>
														<div class="col-md-06 col-xs-12" style="margin-top: 39px;">
															<input type="submit" id="commonbtn" value="Create"
																style="float: right; padding: 10px 50px 10px 50px"
																class="btn login-btn"  />
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
												<legend>Training Schedule List</legend>
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
																<th>Edit</th>
																<th>Delete</th>
																
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
																<td><button class="btn login-btn"  onclick="return editSchedule('${listtrainingScheduleMaster[3]}',${listtrainingScheduleMaster[5]});return false;" >Edit</button></td>
																 <td><a onclick="return chkIfExists('${listtrainingScheduleMaster[3]}','DELETE');" href="remove/trainingschedule/${listtrainingScheduleMaster[5]}.fssai">Delete</a></td>
															
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
		<cf:hidden path="trainingScheduleId"/> 
		
		<script>
	
	</script>
	</cf:form>
	</body>
	</html>
	
	<script>
	
	function chkIfExists(schCode,opr){
		<ct:forEach items="${listAllCalendarScheduleCodes}" var="schCode" > 
		 if('${schCode}'==schCode){
			 alert("CANNOT "+opr+": Training Calendar Exists for this ScheduleCode "+schCode);
			 return false;
		 }
			</ct:forEach>
		
	}
	
		function validateFields() { 
		
			$("#designationErr").css("display", "none");
	
			$("#trainingTypeErr").css("display", "none");
			$("#trainingPhaseErr").css("display", "none");
		//	$("#trErr").css("display", "none");
			
			
			 var idval = $('#subjectTable tr:last').attr('id');
				
			 
			 if($("#day1").val()!=1){
				 alert("Invalid DAY");
					$("#day1").focus();  
					return false;
				}
			 
				for(var i=1;i<=idval;i++){
					
					var dayCurr=parseInt($("#day"+i).val());
					var dayPrev=0;
					
					if(i==1)
						dayPrev	=1;
					else
						dayPrev=parseInt($("#day"+(i-1)).val());
					
					if(dayCurr<dayPrev){
						alert("Invalid DAY");
						$("#day"+i).focus();  
						
						return false;
					}
					
					if(i!=1)
						if((dayCurr-1)>dayPrev){
						alert("Day for subject "+$("#subject"+i+" option:selected").text()+" should be either "+dayPrev+" or "+(dayPrev+1));
						$("#day"+i).focus();  
						return false;
						}
					 
					if(dayCurr==dayPrev)
					if(idval!=1 && i!=1){
					var prevEndTime=$("#endTime"+(i-1)).val();
					var currStartTime=$("#startTime"+i).val();
					
					
					var result=""+endTimeValidation(prevEndTime,currStartTime);
					  
					if(result=="false"){
						alert("Invalid START/END time: End Time="+prevEndTime+" for "+$("#subject"+(i-1)+" option:selected").text()+" and Start Time="+currStartTime+" for "+$("#subject"+(i)+" option:selected").text()); 
						$("#startTime"+i).focus(); 
						    
						return false;
					}
					 
					}
					var sTime=$("#startTime"+i).val();
					var eTime=$("#endTime"+i).val();
					
					//alert(sTime+" "+eTime);
					result=""+endTimeValidation(sTime,eTime);
					
					if(result=="false"){
						alert("Invalid END TIME");
						$("#endTime"+i).focus();  
						 
						return false;
					}
				}
			
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
	/* 	<td><button onclick='editState(${StateMaster.stateId});return false;' >Edit</button></td>
		<td><a href="<ct:url value='/StateMaster/remove/${StateMaster.stateId}.fssai' />" >Delete</a></td>
	 */

	    function editSchedule(schCode,id){
		
		 $("#result").css("display", "none");
		 if(chkIfExists(schCode,"EDIT")==false){
			 return false;
		 }
		 
		 
		 
            var name1=JSON.stringify({
        		courseName:0
          })
        	$.ajax({
        	      type: 'post',
        	      url: 'trainingSchedule/edit/'+id+'.fssai',
        	      contentType : "application/json",
        		  data:name1,	
        		  async: false, 
        			success: function (response){
        				
        			
        				var mainData1 = jQuery.parseJSON(response);
                	      $("#trainingScheduleId").val(id); 
                	     $("#designation").val(mainData1[0][0]);  
                	    $("#trainingType").val(mainData1[0][1]);
                	    $("#trainingPhase").val(mainData1[0][2]);
                	    $("#status").val(mainData1[0][3]);
                		 $("#designation").prop("disabled", "disabled");
    					$("#trainingType").prop("disabled", "disabled");
    					$("#trainingPhase").prop("disabled", "disabled"); 
    					$("#status").prop("disabled", "disabled"); 
        			
    					$('#subjectTable').show();

        			$('#subjectTable tr').remove();
    				$('#subjectTable').append('<tr><th>Subject Name</th><th>Day</th><th>Start Time</th><th>End Time</th><th>Duration</th><th>Operation</th></tr>');
    				var days=dayNumbers();
					var sTime=generateOptionTexts_15mins( mainData1[0][6] );
					var eTime=generateOptionTexts_15mins( mainData1[0][7]  ); 
					//alert(asasasas +'${allSubjects}');
					$('#subjectTable').append("<tr id='1'><td><select id='subject1' name='subject' class='form-control' onfocus='return onclick2(this);' onblur='return removeSingleOption(this);' ><ct:forEach items="${allSubjects}" var="subb" varStatus="loop"><option value='${subb[0]}' label='${subb[1]}' >${subb[1]}</option></ct:forEach></select></td><td><select id='day1' name='day' class='form-control'>"+days+"</select></td><td><select id='startTime1' name='startTime' class='form-control' onchange='return calDuration(this);'>"+sTime+"</select></td><td><select id='endTime1' name='endTime' class='form-control' onchange='return calDuration(this);'>"+eTime+"</select><td><input type='text' class='form-control' id='dispDuration1' value='1 hrs 0 mins' disabled='disabled'><input type='hidden' class='form-control' id='duration1' name='duration' value='1 hrs 0 mins' hidden='true'></td><td><button id='addRow1' class='btn login-btn' onclick='return addRow(this);'>Add Row</button><button style='display:none;' id='deleteRow1' class='btn login-btn'  onclick='return deleteRow(this);'>Remove Row</button></td></tr>");
					$('#subject1').val(mainData1[0][4]); 
					$('#day1').val(mainData1[0][5]);
					$('#startTime1').val(mainData1[0][6]);
					$('#endTime1').val(mainData1[0][7]); 
					$('#duration1').val(mainData1[0][8]);  
					$("#dispDuration1").val(mainData1[0][8]); 
					/* $("#subject1").prop("disabled", "disabled");  */ 
					//	$("#deleteRow1").prop("value","aaaa");  
					/* $("#deleteRow1").prop("disabled", true); */ 
					  
					
        				$.each(mainData1 , function(i , obj)
        				{	
        					if(i!=0){
        					addRow($("#subject"+(i)));  
        					$('#subject'+(i+1)).val(obj[4]); 
        					$('#day'+(i+1)).val(obj[5]);
        					$('#startTime'+(i+1)).val(obj[6]);
        					$('#endTime'+(i+1)).val(obj[7]); 
        					$('#duration'+(i+1)).val(obj[8]);  
        					$("#dispDuration"+(i+1)).val(obj[8]);
        					
        					/* $("#subject" +(i+1)).prop("disabled", "disabled");
        					$("#addRow" +(i+1)).prop("disabled", true);
        					$("#deleteRow" +(i+1)).prop("disabled", true);  */
        					 } 
        					//$('#subjectTable').append('<tr  id="tableRow"><td>'+obj[4]+'</td><td>'+obj[5]+'</td><td>'+obj[6]+'</td><td>'+obj[7]+'</td><td>'+obj[8]+'</td><td>'+obj[9]+'</td></tr>');  
        					//$('#subjectTable').append("<tr id="+(i+1)+"><td><select id='subject"+(i+1)+"' name='subject' class='form-control' onfocus='return onclick2(this);' onblur='return removeSingleOption(this);'></select></td><td><select id='day"+(i+1)+"' name='day' class='form-control'></select></td><td><select id='startTime"+(i+1)+"' name='startTime' class='form-control' onchange='return calDuration(this);'></select></td><td><select id='endTime"+(i+1)+"' name='endTime' class='form-control' onchange='return calDuration(this);'></select></td><td><input type='text' class='form-control' id='dispDuration"+(i+1)+"' value='1 hrs 0 mins' disabled='disabled' ><input type='hidden' class='form-control' id='duration"+(i+1)+"' name='duration' value='1 hrs 0 mins'  ></td><td><button id='addRow"+(i+1)+"' onclick='return addRow(this);'>Add Row</button><button style='display:none;' id='deleteRow"+(i+1)+"' onclick='return deleteRow(this);'>Remove Row</button></td></tr>");
   
        			});  

        				  $("#commonbtn").val("SAVE edited schedule");
        		            alert("Data has been loaded for Edit");
        			
        		}
        	 
        	      }); 
          return false;
            } 
	</script>
	
	
	<!-- <script type="text/javascript">
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
 -->