<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<!-- <head> -->

 <script src="website/js/commonController.js"></script>
 <script>
 


 function DrawCaptcha()
 {
     var a = Math.ceil(Math.random() * 7)+ '';
     var b = Math.ceil(Math.random() * 7)+ '';       
     var c = Math.ceil(Math.random() * 7)+ '';  
     var d = Math.ceil(Math.random() * 7)+ '';  
     var e = Math.ceil(Math.random() * 7)+ '';  
     var f = Math.ceil(Math.random() * 7)+ '';  
     var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f ;
     document.getElementById("txtCaptcha").value = code
 } 
 
 
 
 
 function OnStart(){
	 
	 var id = '${pwd}';
	 if(id !== ''){
		 alert("inside");
		 $("#success").css("display" , "block");
	 }
		DrawCaptcha();
		
		 flatpickr("#dob" ,{});	
		
	 		 
		 		$('#sameAddr').change(function(){
		 			
		 			if(this.checked){
		 				$("#resState").val($("#correspondenceState").val());
		 				$("#residentialDistrict").val($("#correspondenceDistrict").val());
		 				$("#resCity").val($("#correspondenceCity").val());
		 				$("#resPincode").val($("#correspondencePincode").val());
		 				$("#ResidentialLine1").val($("#correspondenceAddress1").val());
		 				$("#ResidentialLine2").val($("#correspondenceAddress2").val())
		 				//
		 			}else{
		 				$("#resState").val('');
		 				$("#residentialDistrict").val('');
		 				$("#resCity").val('');
		 				$("#resPincode").val('');
		 				$("#ResidentialLine1").val('');
		 				$("#ResidentialLine2").val('');
		 				
		 				
		 			}
		 		 
		 		  
		 		});
		 		 
		 	
		 
		 
	}
	window.onload = OnStart;
 </script>

<!-- <head> -->
<body>
<h3 style="display:none;" id="success" >
<strong>
You have been registered successfully !!!
</strong>
<br><br>
Your UserId is : ${id } and password is  : ${pwd}
</h3>
	 
	<cf:form action="PersonalInformationTraineeAdd.fssai" name="myForm" method="POST"
		commandName="PersonalInformationTrainee">

  <section>
        <div class="container">
            <div class="row mar-top-aadhar">
                <div class="col-md-1 col-xs-12"></div>

                <div class="col-md-10  col-xs-12">
                    <h3 class="text-capitalize heading-3-padding">Trainee Registration Form</h3>

                    <form>

                        <!-- personal information -->
                        <fieldset>
                            <legend>Personal Information</legend>

                            <!-- form field starts here -->



                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">



                                    
                                        <div class="form-group">
                                            <div>
                                                <ul class="lab-no">
                                                    <li class="style-li"><strong>User Type:</strong></li>
                                                    <li class="style-li error-red"> * </li>
                                                </ul>
                                            </div>
                                          	<cf:select path="userType" class="form-control">
													<cf:option value="" label="Select User Type" />
													<cf:options items="${userType}" />
												</cf:select>
                                        </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Aadhar Number:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="AadharNumber" class="form-control" maxlength="12" placeholder="Aadhar Number"
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
                                    />
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Emp Id:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="empID" class="form-control" placeholder="Emp ID"/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Date of Birth:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="dob" id="dob" name="dob" class="form-control"/>
                                </div>



                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Gender:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                   <cf:radiobutton
										path="gender" value="M" checked="true" />Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="gender" value="F" />Female
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Induction Training Completed:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                      
                                          <cf:radiobutton
										path="inductionTrainee" value="Y" checked="true" />Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="inductionTrainee" value="N" />No
                                </div>

                            </div>
                            <!-- left side ends -->

                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Title:</strong></li>
                                            <li class="style-li error-red"> * </li>
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
                                            <li class="style-li"><strong>First Name:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text"  path="firstName" class="form-control" placeholder="First Name"/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Middle Name:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="MiddleName" class="form-control" placeholder="Middle Name"/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Last Name:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="LastName" class="form-control" placeholder="Last Name"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Father's Name:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="FatherName" class="form-control" placeholder="Father's Name"/>
                                </div>



                            </div>
                            <!-- right side ends -->
                        </fieldset>




                        <!-- Correspondence Address -->
                        <fieldset>
                            <legend>Correspondence Address</legend>

                            <!-- form field starts here -->

                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Correspondence Address Line 1:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress1" class="form-control" placeholder="Address" required=""/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Correspondence Address Line 2:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress2" class="form-control" placeholder="Address" required=""/>
                                </div>




                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>State:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:select path="correspondenceState" class="form-control">
                                        <cf:option value="Rajasthan" label="Rajasthan" />
                                        <cf:option value="UP"  label="Uttar Pradesh"/>
                                        <cf:option value="MH" label="Maharashtra" />
                                    </cf:select>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Email:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="Email" class="form-control" placeholder="Email" required=""/>
                                </div>

                            </div>
                            <!-- left side ends -->

                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>District:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:select path="correspondenceDistrict" class="form-control">
                                        <cf:option value="Gbd" label="Ghaziabad" />
                                         <cf:option value="lkn" label="Lucknow" />
                                    </cf:select>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>City:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:select path="correspondenceCity" class="form-control">
                                       <cf:option value="jp" label="Jaipur" />
                                         <cf:option value="al" label="Alwar" />
                                    </cf:select>
                                </div>



                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Pin Code:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondencePincode" class="form-control" placeholder="Pin Code" required=""/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Mobile:</strong></li>
                                            <li class="style-li error-red"> * </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="mobile" class="form-control" placeholder="Mobile Number" required=""/>
                                </div>


                            </div>
                            <!-- right side ends -->
                        </fieldset>
                        <!-- Correspondence address ends -->


                        <!-- permanent Address -->
                        <fieldset>
                            <legend>Permanent Address</legend>

                            <!-- form field starts here -->

                            <div class="col-xs-12">
                                <label class="checkbox-inline">
                                    <input id="sameAddr" type="checkbox"/>Is your permanent address same as correspondence address. </label>

                            </div>

                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Permanent Address Line 1:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="ResidentialLine1" class="form-control" placeholder="Address" required=""/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Permanent Address Line 2:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="ResidentialLine2" class="form-control" placeholder="Address" required=""/>
                                </div>




                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>State:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                   <cf:select path="resState" class="form-control">
                                        <cf:option value="Rajasthan" label="Rajasthan" />
                                        <cf:option value="UP"  label="Uttar Pradesh"/>
                                        <cf:option value="MH" label="Maharashtra" />
                                    </cf:select>
                                </div>


                            </div>
                            <!-- left side ends -->

                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>District:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                   <cf:select path="residentialDistrict" class="form-control">
                                        <cf:option value="Gbd" label="Ghaziabad" />
                                         <cf:option value="lkn" label="Lucknow" />
                                    </cf:select>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>City:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                   <cf:select path="resCity" class="form-control">
                                       <cf:option value="jp" label="Jaipur" />
                                         <cf:option value="al" label="Alwar" />
                                    </cf:select>
                                </div>



                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Pin Code:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="resPincode" class="form-control" placeholder="Pin Code" required=""/>
                                </div>
                            </div>
                            <!-- right side ends -->
                        </fieldset>
                        <!-- Permanent address ends -->


                        <!-- captcha -->
                        <fieldset>
                            <div class="col-md-2 col-xs-12"></div>
                        <div
					style="width: 95%; margin-left: 32px; float: left; height: 100px; border: 1px solid #cecece;"
					class="form-group">
					<div style="float: left">
						<div style="float: left; width: 98%;">
							<label id="captchaError"
								style="float: left; width: 99%; font-family: Calibri; margin-left: 0px;">Please
								enter captcha in below textbox !!!</label>
						</div>

						<div style="float: left; width: 99%;">

							<input type="text" id="txtCaptcha"
								style="background-image: url(1.jpg); text-align: center; border: none; width: 140px; margin-left: 8px; font-weight: bold; font-family: Modern"
								disabled="disabled" /> <input type="button" id="btnrefresh"
								value="Refresh" onclick="DrawCaptcha();" /> <input type="text"
								id="txtInput" placeholder="Captcha" style="width: 140px;"/ >

						</div>
					</div>
					<div style="float: left; width: 99%;">
						<input type="checkbox" id="check" style="margin-left: 1%;">
						<!-- <a href="#" target="_blank" class="terms-font-size">  -->
						I have read and understood the Terms & Conditions and the Privacy
						Policy of FSSAI.
						<!-- </a> -->
					</div>
				</div>

                        <!-- button -->

                        <div class="row">
                            <div class="col-md-4 col-xs-12"></div>
                            <div class="col-md-4 col-xs-12">
                                <input type="submit"  style="width: 100%;" class="btn login-btn" value="Register"/>
                            </div>
                            <div class="col-md-4 col-xs-12"></div>
                        </div>



                    </form>
                    <!-- form ends -->

                    </d>


                    <div class="col-md-1 col-xs-12"></div>
                </div>
            </div>
    </section>


		<div class="col-md-2 hidden-xs"></div>
	</cf:form>
	
	