<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>


<!--  <script>
	function OnStart() {
		var isUpdate = '${isUpdate}';
		alert("isUpdate "+isUpdate);
		if(isUpdate !=null &&isUpdate == 'Y' )
			{
			$("#firstName").val('');
			$("#lastName").val('');
			$("#middleName").val('');
			$("#email").val(''); 
			}		
		$("#createbtn").val("Update");
	}
	window.onload = OnStart;
    
</script>  -->
 


<ct:url var="addAction" value="/stateadminadd.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="stateAdminForm" onsubmit="return validateFields();">

	<!-- main body -->
	<section>
		<div class="container">
			<div class="row mar-top-aadhar">
				<div class="col-md-1 col-xs-12"></div>

				<div class="col-md-10  col-xs-12">
					<h3 class="text-capitalize heading-3-padding">State Admin
						Registration Form</h3>

					

						<!-- personal information -->
						<fieldset>
							<legend>Personal Information</legend>

							<!-- form field starts here -->
	
											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>First Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="firstNameErr" style="display: none;"
																class="style-li error-red">First Name should not
																be blank.</li>

														</ul>
													</div>
													<cf:input path="firstName" placeholder="First Name"
														class="form-control" />

												</div>

												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Middle Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="middleNameErr" style="display: none;"
																class="style-li error-red">Middle Name should not
																be blank.</li>

														</ul>
													</div>
													<cf:input path="middleName" placeholder="Middle Name"
														class="form-control" />

												</div>

												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Last Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="LastNameErr" style="display: none;"
																class="style-li error-red">Last Name should not be
																blank.</li>

														</ul>
													</div>
													<cf:input path="lastName" placeholder="Last Name"
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
																<li class="style-li"><strong>Aadhar
																		Number:</strong></li>
																<li class="style-li error-red"><cf:errors
																		path="aadharNumber" cssClass="error" /></li>
															</ul>
														</div>
														<cf:input path="aadharNumber" maxlength="12"
															onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
															placeholder="Aadhar Number" class="form-control"
															required="required" />
													</div>

													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong>Email:</strong></li>
																<li class="style-li error-red">*</li>
																<!--  valid -->
																<li id="EmailErr" style="display: none;"
																	class="style-li error-red">Email can not be
																	blank.</li>

															</ul>
														</div>

														<cf:input type="text" path="email" class="form-control"
															placeholder="Email" onblur="emailVal(this.id,this.value)"
															required="" />
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

							
							

							<!-- search div ends -->

						
						<!-- row ends -->

					
	</section>
	<input type="hidden" id="idH" value="" />
</cf:form>
<script>
             
                 
                 
                 function validateFields(){
                	$("#firstNameErr").css("display" , "none");
                	$("#MiddleNameErr").css("display" , "none");
                	$("#LastNameErr").css("display" , "none");
                	$("#EmailErr").css("display" , "none");
                	
                	if($("#firstName").val() == 0){
					$("#firstNameErr").css("display" , "block");
					return false;
					}
					if($("#middleName").val() == 0){
					 
					$("#middleNameErr").css("display" , "block");
					return false;
					}
					if($("#lastName").val() == 0){
					 
					$("#LastNameErr").css("display" , "block");
					return false;
					}
					if($("#email").val() == 0){
		 
					$("#EmailErr").css("display" , "block");
					return false;
					}
              }  
                </script>
              
