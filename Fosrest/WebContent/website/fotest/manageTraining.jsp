<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="website/js/jquery-toaster/jquery.toaster.js"></script>



<ct:url var="addAction" value="/manageTraining/add.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="manageTrainingForm" onsubmit="return validateFields();">

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
									class="orange-font">Welcome Fotest</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>
									Manage Training <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Manage Training</legend>
										<cf:input path="id" type="hidden" /> 

											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Training Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="trainingNameErr" style="display:none;" class="style-li error-red" > Training Name should not be blank.</li>

														</ul>
													</div>
													<cf:input path="trainingName" placeholder="Training Name"
														class="form-control" />
													
												</div>
												
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Module Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="moduleNameErr" style="display:none;" class="style-li error-red" > Module Name should not be blank.</li>

														</ul>
													</div>
													<cf:input path="moduleName" placeholder="Module Name"
														class="form-control" />
													
												</div>

											</div>
											<!-- right side -->
											<div class="row">

												<!-- left -->
												<div class="col-xs-6">

													<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Duration: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="durationErr" style="display:none;" class="style-li error-red" > duration should not be blank.</li>

														</ul>
													</div>
													<cf:input path="duration" placeholder="duration"
														class="form-control" />
													
												</div>
												
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong> Status:</strong></li>
															<!-- <li class="style-li error-red"></li> -->
															
														</ul>
													</div>
													<cf:select path="status" class="form-control">
														<cf:option value="A" label="Active" />
														<cf:option value="I" label="In-Active" />
													</cf:select>
												</div>


													<input type="submit" id="updatebtn"
														style="display: none; float: right; margin-right: 122px;"
														value="Update" class="btn login-btn" /> <input
														type="submit" id="createbtn" value="Create"
														class="btn login-btn" />
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
											<legend>Manage Training List</legend>
											<ct:if test="${!empty listmanageTraining}">
												<table border="1" id="datatablesfosrest" class="table table-bordered table-responsive">
													
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Training Name</th>
															<th>Module Name</th>
															<th>Duration</th>
															<th>Status</th>
															<th>Edit</th>
															<th>Delete</th>
														</tr>
													</thead>

													<ct:forEach items="${listmanageTraining}" var="manageTraining"
														varStatus="loop">

														<tr>
															<td>${loop.count}</td>
															<td>${manageTraining.trainingName}</td>
															<td>${manageTraining.moduleName}</td>
															<td>${manageTraining.duration}</td>
															<td>${manageTraining.status}</td>
															<td><button onclick='editTraining(${manageTraining.id});return false;' >Edit</button></td>
														<td><a href="<ct:url value='/manageTraining/remove/${manageTraining.id}.fssai' />" >Delete</a></td>
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
</cf:form>
  <script>
             /*    var id = localStorage.getItem('activeID');
                document.getElementById(id).className = "active";
                 */

function editTraining(id){

                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'manageTraining/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#id").val(mainData1.id);
            	    $("#trainingName").val(mainData1.trainingName);
            	    $("#moduleName").val(mainData1.moduleName);
            	    $("#duration").val(mainData1.duration);
        		    $("#status").val(mainData1.status);
            	    
        		    $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }
                 
                 
                 
                 function validateFields(){
                	 $("#trainingNameErr").css("display" , "none");
                	 $("#moduleNameErr").css("display" , "none");
                	 $("#durationErr").css("display" , "none");
                  	
                	 if($("#trainingName").val() == ''){
                 		 $("#trainingNameErr").css("display" , "block");
                  		return false; 
                 	 }
                  	if($("#moduleName").val() == 0){
                		 $("#moduleNameErr").css("display" , "block");
                 		return false; 
                	 }
                  	if($("#duration").val() == 0){
               		 $("#durationErr").css("display" , "block");
                		return false; 
               	 }
              } 
                </script>