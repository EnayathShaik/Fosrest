<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<!-- <head> -->

 <script src="website/js/commonController.js"></script>
 <script>
 
 function AvoidSpace(event) {
	    var k = event ? event.which : window.event.keyCode;
	    if (k == 32) return false;
	}
 
 
 function getTPName(){
		
		var TPName = $("#trainingPartnerName option:selected").text();
		TPName = TPName.substring(0,3).toUpperCase();
		console.log(" TPName  "+TPName);
		$("#tpName").val(TPName);
		
	}

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

	 
	<cf:form action="PersonalInformationTrainingInstituteAdd.fssai" name="myForm" method="POST"
		commandName="PersonalInformationTrainingInstitute">

  <section>
        <div class="container">
            <div class="row mar-top-aadhar">
                <div class="col-md-1 col-xs-12"></div>

                <div class="col-md-10  col-xs-12">
                    <h3 class="text-capitalize heading-3-padding">Training Institute Registration Form</h3>

                    <form>

                             <!-- personal information -->
                        <fieldset>
                            <legend>
                                Personal Information</legend>
                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">
                     
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Center Name:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="trainingCenterName" class="form-control" placeholder="Training Center Name" required=""/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Partner Name:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                  	<cf:select path="trainingPartnerName" class="form-control" onchange="getTPName()">
													<cf:option value="0" label="Select Training Partner" />
													<cf:options items="${listTrainingPartner}" itemValue="trainingPartnerId" itemLabel="trainingPartnerName" />
												</cf:select>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>PAN:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div> 
                                    <cf:input type="text" path="pan" class="form-control" placeholder="PAN" onkeypress="return AvoidSpace(event)"  
                                    onKeyUP="this.value = this.value.toUpperCase();" 
														onblur="pan_validate(this.id,this.value);"/>
                                </div>
                            </div>
                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Title:(Training Center Head)</strong></li>
                                            <li class="style-li error-red"> </li>
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
                                            <li class="style-li"><strong>First Name:(Training Center Head) </strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" class="form-control" path="firstName" placeholder="First Name" required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Middle Name:(Training Center Head)</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="middleName" class="form-control" placeholder="Middle Name" required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Last Name:(Training Center Head)</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="lastName" class="form-control" placeholder="Last Name" required=""/>
                                </div>
                            </div>
                            <!-- personal information ends -->
                        </fieldset>




                        <!-- contact Address -->
                        <fieldset>
                            <legend>
                                Contact Details</legend>
                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Center Address Line 1:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress1" class="form-control" placeholder="Training Center Line 1" required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Center Address Line 2:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress2" class="form-control" placeholder="Training Center Line 2" required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>State:</strong></li>
                                            <li class="style-li error-red"> </li>
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
                                            <li class="style-li"><strong>District:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                     <cf:select path="correspondenceDistrict" class="form-control">
                                        <cf:option value="Gbd" label="Ghaziabad" />
                                         <cf:option value="lkn" label="Lucknow" />
                                    </cf:select>
                                </div>
                            </div>
                            <!-- left side ends -->
                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">


                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Closest City:</strong></li>
                                            <li class="style-li error-red"> </li>
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
                                            <li class="style-li"><strong>PIN Code:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondencePincode" class="form-control" placeholder="Pincode" required=""/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Email:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="Email" class="form-control" placeholder="Email" required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Mobile:</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="mobile" class="form-control" placeholder="Mobile" required=""/>
                                </div>
                                <!-- right side ends -->
                            </div>
                        </fieldset>
                        <!-- contact address ends -->



                        <!-- Training center -->

                        <fieldset>
                            <legend>
                                Training Center Details</legend>
                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="col-xs-12 remove-padding">

                                    <div class="col-md-7 col-xs-12 remove-padding">
                                        <div class="form-group">
                                            <div>
                                                <ul class="lab-no">
                                                    <li class="style-li"><strong>Type of Training Conducted</strong></li>
                                                    <li class="style-li error-red"> </li>
                                                </ul>
                                            </div>
                                           <cf:select path="trainingType" class="form-control">
													<cf:option value="" label="Select Training Type" />
													<cf:options items="${trainingTypeMap}" />
												</cf:select>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-md-offset-1 col-xs-12 remove-padding">
                                        <div class="form-group">
                                            <div>
                                                <ul class="lab-no">
                                                    <li class="style-li"><strong>User Type</strong></li>
                                                    <li class="style-li error-red"> </li>
                                                </ul>
                                            </div>
                                           <cf:select path="userType" class="form-control">
													<cf:option value="" label="Select User Type" />
													<cf:options items="${userType}" />
												</cf:select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Seating capacity Per session?</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="seatingCapacity" class="form-control" placeholder="Number of Seats"/>
                                </div>
                                <div class="form-group">
                                    <label>Availability of TV/ Projector in training center ?</label>
                                    <br>
                                    <label class="radio-inline">
                                        <cf:radiobutton path="availableTVProjector" name="optradio"/> Yes </label>
                                    <label class="radio-inline">
                                        <cf:radiobutton  path="availableTVProjector" name="optradio"/> No </label>
                                </div>
                                <div class="form-group">
                                    <label>Availability of in-house trainers in food safety ?</label>
                                    <br>
                                    <label class="radio-inline">
                                        <cf:radiobutton  path="availableInHouseTrainer" name="optradio"/> Yes </label>
                                    <label class="radio-inline">
                                        <cf:radiobutton  path="availableInHouseTrainer" name="optradio"/> No </label>
                                </div>
                            </div>
                            <!-- left side ends -->
                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Number of in-house trainers ?</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="noOfInHouseTrainer" placeholder="Number of trainers" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Numbe of years in Business of training ?</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="noOfYearExp" placeholder="Number of years" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>How many training (4hrs) sessions wish to conduct in a month ?</strong></li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="sessWishToConduct" placeholder="Number of trainers" class="form-control"/>
                                    <cf:input type="hidden" path="tpName" />
                                    
                                </div>
                            </div>
                            <!-- right side ends -->
                        </fieldset>
<!-- Experience end -->

                        <!-- captcha -->
                        
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
	
	