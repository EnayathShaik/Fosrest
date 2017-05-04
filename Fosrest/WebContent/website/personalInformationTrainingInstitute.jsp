<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<!-- <head> -->

 <script src="website/js/commonController.js"></script>
 <script>
 

 function validateFields(){
	 var isUpdate = '${isUpdate}';
	

	
	 $("#trainingCenterNameErr").css("display" , "none");
	 $("#trainingPartnerNameErr").css("display" , "none");
	 $("#titleErr").css("display" , "none");
	 $("#firstNameErr").css("display" , "none");
	 $("#middleNameErr").css("display" , "none");
	 $("#lastNameErr").css("display" , "none");
	 $("#correspondenceAddress1Err").css("display" , "none");
	/*  $("#correspondenceAddress2Err").css("display" , "none"); */
	 $("#correspondenceStateErr").css("display" , "none"); 
	 $("#correspondenceDistrictErr").css("display" , "none");
	 $("#correspondenceCityErr").css("display" , "none");
	 $("#correspondencePincodeErr").css("display" , "none");
	 $("#correspondencePincodeErr2").css("display" , "none");
	 $("#EmailErr").css("display" , "none");
	 $("#mobileErr").css("display" , "none");
	 $("#panErr").css("display" , "none");
	 $("#trainingTypeErr").css("display" , "none");
	 $("#userTypeErr").css("display" , "none");
	 
	 $("#txtInputErr").css("display" , "none"); 
	 
	 if($("#trainingCenterName").val() == ''){
		 
		$("#trainingCenterNameErr").css("display" , "block");
		return false;
	 } 
	  if($("#trainingPartnerName").val() == '0'){
		 
			$("#trainingPartnerNameErr").css("display" , "block");
		return false;
		 }
	
	   if($("#pan").val() == '')
	 {
		 $("#panErr").css("display" , "block");
		 return false; 
	 }
	 
	   if($("#title").val() == ''){
		 
			$("#titleErr").css("display" , "block");
			return false;
		 }
	  if($("#firstName").val() == ''){
		 
			$("#firstNameErr").css("display" , "block");
			return false;
		 }
	  if($("#middleName").val() == ''){
			 
			$("#middleNameErr").css("display" , "block");
			return false;
		 }
	  if($("#lastName").val() == ''){
		 
			$("#lastNameErr").css("display" , "block");
		return false;
		 }
	   
		  if($("#correspondenceAddress1").val() == ''){
		 
			$("#correspondenceAddress1Err").css("display" , "block");
			return false;
		 }
	 
	  if($("#correspondenceState").val() == 0){
		 
			$("#correspondenceStateErr").css("display" , "block");
			return false;
		 }

	  if($("#correspondenceDistrict").val() == 0){
		 
			$("#correspondenceDistrictErr").css("display" , "block");
			return false;
		 }
	  if($("#correspondenceCity").val() == 0){
		 
			$("#correspondenceCityErr").css("display" , "block");
			return false;
		 }
	  if($("#correspondencePincode").val() == ''){
		 $("#correspondencePincodeErr").css("display" , "block");
			return false;
		 }
	  if(($("#correspondencePincode").val()).match(/^[0-9]{6}$/)==null)
		 {
		  $("#correspondencePincodeErr2").css("display" , "block");
		 return false;
		 }
		 
	  if($("#Email").val() == ''){
		 
			$("#EmailErr").css("display" , "block");
			return false;
		 }
	  if($("#mobile").val() == ''){
		 
			$("#mobileErr").css("display" , "block");
			return false;
		 }
	  if($("#mobile").val().match(/^[0-9]{10}$/)==null)
	 {
		 alert("Invalid Mobile no");
		 return false;
	 }
	 
	  if($("#trainingType").val() == ''){
		 
			$("#trainingTypeErr").css("display" , "block");
			return false;
		 }
	  if($("#userType").val() == ''){
		 
			$("#userTypeErr").css("display" , "block");
			return false;
		 }
	  if($("#seatingCapacity").val() == ''){
		 
			$("#seatingCapacityErr").css("display" , "block");
			return false;
		 }
	  if($("#noOfInHouseTrainer").val() == ''){
		 
			$("#noOfInHouseTrainerErr").css("display" , "block");
			return false;
		 }
	  if($("#noOfYearExp").val() == ''){
		 
			$("#noOfYearExpErr").css("display" , "block");
			return false;
		 }
   if($("#sessWishToConduct").val() == '' ){
		 
			$("#sessWishToConductErr").css("display" , "block");
			return false;
		 }
	
	 if(!(isUpdate !=null && isUpdate== "Y")){
	  if($("#txtInput").val() == '' ){
		 
			$("#txtInputErr").css("display" , "block");
			return false;
		 }
	 if(true){
			 //captcha checker from login.jsp
			 	var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
			     var str2 = removeSpaces(document.getElementById('txtInput').value);
			     if (!(str1 == str2)) {
			         alert("Please Enter correct captcha");
			         document.getElementById('txtInput').value = "";
			         return false;
			     }
			 }
		
		 if($("#check").is(":checked")==false){
		alert("Check the checkbox to agree to Term and Conditions");
		return false;
	 	} 
	  	
	 }
	 
 }

 // Remove the spaces from the entered and generated code
 function removeSpaces(string) {
     return string.split(' ').join('');
 }
 
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
	 
	 var isUpdate = '${isUpdate}';
	 if(isUpdate !=null && isUpdate== "Y"){
		 
		 var name = '${PersonalInformationTrainingInstitute.firstName}';
		$("#correspondenceState").val('${PersonalInformationTrainingInstitute.correspondenceState}');
		$("#correspondenceState").trigger("change");
        window.setTimeout(function() {
        	$("#correspondenceDistrict").val('${PersonalInformationTrainingInstitute.correspondenceDistrict}');
            $("#correspondenceDistrict").trigger("change");
            window.setTimeout(function() {
            	$("#correspondenceCity").val('${PersonalInformationTrainingInstitute.correspondenceCity}');
            }, 1000);
        }, 1000);
	
		 $("#createUpdateBtn").val("Update");
		 $("#captcha").css("display" , "none");
		 
	 }
		DrawCaptcha();
		
		 flatpickr("#dob" ,{});	
		 
		 
	}
	window.onload = OnStart;
 </script>

	 
	<cf:form action="PersonalInformationTrainingInstituteAdd.fssai" name="myForm" method="POST"
		commandName="PersonalInformationTrainingInstitute" onsubmit='return validateFields();' >

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
                     		<cf:input type="hidden" path="id"/>
                                <div class="form-group">
                                    <div>
                                    <cf:input path="id" type="hidden" /> 
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Center Name:</strong></li>
                                              <li id="trainingCenterNameErr" style="display:none;" class="style-li error-red" > Training name can not be blank.</li>
                                                  
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="trainingCenterName" class="form-control" placeholder="Training Center Name" required=""/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Partner Name:</strong></li>
                                             <li id="trainingPartnerNameErr" style="display:none;" class="style-li error-red" > Select a Training Partner.</li>
                                             
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
                                            <li id="panErr" style="display:none;" class="style-li error-red" > Enter your PAN no.</li>
                                             
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
                                            <li id="titleErr" style="display:none;" class="style-li error-red" > Title can not be blank.</li>
                                             
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
                                             <li id="firstNameErr" style="display:none;" class="style-li error-red" > first Name can not be blank.</li>
                                           
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" class="form-control" path="firstName" placeholder="First Name" required=""
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Middle Name:(Training Center Head)</strong></li>
                                             <li id="middleNameErr" style="display:none;" class="style-li error-red" > Middle Name can not be blank.</li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="middleName" class="form-control" placeholder="Middle Name" required=""
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Last Name:(Training Center Head)</strong></li>
                                            <li id="lastNameErr" style="display:none;" class="style-li error-red" > Last Name can not be blank.</li>
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="lastName" class="form-control" placeholder="Last Name" required=""
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')"/>
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
                                            <li id="correspondenceAddress1Err" style="display:none;" class="style-li error-red" > Address can not be blank.</li>
                                           
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress1" class="form-control" placeholder="Training Center Line 1" required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Center Address Line 2:</strong></li>
                                            
                                           
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress2" class="form-control" placeholder="Training Center Line 2" required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>State:</strong></li>
                                            <li id="correspondenceStateErr" style="display:none;" class="style-li error-red" > Please select a Correspondence State.</li>
                                           
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                      <cf:select path="correspondenceState" class="form-control" onchange="getDistrict(this.value , 'correspondenceDistrict')">
                                   <cf:option value="0" label="Select state Name" />
									<cf:options items="${listStateMaster}" itemValue="stateId" itemLabel="stateName"/>
                                    </cf:select>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>District:</strong></li>
                                             <li id="correspondenceDistrictErr" style="display:none;" class="style-li error-red" > Please select a Correspondence District.</li>
                                          
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                     <cf:select path="correspondenceDistrict" class="form-control" onchange="getCity(this.value , 'correspondenceCity')">
                                 <cf:option value="0" label="Select District" />
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
                                            <li id="correspondenceCityErr" style="display:none;" class="style-li error-red" > Please select a Correspondence City.</li>
                                          
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    
                                    <cf:select path="correspondenceCity" class="form-control">
                                   <cf:option value="0" label="Select District" />
                                    </cf:select>
                                </div>




                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>PIN Code:</strong></li>
                                            <li id="correspondencePincodeErr" style="display:none;" class="style-li error-red" > Pincode cannot be empty.</li>
                                          
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondencePincode" class="form-control" minlength="6"  maxlength="6" placeholder="Pincode" required=""
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Email:</strong></li>
                                            <li id="EmailErr" style="display:none;" class="style-li error-red" > Email cannot be empty.</li>
                                          
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                     <cf:input type="text" path="Email" class="form-control" placeholder="Email" onblur="emailVal(this.id,this.value)" required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Mobile:</strong></li>
                                            <li id="mobileErr" style="display:none;" class="style-li error-red" > Mobile cannot be blank</li>
                                          
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="mobile" class="form-control" minlength="10" maxlength="10" placeholder="Mobile" required=""
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
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
                                                    <li id="trainingTypeErr" style="display:none;" class="style-li error-red" >Select training type.</li>
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
                                                   <li id="userTypeErr" style="display:none;" class="style-li error-red" > Select User type.</li>
                                                    
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
                                             <li id="seatingCapacityErr" style="display:none;" class="style-li error-red" >Seating capacity cannot be empty.</li>
                                                  
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
                                        <cf:radiobutton  path="availableTVProjector"  checked="checked" name="optradio"/> No </label>
                                </div>
                                <div class="form-group">
                                    <label>Availability of in-house trainers in food safety ?</label>
                                    <br>
                                    <label class="radio-inline">
                                        <cf:radiobutton  path="availableInHouseTrainer" name="optradio"/> Yes </label>
                                    <label class="radio-inline">
                                        <cf:radiobutton  path="availableInHouseTrainer"   checked="checked" name="optradio"/> No </label>
                                </div>
                            </div>
                            <!-- left side ends -->
                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Number of in-house trainers ?</strong></li>
                                             <li id="noOfInHouseTrainerErr" style="display:none;" class="style-li error-red" > give the no of trainers.</li>
                                            
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="noOfInHouseTrainer" placeholder="Number of trainers" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Number of years in Business of training ?</strong></li>
                                            <li id="noOfYearExpErr" style="display:none;" class="style-li error-red" > Years in business.</li>
                                            
                                            <li class="style-li error-red"> </li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="noOfYearExp" placeholder="Number of years" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>How many training (4hrs) sessions wish to conduct in a month ?</strong></li>
                                            <li id="sessWishToConductErr" style="display:none;" class="style-li error-red" > Cannot be empty.</li>
                                            
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
                        <fieldset id="captcha">
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
                            <div id="txtInputErr" style="display:none;" class="style-li error-red" > Captcha can not be blank.</div> 
							<input type="text" id="txtCaptcha"
								style="background-image: url(1.jpg); text-align: center; border: none; width: 140px; margin-left: 8px; font-weight: bold; font-family: Modern"
								disabled="disabled" /> <input type="button" id="btnrefresh"
								value="Refresh" onclick="DrawCaptcha();" /> <input type="text"
								id="txtInput" placeholder="Captcha" style="width: 140px;"/ >

						</div>
					</div>
					<div style="float: left; width: 99%;">
						<input type="checkbox" name="chkName" id="check" style="margin-left: 1%;">
						<!-- <a href="#" target="_blank" class="terms-font-size">  -->
						I have read and understood the Terms & Conditions and the Privacy
						Policy of FSSAI.
						<!-- </a> -->
					</div>
				</div>
</fieldset>
                        <!-- button -->

                        <div class="row">
                            <div class="col-md-4 col-xs-12"></div>
                            <div class="col-md-4 col-xs-12">
                                <input type="submit"  style="width: 100%;" class="btn login-btn" id="createUpdateBtn" value="Register"/>
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
	
	