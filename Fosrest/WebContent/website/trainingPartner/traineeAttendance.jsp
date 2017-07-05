<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="website/js/commonController.js"></script>
<script>
function markTraineeAttendance(){
	
	/* $("#batchCodeErr").css("display", "none"); 
	$("#traineeUniqueCodeErr").css("display", "none"); 
	 */
	
	var batchCode = $("#batchCode").val();
	var rollNo = $("#traineeUniqueCode").val();
	//alert(rollNo);
	if(batchCode == 0){
		alert("Select Batch Code");

		//$("#batchCodeErr").css("display", "block"); 
		$("#batchCode").focus(); 
 
		
		return false;
	}
	
	if(rollNo == 0){
		alert("Select Trainee Roll Number");
				//$("#traineeUniqueCodeErr").css("display", "block"); 
				$("#traineeUniqueCode").focus(); 
		
		return false;
	}else{
		console.log("else "+rollNo );
		var name1=JSON.stringify({
			courseName:0
	  })

    		$.ajax({
    		      type: 'post',
    		      url: "markTraineeAttendance.fssai?data="+rollNo,
    		      contentType : "application/json",
    		      data:name1,
    		      async:false,
    		      success: function (response) {
    		    	  alert(response);
    		    
    		    	 getCourseEnrolledDetails(rollNo);
    		    	 $('#attendance_status').html(response);
    		    	 $("#traineeUniqueCode").val("");
    		      } 
    		      });
	}
}


function getCourseEnrolledDetails(rollNo){

		var name1=JSON.stringify({
			courseName:0
	  })

    		$.ajax({
    		      type: 'post',
    		      url: "getAttendanceDeatils.fssai?data="+rollNo,
    		      contentType : "application/json",
    		      data:name1,
    		      async:false,
    		      success: function (response) {
    		  		$('#newTable').show();
    		  		$('#newTable1').show();
    				var mainData1 = jQuery.parseJSON(response);
    				var j=1;
    				$('#newTable tr').remove();
    				$('#newTable1 tr').remove();
    				var traineeId = "";
    				var courseCode = "";
    				var courseName = "";
    				var batchCode = "";
    				var trainingStartDate = "";
    				var trainingEndDate = "";
    				var j=1;
    				$.each(mainData1 , function(i , obj)
    				{
    					traineeId = obj[0];
    					batchCode = obj[1];
    					trainingStartDate = obj[2];
    					trainingEndDate = obj[3];
    					attendance = obj[4];
    					
    					$('#newTable1').append('<tr id="tableRow"><td>'+j++ +'</td><td>'+attendance+'</td></tr>');	 
    				});
    				$('#newTable').append('<tr id="tableRow"><td>'+traineeId+'</td><td>'+batchCode+'</td><td>'+trainingStartDate+'</td><td>'+trainingEndDate+'</td></tr>');
    				
    				
    		      }
    		      });
	
}


</script>

<section>
  
 <%@include file="../roles/top-menu.jsp"%>
</section>
<cf:form name="myForm"  commandName="traineeAttendanceForm"  >
        <!-- main body -->
        <section class="main-section-margin-top">
            <div class="container-fluid">
                <div id="wrapper">

                    <!-- Sidebar -->
                      <!-- Sidebar -->
<%@include file="../roles/slider.jsp" %>
                    <!-- /#sidebar-wrapper -->
                    <!-- Page Content -->
                    <div id="page-content-wrapper">
                        <div class="container-fluid">

                            <!-- vertical button -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle">
                                        <i class="fa fa-bars"></i> <span class="orange-font">Welcome : ${userName}</span> 
                                    </a>
                                </div>
                            </div>

                            <!-- add the content here for main body -->
                            <!-- timeline  -->
                            <div class="container-fluid">
                                <div class="row">

                                    <!-- search and apply vacancies -->
                                    <div class="col-xs-12">
                                        <fieldset>
                                        <legend><h3>Mark Course Attendance</h3></legend>
                                      
                                        
                                        <div class="row">
                                            <div class="col-xs-12">

                                                <!-- left side -->
                                                <div class="col-md-6 col-xs-12">
                                                <div class="form-group">
														<div>
															<ul class="lab-no"> 
																<li class="style-li"><strong>Batch Code:<span style="color: red;">*</span>
																</strong></li>
																<li id="batchCodeErr" style="display: none;"
																	class="style-li error-red">Select BatchCode.</li>
																
	
															</ul>
														</div>
											 <cf:select path="batchCode" class="form-control" onchange="getRollNo(this.value,'traineeUniqueCode'); return false;"> 
												<cf:option value="0">Select Batch Code</cf:option> 
												<ct:forEach items="${listBatchCode }" var="bCode">	
												<cf:option value="${bCode }" label="${bCode }"> ${bCode} </cf:option>  
												</ct:forEach>
														</cf:select>
													</div> 
													
                                                
                                                
													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong>Trainee
																		Roll No:<span style="color: red;">*</span>
																</strong></li>
																<li class="style-li error-red"><span id="attendance_status">
											<label id="AadharNumberError" class="error visibility">*
												enter trainee Roll No</label> <cf:errors path="traineeUniqueCode"
												cssclass="error" /></li>
													<li id="traineeUniqueCodeErr" style="display: none;"
																	class="style-li error-red">Select Trainee Roll No.</li>
												
	
															</ul> 
														</div>
														  <cf:select path="traineeUniqueCode" class="form-control" > 
														  	<cf:option value="0">Select Roll No</cf:option> 
												<ct:forEach items="${listRollNo }" var="rollNo">	
												<cf:option value="${rollNo }" label="${rollNo }"> ${rollNo} </cf:option>  
												</ct:forEach>
														</cf:select>	
															
														
													</div>


                                                </div>

                                                <!-- right side -->
                                                <div class="col-md-6 col-xs-12" style="right: 273px;top: 27px;">
                                                  <button class="btn login-btn pull-right show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" onclick="markTraineeAttendance();return false;" >Mark Attendance</button>
                                                 
                              
                                                </div>
                                               
                                            </div>

                                            <div class="col-md-3 hidden-xs"></div>
                                        </div>
                                        </fieldset>


                                    </div>

							

							</div>
                            </div>
                        </div>
                    </div>
                				
				<div class="row">
                  <div class="col-xs-12">
                    <fieldset style="margin-top: 20px;">
                      <legend>
                      <h4>Trainee Attendance Details</h4>
                      </legend>
                      <div id="dvData">
                      <table  class="table table-bordered table-responsive table-striped table-hover">
                        <thead>
                          <tr class="background-open-vacancies">
                            <th>Trainee ID</th>
                            <th>Batch Code</th>
                            
                            <th>Training Start Date</th>
                            <th>Training End Date</th>
                          
                          </tr>
                        </thead>
                        <tbody id="newTable">
                        </tbody>
                      </table>
                      </div>
                    </fieldset>
                  </div>
                </div>
								
				<div class="row">
                  <div class="col-xs-12">
                    <fieldset style="margin-top: 20px;">
                      <legend>
                      <h4>Training Attended Days</h4>
                      </legend>
                      <div id="dvData">
                      <table  class="table table-bordered table-responsive table-striped table-hover">
                        <thead>
                          <tr class="background-open-vacancies">
                            <th>SR No</th> 
                           
                            <th>Attendance Date</th>

                          </tr>
                        </thead>
                        <tbody id="newTable1">
                        </tbody>
                      </table>
                      </div>
                    </fieldset>
                  </div>
                </div>			
								
                </div>
            </div>
        </section>
        
        
</cf:form>

