<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>




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
				                                            <li class="style-li"><strong>Emp Id:</strong></li><li class="style-li error-red"> * </li>
				                                              <!--  valid -->
				                                            <li id="empIDErr1" style="display:none;" class="style-li error-red" >Emp Id can not be blank.</li>
				                                            
				                                        </ul>
				                                    </div>
                                             <cf:input type="text" path="empID" class="form-control" placeholder="Emp ID"/>
                                            </div>
                                            
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
												 <div class="form-group">
					                                    <div>
					                                        <ul class="lab-no">
					                                            <li class="style-li"><strong>Address Line 1:</strong></li> <li class="style-li error-red"> * </li>
					                                             <!--  valid -->
					                                             <li id="address1Err" style="display:none;" class="style-li error-red" > Address can not be blank.</li>
					                                           
					                                        </ul>
					                                    </div>
                                                     <cf:input type="text" path="address1" class="form-control" placeholder="Address" required=""/>
                                                  </div>
												<div class="form-group">
					                                    <div>
					                                        <ul class="lab-no">
					                                            <li class="style-li"><strong>Address Line 2:</strong></li> <li class="style-li error-red"> * </li>
					                                             <!--  valid -->
					                                             <li id="address2Err" style="display:none;" class="style-li error-red" > Address can not be blank.</li>
					                                           
					                                        </ul>
					                                    </div>
                                                     <cf:input type="text" path="address2" class="form-control" placeholder="Address" required=""/>
                                                  </div>
												 <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Pin Code:</strong></li> <li class="style-li error-red"> * </li>
                                           <!--  valid -->
                                            <li id="pincodeErr" style="display:none;" class="style-li error-red" >Pin code can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="pincode" class="form-control"  minlength="6"  maxlength="6" placeholder="Pin Code" 
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>

												

											</div>
											<!-- right side -->
											<div class="row">

												<!-- left -->
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
												<div class="form-group">
				                                    <div>
				                                        <ul class="lab-no">
				                                            <li class="style-li"><strong>State:</strong></li><li class="style-li error-red"> * </li>
				                                            <!--  valid -->
				                                             <li id="stateErr" style="display:none;" class="style-li error-red" >correspondence State can not be blank.</li>
				                                            
				                                        </ul>
				                                    </div>
				                                    <cf:select path="state" class="form-control" >
				                                	<cf:option value="0" label="Select state Name" />
													<cf:options items="${listStateMaster}" itemValue="stateId" itemLabel="stateName"/>
				                                    </cf:select>
                                               </div>
                                               <div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Designation: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="designationErr" style="display: none;"
																class="style-li error-red">designation should not
																be blank.</li>

														</ul>
													</div>
													<cf:input path="designation" placeholder="designation"
														class="form-control" />

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
                	$("#empIdErr1").css("display" , "none");
                	$("#address1Err").css("display" , "none");
                	$("#address2Err").css("display" , "none");
                	$("#designationErr").css("display" , "none");
                	$("#stateErr").css("display" , "none");
                	$("#pincodeErr").css("display" , "none");
                	
                	if($("#empID").val() == ''){
    				$("#empIDErr1").css("display" , "block");
    				return false;
    				}
                	if($("#firstName").val() == 0){
					$("#firstNameErr").css("display" , "block");
					return false;
					}
					if($("#middleName").val() == ''){
					 
					$("#middleNameErr").css("display" , "block");
					return false;
					}
					if($("#lastName").val() == ''){
					 
					$("#LastNameErr").css("display" , "block");
					return false;
					}
					if($("#email").val() == 0){
		 
					$("#EmailErr").css("display" , "block");
					return false;
					}
					if($("#address1").val() == 0){
						 
						$("#address1Err").css("display" , "block");
						return false;
						}
					if($("#address2").val() == 0){
						 
						$("#address2Err").css("display" , "block");
						return false;
						}
					if($("#state").val() == 0){
						 
						$("#stateErr").css("display" , "block");
						return false;
						}
					if($("#designation").val() == 0){
						 
						$("#designationErr").css("display" , "block");
						return false;
						}
					if($("#pincode").val() == 0){
						 
						$("#pincodeErr").css("display" , "block");
						return false;
						}
              }  
                </script>
              
