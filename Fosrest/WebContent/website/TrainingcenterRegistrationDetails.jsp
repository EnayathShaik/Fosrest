<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- <head> -->

 <script src="website/js/commonController.js"></script>
 <script>
 

 function validateFields(){
	 var isUpdate = '${isUpdate}';
	 
	

	
	 $("#trainingCenterNameErr").css("display" , "none");
	 //$("#trainingPartnerNameErr").css("display" , "none");
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
	// $("#correspondencePincodeErr2").css("display" , "none");
	 $("#EmailErr").css("display" , "none");
	 $("#mobileErr").css("display" , "none");
	 $("#seatingCapacityErr").css("display" , "none");
	 $("#noOfInHouseTrainerErr").css("display" , "none");
	 $("#noOfPCErr").css("display" , "none");
	// $("#panErr").css("display" , "none");
	// $("#trainingTypeErr").css("display" , "none");
	// $("#userTypeErr").css("display" , "none");
	 
	 $("#txtInputErr").css("display" , "none"); 
	 
	 if($("#trainingCenterName").val() == ''){
		 
		$("#trainingCenterNameErr").css("display" , "block");
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
	/*   if($("#trainingPartnerName").val() == '0'){
		 
			$("#trainingPartnerNameErr").css("display" , "block");
		return false;
		 } */
	
	 /*   if($("#pan").val() == '')
	 {
		 $("#panErr").css("display" , "block");
		 return false; 
	 } */
	 
	   if($("#title").val() == ''){
		 
			$("#titleErr").css("display" , "block");
			return false;
		 }
	  if($("#firstName").val() == ''){
		 
			$("#firstNameErr").css("display" , "block");
			return false;
		 }
	  /* if($("#middleName").val() == ''){
			 
			$("#middleNameErr").css("display" , "block");
			return false;
		 } */
	  if($("#lastName").val() == ''){
		 
			$("#lastNameErr").css("display" , "block");
		return false;
		 }
	   
		  if($("#correspondenceAddress1").val() == ''){
		 
			$("#correspondenceAddress1Err").css("display" , "block");
			return false;
		 }
		  if($("#correspondencePincode").val() == ''){
				 $("#correspondencePincodeErr").css("display" , "block");
					return false;
				 }
			
		  
		  /*  if(($("#correspondencePincode").val()).match(/^[0-9]{6}$/)==null)
			 {
			  $("#correspondencePincodeErr2").css("display" , "block");
			 return false;
			 } */
		
	 
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
	
	 
	/*   if($("#trainingType").val() == ''){
		 
			$("#trainingTypeErr").css("display" , "block");
			return false;
		 }
	  if($("#userType").val() == ''){
		 
			$("#userTypeErr").css("display" , "block");
			return false;
		 } */
	  if($("#seatingCapacity").val() == ''){
		 
			$("#seatingCapacityErr").css("display" , "block");
			return false;
		 }
	  if($("#noOfInHouseTrainer").val() == ''){
		 
			$("#noOfInHouseTrainerErr").css("display" , "block");
			return false;
		 }
	  if($("#noOfPC").val() == ''){
			 
			$("#noOfPCErr").css("display" , "block");
		return false;
		 }
	/*   if($("#noOfYearExp").val() == ''){
		 
			$("#noOfYearExpErr").css("display" , "block");
			return false;
		 }
   if($("#sessWishToConduct").val() == '' ){
		 
			$("#sessWishToConductErr").css("display" , "block");
			return false;
		 } */
	
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
 
 function displayNone(){
	$("#titleErr").css("display" , "none");
	 $("#firstNameErr").css("display" , "none");
return false;
	 
 }

 // Remove the spaces from the entered and generated code
 function removeSpaces(string) {
     return string.split(' ').join('');
 }
 
 function AvoidSpace(event) {
	    var k = event ? event.which : window.event.keyCode;
	    if (k == 32) return false;
	}
 
 
/*  function getTPName(){
		
		var TPName = $("#trainingPartnerName option:selected").text();
		TPName = TPName.substring(0,3).toUpperCase();
		console.log(" TPName  "+TPName);
		$("#tpName").val(TPName);
		
	} */

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
	 $("#noofhallid").css("display", "none");
	 	$("#perhallid").css("display", "none");
	 	$("#hostelroomsid").css("display", "none");
	 	$("#power").css("display", "none");
	 	$("#messid").css("display", "none");
	 var isUpdate = '${isUpdate}';
	 var profileId = '${profileId}';
	 //alert("profileId"+profileId);
	 if(isUpdate !=null && isUpdate== "Y"){
		 if($('#YesConHallid').is(':checked')==true){
				
				$("#noofhallid").css("display", "block");
			 	$("#perhallid").css("display", "block");
			}
		 else	if ( $('#YesConHallid').is(':checked')==false) {
				$("#noofhallid").css("display", "none");
			 	$("#perhallid").css("display", "none");
			}
		 if($('#yesHostelid').is(':checked')==true){
				$("#hostelroomsid").css("display", "block");
			 	$("#power").css("display", "block");
			 	$("#messid").css("display", "block");
			}
		 else 	if ( $('#yesHostelid').is(':checked')==false) {
			$("#hostelroomsid").css("display", "none");
			 	$("#power").css("display", "none");
			 	$("#messid").css("display", "none");
			}
		 var name = '${PersonalInformationTrainingInstitute.firstName}';
			$("#logId").val('${PersonalInformationTrainingInstitute.loginDetails.id}');
			$("#status").val('${PersonalInformationTrainingInstitute.status}');
			
		
		$("#correspondenceState").val('${PersonalInformationTrainingInstitute.correspondenceState}');
		$("#correspondenceState").trigger("change");
        window.setTimeout(function() {
        	$("#correspondenceDistrict").val('${PersonalInformationTrainingInstitute.correspondenceDistrict}');
            $("#correspondenceDistrict").trigger("change");
            window.setTimeout(function() {
            	$("#correspondenceCity").val('${PersonalInformationTrainingInstitute.correspondenceCity}');
            }, 1000);
        }, 1000);
	
		
		 $("#captcha").css("display" , "none");
		
		 if(profileId==2 || profileId==1){
			 $("#createUpdateBtn").val("Back");
		 }
		 else if(profileId==5)
			 {
			 $("#createUpdateBtn").val("Update");
			 }
		 
	 }
		DrawCaptcha();
		
		 flatpickr("#dob" ,{});	
		 
		 
	}
	window.onload = OnStart;
 </script>

	 
	<cf:form action="PersonalInformationTrainingInstituteAdd.fssai" name="myForm" method="POST"
		commandName="PersonalInformationTrainingInstitute" onsubmit='return validateFields();' >
  <!-- horizontal navigation -->
              
  <section>
        <div class="container">
            <div class="row mar-top-aadhar">
                <div class="col-md-1 col-xs-12"></div>

                <div class="col-md-10  col-xs-12">
                    <h3 class="text-capitalize heading-3-padding">Training Institute Registration Form</h3>

                    <form>

                             <!-- personal information -->
                             <div class="personel-info">
                        <fieldset>
                            <legend> Personal Information</legend>
                               
                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">
                                             
                     		<cf:input type="hidden" path="id"/>

                                <div class="form-group">
                                    <div>
                                    <cf:input path="id" type="hidden" /> 
                                        		<cf:input path="logId"  type="hidden"/>
									<cf:input path="status"  type="hidden"/>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Center Name:</strong></li>
                                              <li class="style-li error-red">* </li>
                                              <li id="trainingCenterNameErr" style="display:none;" class="style-li error-red" >Please Enter Training Center Name.</li>
                                         </ul>
                                    </div>
                                    <cf:input type="text" path="trainingCenterName" class="form-control" placeholder="Training Center Name" required=""/>
                                </div>
                                     <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Email:</strong></li>
                                            <li class="style-li error-red">* </li>
                                            <li id="EmailErr" style="display:none;" class="style-li error-red" >Please Enter Email ID.</li>
                                          </ul>
                                    </div>
                                     <cf:input type="text" path="Email" class="form-control" placeholder="Email" onblur="return emailVal(this.id,this.value);return false; " required=""/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Mobile No.:</strong></li>
                                            <li class="style-li error-red"> *</li>
                                            <li id="mobileErr" style="display:none;" class="style-li error-red" >Please Enter Mobile No.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="mobile" class="form-control" minlength="10" maxlength="10" placeholder="Mobile" required=""
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
                                
                              <%--   <div class="form-group">
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
                                </div> --%>
                           <%--      <div class="form-group">
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
                                </div> --%>
                            </div>
                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">
                             
                              <div class="col-md-3 col-xs-12" style="padding-left: 0px;">
								<div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Title:</strong></li>
                                             <li class="style-li error-red"> *</li>
                                            <li id="titleErr" style="display:none;" class="style-li error-red" >Please Select Title.</li>
                                         </ul>
                                    </div>
                                   <cf:select path="title" class="form-control" onblur="return displayNone();">
													<cf:option value="" label="Select Title" />
													<cf:options items="${titleMap}" />
												</cf:select>
                                </div>
                                </div>
                                 <div class="col-md-9 col-xs-12"  style="padding-right: 0px;">
                                 <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                         <li class="style-li"><strong>First Name:(Nodal Person Name) </strong></li>
                                            <li class="style-li error-red"> *</li>
                                            <li id="firstNameErr" style="display:none;" class="style-li error-red" >Please Enter First Name.</li>
                                            
                                           </ul>
                                    </div>
                                    <cf:input type="text" class="form-control" path="firstName" placeholder="First Name"
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'') " onblur="return displayNone();"/>
                                </div>
                               </div>
                               
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong    style=" margin-left: -108px; ">Middle Name:(Nodal Person Name)</strong></li>
                                             <li id="middleNameErr" style="display:none;" class="style-li error-red" >Please Enter Middle Name.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="middleName" class="form-control" placeholder="Middle Name"
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Last Name:(Nodal Person Name)</strong></li>
                                             <li class="style-li error-red"> * </li>
                                            <li id="lastNameErr" style="display:none;" class="style-li error-red" >Please Enter Last Name.</li>
                                            </ul>	
                                    </div>
                                    <cf:input type="text" path="lastName" class="form-control" placeholder="Last Name"
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
                                             <li class="style-li error-red">* </li>
                                            <li id="correspondenceAddress1Err" style="display:none;" class="style-li error-red" >Please Enter Training Center Address.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress1" class="form-control" placeholder="Training Center Line 1" />
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Training Center Address Line 2:</strong></li>
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress2" class="form-control" placeholder="Training Center Line 2" />
                                </div>
                               


                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Pin Code:</strong></li>
                                             <li class="style-li error-red">* </li>
                                            <li id="correspondencePincodeErr" style="display:none;" class="style-li error-red" >Please Enter Pin code.</li>
											  <li id="correspondencePincodeErr2" style="display: none;"
												class="style-li error-red">Please Enter valid Pin Code.</li>
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondencePincode" class="form-control" minlength="6" maxlength="6" placeholder="Pincode" required=""
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
                               
                            </div>
                            <!-- left side ends -->
                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">
								
								 <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>State:</strong></li>
                                            <li class="style-li error-red"> *</li>
                                            <li id="correspondenceStateErr" style="display:none;" class="style-li error-red" > Please select Correspondence State.</li>
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
                                             <li class="style-li error-red"> *</li>
                                             <li id="correspondenceDistrictErr" style="display:none;" class="style-li error-red" > Please select Correspondence District.</li>
                                          </ul>
                                    </div>
                                     <cf:select path="correspondenceDistrict" class="form-control" onchange="getCity(this.value , 'correspondenceCity')">
                                 <cf:option value="0" label="Select District" />
                                    </cf:select>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>City:</strong></li>
                                             <li class="style-li error-red"> *</li>
                                            <li id="correspondenceCityErr" style="display:none;" class="style-li error-red" > Please Select Correspondence City.</li>
                                         </ul>
                                    </div>
                                    <cf:select path="correspondenceCity" class="form-control">
                                   <cf:option value="0" label="Select City" />
                                    </cf:select>
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

                                  <%--   <div class="col-md-7 col-xs-12 remove-padding">
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
                                    </div> --%>

                                  <%--   <div class="col-md-4 col-md-offset-1 col-xs-12 remove-padding">
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
                                    </div> --%>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Seating capacity Per session?</strong></li>
                                             <li class="style-li error-red">* </li>
                                             <li id="seatingCapacityErr" style="display:none;" class="style-li error-red" >Please Enter Seating Capacity.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="seatingCapacity" class="form-control" placeholder="Number of Seats"
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
                                <div class="form-group">
									<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Availability of TV/ Projector in training center ?</strong></li>
										</ul>
									</div>
									<cf:radiobutton path="availableTVProjector" value="Yes" checked="true" />
									Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="availableTVProjector" value="No" />
									No
								</div>
                                <div class="form-group">
									<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Availability of in-house trainers in food safety ?</strong></li>
										</ul>
									</div>
									<cf:radiobutton path="availableInHouseTrainer" value="Yes" checked="true" />
									Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="availableInHouseTrainer" value="No" />
									No
								</div>
                              
                            </div>
                            <!-- left side ends -->
                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Number of in-house trainers ?</strong></li>
                                             <li class="style-li error-red">* </li>
                                             <li id="noOfInHouseTrainerErr" style="display:none;" class="style-li error-red" > Please Enter the No. of In-House Trainers.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="noOfInHouseTrainer" placeholder="Number of trainers" class="form-control"
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
                                
                                 <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Number of PC's</strong></li>
                                             <li class="style-li error-red">* </li>
                                             <li id="noOfPCErr" style="display:none;" class="style-li error-red" > Please Enter the No. of PC's.</li>
                                            </ul>
                                    </div>
                                    <cf:input type="text" path="noOfPC" placeholder="Number of Pc's" class="form-control"
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
                                
                               
                               <%--  <div class="form-group">
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
                                    
                                </div> --%>
                            </div>
                            <!-- right side ends -->
                        </fieldset>
<!-- Experience end -->

<!--Eligibility start  -->
<fieldset>
                            <legend>Eligibility Criteria</legend>
                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="col-xs-12 remove-padding">

                                 
                                </div>

                                <div class="form-group">
                                    <div>
                                        </legend> <strong>Experience of conducting training programme</strong>
                                    
                                     
                                    </div>
                                    <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li">&nbsp;&nbsp; No. of Trainings conducted last year</li>
                                             <li id="noOfInHouseTrainerErr" style="display:none;" class="style-li error-red" > Please Enter the No. of In-House Trainers.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="lastYearTrainings" placeholder="Number of Trainings" class="form-control"
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li">&nbsp;&nbsp;No. of participants trained during last year</li>
                                             <li id="noOfInHouseTrainerErr" style="display:none;" class="style-li error-red" > Please Enter the No. of In-House Trainers.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="lastYearParticipants" placeholder="Number of Participants" class="form-control"
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>       
                                </div>
                                <div class="form-group">
									
							 <div class="form-group">
									<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Availability of conference Hall : </strong></li>
										</ul>
									</div>
									<cf:radiobutton path="conHall" value="Yes" checked="true" onclick="radioYes();" id="YesConHallid" />
									Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="conHall" value="No"  onclick="radioNo();"/>
									No
								</div>
								<div class="form-group" id="noofhallid">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li">&nbsp;&nbsp;No. of hall</li>
                                             <li id="noOfInHouseTrainerErr" style="display:none;" class="style-li error-red" > Please Enter the No. of In-House Trainers.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="noOfHall" placeholder="Number of hall" class="form-control"
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
                                    <div class="form-group" id="perhallid">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li">&nbsp;&nbsp;Seating capacity per hall</li>
                                             <li id="noOfInHouseTrainerErr" style="display:none;" class="style-li error-red" > Please Enter the No. of In-House Trainers.</li>
                                           </ul>
                                    </div>
                                    <cf:input type="text" path="perHall" placeholder="Seating capacity" class="form-control"
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
								</div>
								 <div class="form-group">
									<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Hostel Facility  :</strong></li>
										</ul>
									</div>
									<cf:radiobutton path="hostel" value="Yes" checked="true" onclick="radioYesHostel(); " id="yesHostelid" />
									Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="hostel" value="No"   onclick="radioNoHostel();"/>
									No
								</div>
                                <div class="form-group" id="hostelroomsid">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li">&nbsp;&nbsp;No. of Rooms</li>
                                            </ul>
                                    </div>
                                    <cf:input type="text" path="hostelRooms" placeholder="Number of Rooms" class="form-control"
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>
                                 <div class="form-group" id="messid">
									<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Mess/Canteen :</strong></li>
										</ul>
									</div>
									<cf:radiobutton path="mess" value="Yes" checked="true" />
									Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="mess" value="No"  />
									No
								</div>
                                 
                                  <div class="form-group" id="power">
									<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Power backup : </strong></li>
										</ul>
									</div>
									<cf:radiobutton path="powerHostel" value="Yes" checked="true" />
									Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="powerHostel" value="No"  />
									No
								</div>
                            </div>
                            <!-- left side ends -->
                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">

								<strong>Availability of following items in each hall</strong>					
								  <div class="form-group">
                                    <div>
                                        <ul >
                                         <li ><cf:checkbox path="lcd" />LCD.</li>	
                                             <li><cf:checkbox path="laptop" />Laptop</li>
                                              <li><cf:checkbox path="projector" />Projector with screen.</li>
                                              <li ><cf:checkbox path="printer" />Printer.</li>
                                              <li ><cf:checkbox path="photoCopier" />PhotoCopier.</li>
                                              <li ><cf:checkbox path="whiteBoard" />WhiteBoard.</li>
                                             <li ><cf:checkbox path="powerBackup" />Power Backup.</li>
                                             <li><cf:checkbox path="trTool" />Arrangement of other training tool as required :</li> 
                                               <li><cf:checkbox path="internetFacility" />Internet facility  :</li>
                                             <li><cf:checkbox path="light" />Sufficient light and airflow  :</li>
                                           <li><cf:checkbox path="sound" />Good sound system  :</li>
                                             <li ><cf:checkbox path="ac" />Air condition :</li>
                                           </ul>
                                    </div>
                                    
                             
                                </div>
                               
                              <%--  <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Availability of FSSAI notified laboratory.</strong> :</li>
                                          </ul>
                                    </div>
                                    <cf:radiobutton
										path="fssaiLab" value="" />Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="fssaiLab" value="" checked="true"  />No
                                </div> --%>
									  <div class="form-group">
									<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Availability of FSSAI notified laboratory. </strong></li>
										</ul>
									</div>
									<cf:radiobutton path="fssaiLab" value="Yes" checked="true" />
									Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="fssaiLab" value="No"  />
									No
								</div>
								
									  <%--  <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Transport facility.</strong> :</li>
                                          </ul>
                                    </div>
                                    <cf:radiobutton
										path="transport" value="" />Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="transport" value="" checked="true"  />No
                                </div> --%>
                                <div class="form-group">
									<div>
										<ul class="lab-no">
											<li class="style-li"><strong>Transport facility. </strong></li>
										</ul>
									</div>
									<cf:radiobutton path="transport" value="Yes"  checked="true"/>
									Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<cf:radiobutton path="transport" value="No"  />
									No
								</div>
                               
                            </div> 
                            <!-- right side ends -->
                        </fieldset>
<!-- Eligibility end -->

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
								id="txtInput" placeholder="Captcha" style="width: 140px;"/>

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
</div>


                    </form></div>
                    <!-- form ends -->

                    

                    <div class="col-md-1 col-xs-12"></div>
                </div>
            </div>
    </section>


		<div class="col-md-2 hidden-xs"></div>
	</cf:form>
	<script>
	function radioNo(){
	 	$("#noofhallid").css("display", "none");
	 	$("#perhallid").css("display", "none");
	 	$("#noOfHall").val('');
	 	$("#perHall").val('');
	 } 
  function radioYes(){
	 	$("#noofhallid").css("display", "block");
	 	$("#perhallid").css("display", "block");
	  }
  function radioNoHostel(){
	 	$("#hostelroomsid").css("display", "none");
	 	$("#power").css("display", "none");
	 	$("#messid").css("display", "none");
	 	$("#hostelRooms").val('');
	 	$("#powerHostel").val('');
		$("#mess").val('');
	 } 
function radioYesHostel(){
	 	$("#messid").css("display", "block");
	 	$("#power").css("display", "block");
	 	$("#hostelroomsid").css("display", "block");
	  }
	</script>