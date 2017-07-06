<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
   <script>
   
   
                function OnStart() {
                   
                	flatpickr("#trainingDate" , {
                		
                	});	
                }
                window.onload = OnStart;

            </script>
 
<cf:form action="stateadminsearchupdateresult.fssai" name="maForm" method="POST" commandName="UploadAssessmentForm" onsubmit="return validateFields();"> 

    <section>
         <%@include file="../roles/top-menu.jsp"%>
    </section>
    <!-- main body -->
    <section class="main-section-margin-top">
        <div class="container-fluid">
            <div id="wrapper">
                <!-- Sidebar -->
                <div > <%@include file="../roles/slider.jsp" %>
                </div>
                <!-- /#sidebar-wrapper -->
                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <!-- vertical button -->
                        <div class="row">
                            <div class="col-lg-12">
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Admin</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                        <div class="row">

                                <div class="col-xs-12">
                                    <h1>Update Result</h1>
                                     <fieldset>
                                           <legend>Update Result</legend>
                                    <div class="row">
                                        <div class="col-xs-12">

                                            <!-- left side -->
                                            <div class="col-xs-6">
                                                <div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>BatchCode:</strong></li>
														<li class="style-li error-red"><span id="name_status"
															class="clear-label"> </span> ${created }</li>
													</ul>
												</div>
										
												
												
												 
												
												
												
											 <cf:select path="trainingCalendarId" class="form-control" id="batchCodeid">
													<cf:option value="0" label="Select Batch Code" />
													<cf:options items="${batchCodeList}" itemLabel="batchCode" itemValue="trainingCalendarId" />
												</cf:select> 
											</div>
                                          
                                           </div> <!-- left side ends -->
                                              <div class="row">
                                                <div class="col-md-6 col-xs-12"></div>
                                                
                                                <div class="col-md-6 col-xs-12">

                                                    <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Search" style="margin-top: 26px;"/> 
                                               
                                                </div>
                                            </div>
<div class="row">
								<div class="col-xs-12">
									<fieldset>
										<legend>List of Trainee</legend>
										<ct:if test="${!empty listofTrainee}">
											<table class="table table-bordered table-responsive"
												id="testTable">
												<thead>
													<tr class="background-open-vacancies">

														<th>S.No.</th>
														<th>Roll No.</th> 
														<th>Trainee Name</th>
														<!-- <th>Marks</th>
														<th>Subjects</th>
														 <th>Upload</th>  -->



													</tr>
												</thead>
												  <ct:set var="count" value="0" scope="page" />
                                                <ct:set var="count" value="${count + 1}" scope="page"/>
												<ct:forEach items="${listofTrainee}" var="traineeList"
													varStatus="loop">
													<tr>
													<td>${loop.count}</td>
													<td><a href="#" onclick="searchByRollNo(${loop.index}); return false;">${traineeList[0]}</a></td>
													<cf:hidden path="logindetails" id="userId_${loop.index}"
																value="${traineeList[2]}" />
													<td>${traineeList[1]}</td>
											 </tr>
												</ct:forEach>

											</table>
											

									
								</div>
							</div>
							</ct:if>
							
                                            <!-- right side -->
                              </div>
     </div>
                                    <div class="row">
									<div class="col-xs-12 ">
										<fieldset>
											<legend>Information of Trainee</legend>
									<table class="table table-bordered table-responsive" id="newTable">
												  <thead>
                                                
                                                </thead>
										<tbody></tbody>
												</table>
										</fieldset>
									</div>
								</div>
                                </div>
   									<div class="col-md-6 col-xs-12">
										 <div class="form-group">
                                            <div>
                                                <ul class="lab-no">
                                                    <li class="style-li"><strong>Result:</strong></li> <li class="style-li error-red"> * </li>
                                                     <!--  valid -->
                                                            <li id="userTypeErr" style="display:none;" class="style-li error-red" >Trainee Type can not be blank.</li>
                                                   
                                                </ul>
                                            </div>
                                          	<cf:select path="result" class="form-control" id="resultid">
													<cf:option value="" label="Select Result" />
													<cf:options items="${result}"  />
												</cf:select>
                                        </div> 
                                        </div> 
                                        <div class="col-md-6 col-xs-12">
                                        <div class="row">
                                                <div class="col-md-6 col-xs-12"></div>
                                                
                                                <div class="col-md-6 col-xs-12">

                                                    <input type="button"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Save Result" style="margin-top: 26px;" onclick="uploadResult(); return false;"/> 
                                               
                                                </div>
                                            </div>
                                        </div> 
                               </fieldset>
                              
                                        </div>
                             <!-- search div ends -->
                        </div><!-- row ends -->
                    </div>
                </div>
            </div>
        
    </section>
 
 <input type="hidden" id="idHidden" value="" />
 <input type="hidden" id="hiddenCourseType" value="" />                                             
   </cf:form>
  <script>
 
   var id;
   var tid;
  function searchByRollNo(index){
	id=document.getElementById("userId_"+index).value;
	 tid=$("#batchCodeid").val();
	   var data=id+"-"+tid;
	 //  alert("DATAAAAAAA"+data);
	   var name1 = JSON.stringify({
			courseName : 0
		})
		$.ajax({
			type : 'post',
			url : 'searchByRollNo/'+data+'.fssai',
			contentType : "application/json",
			data : name1,
			success : function(response) {
				var mainData1 = jQuery.parseJSON(response);
			 	    $('#newTable tr').remove();
			 	 $('#newTable').append( '<tr  class="background-open-vacancies"><th>S.No.</th><th>Trainee Name</th><th>Subject</th><th>Marks</th></tr>')
			 	       var j = 1;
						 $.each(mainData1,function(i, obj) {$('#newTable').append(
						    		
			                               '<tr id="tableRow"><td>' + j++
			                               + '</td><td>' + obj[0] + '</td><td>' + obj[1] + '</td><td>' + obj[2] + '</td></tr>');
			                   });
			}
		});
	   $('#newTable').show();
	     return result;
	 }
function uploadResult(){
	 var result=$("#resultid").val();
	 if(result==0){
			alert("Please Select Result");
			return false;
		}
	  var data=id+"-"+tid+"-"+result;
	   alert("Result Uploaded");
	   var name1 = JSON.stringify({
			courseName : 0
		})
	  $.ajax({
			type : 'post',
			url : 'saveTraineeResult/'+data+'.fssai',
			contentType : "application/json",
			data : name1,
			success : function(response) {
				var mainData1 = jQuery.parseJSON(response);
			 	
			}
		}); 
	 
}
  
   </script> 