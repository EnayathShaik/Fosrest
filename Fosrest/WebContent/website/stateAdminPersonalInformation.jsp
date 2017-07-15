<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="website/js/jquery-2.1.0.min.js"></script>


 <script src="website/js/commonController.js"></script>
<script>
function OnStart() {
var isUpdate = '${isUpdate}';
if (isUpdate != null && isUpdate == "Y") {
	$("#id").val('${StateAdmin.id}');
	$("#firstName").val('${StateAdmin.firstName}');
	$("#middleName").val('${StateAdmin.middleName}');
	$("#lastName").val('${StateAdmin.lastName}');
	$("#address1").val('${StateAdmin.address1}');
	$("#address2").val('${StateAdmin.address2}');
	$("#aadharNumber").val('${StateAdmin.aadharNumber}');
	$("#empID").val('${StateAdmin.empID}');
	$("#email").val('${StateAdmin.email}');
	$("#state").val('${StateAdmin.state}');
	
	$("#pincode").val('${StateAdmin.pincode}');
	$("#title").val('${StateAdmin.title}');
	$("#mobileNo").val('${StateAdmin.mobileNo}');
	$("#landLine").val('${StateAdmin.landLine}');
	$("#designation").val('${StateAdmin.designation}');
	//$("#createbtn").val("Update");
	 $("#updatebtn").css("display" , "block");
 	$("#createbtn").css("display" , "none");
	 document.getElementById("state").disabled=true;
	//document.getElementById("state").readOnly = true;
	}
}
window.onload = OnStart;
</script>

<ct:url var="addAction" value="/stateadminadd.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="stateAdminForm" onsubmit="return validateFields();">
 				<section>
                    <%@include file="/website/roles/top-menu.jsp"%>
                </section>
	<!-- main body -->
	<section class="main-section-margine-top">
		<div class="container-fluid">
		<div id="wrapper">
	
          <%@include file="/website/roles/slider.jsp" %>
              <div id="page-content-wrapper">
                     <div class="container-fluid">
                       <div class="row">
                        <cf:input type="hidden" path="id" />
                                            <div class="col-lg-12">
                                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome ${userName}</span>
                                                </a>
                                            </div>
                                        </div> 
                                         <div class="row">

                                            <div class="col-xs-12">  
			
					
					<h3 class="text-capitalize heading-3-padding" style="margin-top: 99px;">State Admin
						Registration Form</h3>

					
                                         <div class="row">
                                                    <div class="col-xs-12">
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
																<%-- <li class="style-li error-red"><cf:errors
																		path="aadharNumber" cssClass="error" /></li> --%>
																		<li id="aadharNumberErr" style="display: none;"
																	class="style-li error-red">Aadhar No. can not be
																	blank.</li>
																	<li id="aadharNumberErr2" style="display: none;"
																	class="style-li error-red">Aadhar No. should be 12 digit</li>
															</ul>
														</div>
														<cf:input path="aadharNumber" maxlength="12"
															onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
															placeholder="Aadhar Number" class="form-control"
															 />
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
															placeholder="Email" onblur="emailVal(this.id,this.value); return false;" 
															required="" />
													</div>
														<div class="form-group">
				                                    <div>
				                                        <ul class="lab-no">
				                                            <li class="style-li"><strong>State:</strong></li><li class="style-li error-red"> * </li>
				                                            <!--  valid -->
				                                             <li id="stateErr" style="display:none;" class="style-li error-red" >correspondence State can not be blank.</li>
				                                             <li class="style-li error-red">
				                                              <span id="state_status" ></span></li>
				                                        </ul>
				                                    </div>
				                                    <cf:select id="state" path="state" class="form-control"  onblur="ck_state('StateAdmin');" >
				                                	<cf:option value="0" label="Select state Name" />
													<cf:options items="${listStateMaster}" itemValue="stateId" itemLabel="stateName"/>
				                                    </cf:select>
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
				                                            <li class="style-li"><strong>Title:</strong></li>
				                                            <li id="titleErr" style="display:none;" class="style-li error-red" > Title can not be blank.</li>
				                                             
				                                            <li class="style-li error-red"> *</li>
				                                        </ul>
				                                    </div>
				                                   <cf:select path="title" class="form-control">
													<cf:option value="" label="Select Title" />
													<cf:options items="${titleMap}" />
												</cf:select>
                                                </div>

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
														class="form-control" onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')"/>

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
														class="form-control" onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')"/>

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
														class="form-control" onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')"/>

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
                                                    <cf:select path="designation" class="form-control">
													<cf:option value="" label="Select Designation" />
													<cf:options items="${DesignationList}" itemValue="designationName" itemLabel="designationName"/>
												</cf:select>
												</div>
												
															  <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Landline:</strong></li>
                                            <li id="landLineErr" style="display:none;" class="style-li error-red" > Landline cannot be blank</li>
                                          
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="landLine" class="form-control"  placeholder="landLine"  minlength="8"  maxlength="8"  required=""
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>

								  <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Mobile Number:</strong></li>
                                            <li id="mobileErr" style="display:none;" class="style-li error-red" > Mobile Number cannot be blank</li>
                                          
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="mobileNo" class="form-control" minlength="10" maxlength="10" placeholder="Mobile" required=""
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
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
							</div>
</div></div></div></div>
							
							

							<!-- search div ends -->

						
						<!-- row ends -->

					
	</section>
	<input type="hidden" id="idH" value="" />
	<cf:input type="hidden" id="stateName" path="stateName"  />
</cf:form>
<script>
             
                 
                 
                 function validateFields(){
                
               	
                		
   	             
                	 $("#titleErr").css("display" , "none");
                	$("#firstNameErr").css("display" , "none");
                	$("#middleNameErr").css("display" , "none");
                	$("#LastNameErr").css("display" , "none");
                	$("#EmailErr").css("display" , "none");
                	$("#empIdErr1").css("display" , "none");
                	$("#address1Err").css("display" , "none");
                	$("#address2Err").css("display" , "none");
                	$("#designationErr").css("display" , "none");
                	$("#stateErr").css("display" , "none");
                	$("#pincodeErr").css("display" , "none");
                	$("#stateErr").css("display" , "none");
                	$("#aadharNumberErr").css("display" , "none");
                	$("#aadharNumberErr2").css("display" , "none");
                	$("#mobileErr").css("display" , "none");
                	$("#landLineErr").css("display" , "none");
                	$("#empIDErr1").css("display" , "none");
                	/* 
                	if($("#empID").val() == 0){
    				$("#empIDErr1").css("display" , "block");
    				return false;
    				} */
                	if($("#aadharNumber").val()==0){
                		$("#aadharNumberErr").css("display" , "block");
                		  return false;
                	}
                	 if($("#aadharNumber").val().match(/^[0-9]{12}$/) == null){
                		 $("#aadharNumberErr2").css("display" , "block");
                 		 return false;
                   	 }
                	 if($("#email").val() == 0){
                   		 
     					$("#EmailErr").css("display" , "block");
     					return false;
     					}
                	 if($("#state").val() < 1 || $("#state").val()=='' ){ 
						 
 						alert("Select STATE");
 						return false;
 						}
                	 if($("#address1").val() == 0){
						  
 						$("#address1Err").css("display" , "block");
 						return false;
 						}
                	 if($("#pincode").val().match(/^[0-9]{6}$/) == null){
				  		 $("#pincodeErr").css("display" , "block");
				  		return false;
				  	 }
                	 if($("#title").val() == ''){
     					$("#titleErr").css("display" , "block");
     					return false;
     					}
                	if($("#firstName").val() == 0){
    					$("#firstNameErr").css("display" , "block");
    					return false;
    					}
                	/* if($("#middleName").val() == ''){
    					$("#middleNameErr").css("display" , "block");
    					return false;
    					} */
                	
                	if($("#lastName").val() == ''){
   					 
    					$("#LastNameErr").css("display" , "block");
    					return false;
    					}
                	
                	if($("#designation").val() == 0){
						 
						$("#designationErr").css("display" , "block");
						return false;
						}
    					

    					if($("#landLine").val() == 0){
    						$("#landLineErr").css("display" , "block");
    						return false;
    						}
    					/* if($("#address2").val() == 0){
    						 
    						$("#address2Err").css("display" , "block");
    						return false;
    						} */
    					if($("#mobileNo").val().match(/^[0-9]{10}$/) == null){
    				    	
   			      		 $("#mobileErr").css("display" , "block");
   			      		return false;
   			  	       }
    					
    			var el = document.getElementById('state');
   	               	 var text = el.options[el.selectedIndex].innerHTML;
   	               
   	            	 document.getElementById("stateName").value=text;
					
              }  
                </script>
              
