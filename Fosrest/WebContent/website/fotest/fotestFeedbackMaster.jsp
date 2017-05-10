<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="website/js/jquery-toaster/jquery.toaster.js"></script>



<%-- <ct:url var="addAction" value="/fotestfeedbackMasteradd"></ct:url> --%>
<cf:form action="fotestfeedbackMasteradd.fssai" name="myForm"
	method="POST" commandName="FotestFeedbackMasterForm"
	onsubmit="return validateFields();">

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
									class="orange-font">Welcome Admin</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>
									Feedback Master <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Feedback Master</legend>
											<cf:input path="id" type="hidden" />

											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>User Type: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="userTypeErr" style="display: none;"
																class="style-li error-red">User Type should not be
																blank.</li>

														</ul>
													</div>

													<cf:select path="userType" class="form-control">
														<cf:option value="" label="Select userType" />
														<cf:options items="${userTypeMap}" />
													</cf:select>
												</div>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Feedback
																	Category: <span style="color: red;">*</span>

															</strong></li>
															<li id="feedbackCategoryErr" style="display: none;"
																class="style-li error-red">Feedback Category should
																not be blank.</li>

														</ul>
													</div>

													<cf:select path="feedbackCategory" class="form-control">
														<cf:option value="" label="Select feedbackCategory" />
														<cf:options items="${feedbackCategoryMap}" />
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
																<li class="style-li"><strong>feedback:</strong></li>
																<li class="style-li error-red"></li>
																<li id="feedbackErr" style="display: none;"
																	class="style-li error-red">Feedback should not be
																	blank.</li>
															</ul>
														</div>
														<cf:input path="feedback" placeholder="feedbackCategory"
															class="form-control" />

													</div>
													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong> Status:</strong></li>
																<li class="style-li error-red"></li>
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
											<legend>Feedback Master</legend>
											<ct:if test="${!empty listFotestFeedbackMaster}">
												<table id="datatablesfosrest"
													class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>User Type</th>
															<th>Feedback Category</th>
															<th>Feedback</th>
															<th>Status</th>
															<th>Edit</th>
															<th>Delete</th>
														</tr>
													</thead>

													<ct:forEach items="${listFotestFeedbackMaster}"
														var="FotestFeedbackMaster" varStatus="loop">

														<tr>
															<td>${loop.count}</td>
															<td>${FotestFeedbackMaster.userType}</td>
															<td>${FotestFeedbackMaster.feedbackCategory}</td>
															<td>${FotestFeedbackMaster.feedback}</td>
															<td>${FotestFeedbackMaster.status}</td>
															<td><button
																	onclick='editFeedback(${FotestFeedbackMaster.id});return false;'>Edit</button>
															</td>
															<!-- /feedbackMaster/remove/ -->
															<td><a
																href="<ct:url value='/FotestFeedbackMasterRemove/${FotestFeedbackMaster.id}.fssai' />">Delete</a></td>
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
</body>
</html>
<script>
function editFeedback(id){
                    var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'fotestFeedbackMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#id").val(mainData1.id);
            	    $("#userType").val(mainData1.userType);
            	    $("#feedbackCategory").val(mainData1.feedbackCategory);
            	    $("#feedback").val(mainData1.feedback);
            	    $("#status").val(mainData1.status);
            	     $("#updatebtn").css("display" , "block");
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                }
                
function validateFields(){
    if($("#userType").val() == 0){
 		 $("#userTypeErr").css("display" , "block");
  		return false; 
 	 }
  	if($("#feedback").val() == ''){
		 $("#feedbackErr").css("display" , "block");
 		return false; 
	 }
	if($("#feedbackCategory").val() == 0){
		 $("#feedbackCategoryErr").css("display" , "block");
		return false; 
	 }
}
 </script>