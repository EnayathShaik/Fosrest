<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="website/js/commonController.js"></script>

<cf:form action="fotestassessmentquestionssave.fssai" name="myForm"
	method="POST" commandName="assessmentQuestionsForm"
	>
	<script>
    function generateAnsSeq(){
    	$('#assAnsTable').html("");
    	var noOfAssmentQ =  $("#noOfAssessmentQues").val();
    	$('#assAnsTable').append('<tr><th>Sr.no</th><th>options</th></tr>')
		
    	for(i=1;i<=noOfAssmentQ;i++){
    		if(i==1){
    			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionOne" class="form-control" /></td></tr>')
    			document.getElementById('optionOne').value = '';
    			
    		}else if(i==2){
    			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionTwo" class="form-control" /></td></tr>')
    			document.getElementById('optionTwo').value = '';
    			
    		}else if(i==3){
    			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionThree" class="form-control" /></td></tr>')
    			document.getElementById('optionThree').value = '';
    			
    		}else if(i==4){
    			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionFour" class="form-control" /></td></tr>')
    			document.getElementById('optionFour').value = '';
    			
    		}else if(i==5){
    			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionFive" class="form-control" /></td></tr>')
    			document.getElementById('optionFive').value = '';
    			
    		}else if(i==6){
    			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionSix" class="form-control" /></td></tr>')
    			document.getElementById('optionSix').value = '';
    	}
    	}
    }
    

    function answerno(id,ansno){
	
    	var noOfAssmentQ =  $("#noOfAssessmentQues").val();
       	if(parseInt(ansno) > parseInt(noOfAssmentQ)){
       		
    	document.getElementById(id).value="";
    	$("#correctAnswerErr").css("display" , "block");
    	 } 
       	else
       		$("#correctAnswerErr").css("display" , "none");

       	
    	}
    

    </script>
	<section>
		<%@include file="../roles/top-menu.jsp"%>
	</section>
	<!-- main body -->
	<section class="main-section-margin-top">
		<div class="container-fluid">
			<div id="wrapper">
				<!-- Page Content -->
				<div><%@include file="../roles/slider.jsp"%>
				</div>
				<div id="page-content-wrapper">
					<div class="container-fluid">
						<!-- vertical button -->
						<div class="row">
							<div class="col-lg-12">
								<a href="#menu-toggle" class="vertical-menu-position-btn"
									id="menu-toggle"> <i class="fa fa-bars"></i> <span
									class="orange-font">Welcome ${userName} </span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">

								<h1>Manage Assessment Questions</h1>
								<span id="name_status" class="style-li error-red"><h3>${created }
									</h3></span> <BR>
								<div class="row">
									<div class="col-xs-12">

										<!-- left side -->
										<div class="col-md-6 col-xs-12">

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>assessmentType:</strong></li>

														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> <%--  ${created } --%></li>
													</ul>
												</div>
												<cf:select id="assessmentType1" path="assessmentType" class="form-control">
														
													<%-- <cf:options items="${listAssessmentType}" itemLabel="assessmentType"
														itemValue="assessmentType" /> --%>
														<cf:options items="${listAssessmentType}" />
												</cf:select>
											</div>

										</div>
										
										<div class="col-md-6 col-xs-12">
											<!-- right side -->
											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>trainingName:</strong></li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> <%-- ${created } --%></li>
													</ul>
												</div>
												<cf:select id="trainingName1" path="trainingName"
													class="form-control">
												
													<ct:forEach var="twofields" items="${listmanageTraining}">
														<cf:option value="${twofields.trainingName}">
															<ct:out
																value="${twofields.trainingName} - ${twofields.trainingName}" />
														</cf:option>
													</ct:forEach>
												</cf:select>
											</div>
										</div>
										<!-- rigth side ends -->
										<!-- button -->
										<div class="row">
											<div class="col-md-6 col-xs-12"></div>

											<div class="col-md-6 col-xs-12">
												<input type="button" onclick="fotestGetQuestions();"
													class="btn login-btn" value="Get Content">
											</div>
										</div>

									</div>


								</div>
							</div>

							<!-- search Results -->
							<div class="col-xs-12">

								<!-- table -->
								<div class="row">

									<!-- question list -->
									<div class="col-xs-12 table-overflow-responsive">

										<fieldset>
											<legend>Question List</legend>

											<table id="newTable"
												class="table table-responsive table-bordered table-hover">
												<thead>

													<tr class="background-open-vacancies">
														<!--                                                                <th class="text-center"><input type="checkbox"> </th>
                                                                <th>Course Code</th>
                                                                <th>Question Number</th>
  -->
													</tr>

												</thead>

												<tbody>
												</tbody>
											</table>

										</fieldset>
										
											 
								<div class="col-xs-12 table-overflow-responsive">
                                            <fieldset>
                                                <legend>Add/ Modify Questions</legend>
                                                
                                                <!-- left side -->
                                                <div class="col-md-6 col-xs-12">
                                                    
                                                 <div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>assessmentType:</strong></li>

														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> <%--  ${created } --%></li>
													</ul>
												</div>
												<cf:select id="assessmentType2" path="assessmentType" class="form-control">
														
													<%-- <cf:options items="${listAssessmentType}" itemLabel="assessmentType"
														itemValue="assessmentType" /> --%>
														<cf:options items="${listAssessmentType}" />
												</cf:select>
											</div>
                                                    
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Question No:</strong></li>
                                                                  <li id="questionNumberErr" style="display:none;" class="style-li error-red" > Enter Question number</li>
                                            
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                      <cf:input path="questionNumber" class="form-control" placeholder="Question Number" />
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Question Title:</strong></li>
                                                                  <li id="questionTitleErr" style="display:none;" class="style-li error-red" > Enter Question Title</li>
                                            
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                      <cf:input path="questionTitle" class="form-control" placeholder="Question Title" />
                                                    </div>
                                                    
                                                    
                                                    
                                                    
                                                </div>
                                                
                                                <!-- right side -->
                                                <div class="col-md-6 col-xs-12">
                                               <div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>trainingName:</strong></li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> <%-- ${created } --%></li>
													</ul>
												</div>
												<cf:select id="trainingName2" path="trainingName"
													class="form-control">
													
													<ct:forEach var="twofields" items="${listmanageTraining}">
														<cf:option value="${twofields.trainingName}">
															<ct:out
																value="${twofields.trainingName} - ${twofields.trainingName}" />
														</cf:option>
													</ct:forEach>
												</cf:select>
											</div>
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Help Text:</strong></li>
                                                                <li id="questionHintErr" style="display:none;" class="style-li error-red" > Enter Help Text</li>
                                               
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                        <cf:input path="questionHint" class="form-control" placeholder="Help Text" />
                                                    </div>     
                                                    
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Number of Options:</strong></li>
                                                                <li id="noOfAssessmentQuesErr" style="display:none;" class="style-li error-red" >Select number of options</li>
                                                                
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                        <cf:select id="noOfAssessmentQues" onchange="generateAnsSeq();" path="noOfOption" class="form-control">
                                                            <cf:option value="-1" label="Please Select" />
                                                            <cf:option value="1" label="1" />
                                                             <cf:option value="2" label="2" />
                                                             <cf:option value="3" label="3" />
                                                              <cf:option value="4" label="4" />
                                                               <cf:option value="5" label="5" />
                                                                <cf:option value="6" label="6" />
                                                        </cf:select>
                                                    </div>     
                                                    
                                                </div>
                                                
                                                    <br />
                                                    <br />
                                                <div class="col-md-6 col-xs-12">
                                                 <fieldset>  <legend><h3>Options</h3></legend>
                                                    <div id="assAnsTableErr" style="display:none;" class="style-li error-red" >Fill all the options</div>
                                                                
                                                    <table id="assAnsTable" class="table table-bordered table-responsive">
                                                <!--     <thead>
                                                        <tr class="background-open-vacancies">
                                                            <th>S.No.</th>
                                                            <th>Options</th>
                                                        </tr>
                                                    </thead> -->
                                                    <tbody></tbody>
                                                </table>
                                                    </fieldset>
                                                    <br />
                                                    <br />
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Answer Number:</strong></li>
                                                                  <li id="correctAnswerErr" style="disp	lay:none;" class="style-li error-red" >Invalid Answer number</li>
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                        <cf:input id="correctAnswer" path="correctAnswer" onblur="answerno(this.id,this.value);" onkeyup="allnumeric(this.id,this.value);" class="form-control" placeholder="Answer Number" />
                                                        
                                                    </div>
                                                    <cf:input type="hidden" path="id" class="form-control"/>
                                                    <!-- <button onclick="return validateFields();" class="btn login-btn pull-right">Save</button>
                                                     --> <button  class="btn login-btn pull-right">Save</button>
                                                </div> 
                                                
                                                <div class="col-md-6 col-xs-12">
                                                  
                                                
                                                </div>
                                            </fieldset>
                                            <br><br>
                                        </div>
										
									</div>






								</div>
							</div>
							

						</div>
						<!-- row ends -->
					</div>
				</div>
			</div>
		</div>
	</section>


</cf:form>
<script type="text/javascript">

function fotestGetQuestions(){
	
	var assessmentTypeSearch =  $("#assessmentType1").val();
	var trainingNameSearch =  $("#trainingName1").val();
	var total = "assessmentTypeSearch="+assessmentTypeSearch+"-trainingNameSearch="+trainingNameSearch;
	var result="";
	alert(total);
	var name1=JSON.stringify({
		courseType:0
  })
	$.ajax({
	type: 'post',
	url: 'fotestGetQuestions.fssai?data='+ total,
	 contentType : "application/json",
	 data:name1,
	async: false, 
	success: function (data){
	$('#newTable').show();
	var mainData1 = jQuery.parseJSON(data);
	var j=1;
	$('#newTable tr').remove();
	$('#newTable').append('<tr  class="background-open-vacancies"><th>S.No.</th><th>Training Name</th><th>Assessment Type</th></tr>')
	 $.each(mainData1 , function(i , obj)
	{
		$('#newTable').append('<tr id="tableRow"><td>'+j++ +'</td><td><a href="" onClick="return editAssessmentQuestion('+obj[0].getAssessmentType+')">'+obj[0]+'</a></td><td>'+obj[1]+'</td></tr>');
		
	}); 
	}
	});
return result;
}


function OnStart(){
	document.getElementById('id').value = 0;
	/* document.getElementById('unitCode').value = 0;
	document.getElementById('moduleCode').value = 0; */
	document.getElementById('questionNumber').value = '';
	document.getElementById('questionHint').value = '';
	document.getElementById('questionTitle').value = '';
	document.getElementById('noOfAssessmentQues').value = 0;
	document.getElementById('correctAnswer').value = '';

	}
	window.onload = OnStart;

	function fotestEditAssessmentQuestion(id){
		var result="";
		$.ajax({
		type: 'post',
		url: 'fotestGetSingleAssessmentQuestions.jspp?'+ id,
		async: false, 
		success: function (data){
		var mainData1 = jQuery.parseJSON(data);
		$.each(mainData1 , function(i , obj)
		{
			document.getElementById('id').value = obj[0];
			document.getElementById('trainingName').value = obj[1];
			$("#unitCode").trigger("change");
			window.setTimeout(function(){
				document.getElementById('assessmentType').value = obj[2];
		    }, 3000);
			document.getElementById('questionNumber').value = obj[3];
			document.getElementById('questionHint').value = obj[4];
			document.getElementById('questionTitle').value = obj[5];
			document.getElementById('noOfAssessmentQues').value = obj[6];
			$("#noOfAssessmentQues").trigger("change");
			window.setTimeout(function(){
				for(j=1;j<=obj[6];j++){
					if(j==1){
						document.getElementById('optionOne').value = obj[8];
					}else if(j==2){
						document.getElementById('optionTwo').value = obj[9];
					}else if(j==3){
						document.getElementById('optionThree').value = obj[10];
					}else if(j==4){
						document.getElementById('optionFour').value = obj[11];
					}else if(j==5){
						document.getElementById('optionFive').value = obj[12];
					}else if(j==6){
						document.getElementById('optionSix').value = obj[13];
					}
				}
		    }, 1000);
			document.getElementById('correctAnswer').value = obj[7];
		});
		}
		});
		return false;
	}


</script>
