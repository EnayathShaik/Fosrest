<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="website/js/jquery-2.1.0.min.js"></script>


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
	 
	 var isUpdate = '${isUpdate}';
	 var profileId = '${profileId}';
	 if(profileId ==2 || profileId == 1 ){ 
		
		 $("#statusDIV").css("display" , "block");
		
	 
	 }
	 if(isUpdate !=null && isUpdate== "Y"){
		 alert("Update Your Details");
		 var name = '${PersonalInformationTrainee.firstName}';
		$("#logId").val('${PersonalInformationTrainee.loginDetails.id}');
		$("#correspondenceState").val('${PersonalInformationTrainee.correspondenceState}');
		$("#correspondenceState").trigger("change");
        window.setTimeout(function() {
        	$("#correspondenceDistrict").val('${PersonalInformationTrainee.correspondenceDistrict}');
            $("#correspondenceDistrict").trigger("change");
            window.setTimeout(function() {
            	$("#correspondenceCity").val('${PersonalInformationTrainee.correspondenceCity}');
            }, 1000);
        }, 1000);
		$("#resState").val('');
        $("#residentialDistrict").val('');
        $("#resCity").val('');
        $("#ResidentialLine1").val('');
        $("#ResidentialLine2").val('');
		 $("#createUpdateBtn").val("Update");
		$("#captcha").css("display" , "none");
		 $("#chkunit").css("display" , "none");
		 $("#check").attr("checked","checked");
	 }

	
		DrawCaptcha(); 
		
		 flatpickr("#dob" ,{});	
		
	 		 
		 		$('#sameAddr').change(function(){
		 			
		 			if(this.checked){
		 				$("#resState").val($("#correspondenceState").val());
		 				 $("#resState").trigger("change");
		                    window.setTimeout(function() {
		                    	$("#residentialDistrict").val($("#correspondenceDistrict").val());
		                        $("#residentialDistrict").trigger("change");
		                        window.setTimeout(function() {
		                        	$("#resCity").val($("#correspondenceCity").val());
		                        }, 1000);
		                    }, 1000);
		 				
		 				
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


	<cf:form action="PersonalInformationTraineeAdd.fssai" name="myForm" method="POST"
		commandName="PersonalInformationTrainee"  onsubmit="return validateFields();">

  <section>
        <div class="container">
            <div class="row mar-top-aadhar">
                <div class="col-md-1 col-xs-12"></div>

                <div class="col-md-10  col-xs-12">
                    <h3 class="text-capitalize heading-3-padding">Trainee Registration Form</h3>
	 <!-- personal information -->
                        <fieldset>
                            <legend>Personal Information</legend>

                            <!-- form field starts here -->



                            <!-- left side -->
                            <div class="col-md-6 col-xs-12">


										<cf:input type="hidden" path="id"/>
                                
                                        <div class="form-group">
                                            <div>
                                                <ul class="lab-no">
                                                    <li class="style-li"><strong>User Type:</strong></li> <li class="style-li error-red"> * </li>
                                                     <!--  valid -->
                                                            <li id="userTypeErr" style="display:none;" class="style-li error-red" >User Type can not be blank.</li>
                                                   
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
                                            <li class="style-li"><strong>Aadhar Number:</strong></li><li class="style-li error-red"> * </li>
                                             <!--  valid -->
                                            <li id="AadharNumberErr" style="display:none;" class="style-li error-red" >Aadhar Number can not be blank.</li>
                                            <li class="style-li error-red">
                                            <span id="aadhar_status" ></span>
									
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="AadharNumber" class="form-control" maxlength="12" placeholder="Aadhar Number"
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
                                      onblur="ck_aadhar('personalinformationtrainee');" />
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Emp Id:</strong></li><li class="style-li error-red"> * </li>
                                              <!--  valid -->
                                            <li id="empIDErr" style="display:none;" class="style-li error-red" >Emp Id can not be blank.</li>
                                            
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="empID" class="form-control" placeholder="Emp ID"/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Date of Birth:</strong></li> <li class="style-li error-red"> * </li>
                                             <!--  valid -->
                                            <li id="dobErr" style="display:none;" class="style-li error-red" >Date of Birth can not be blank.</li>
                                           
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
                                            <!--  valid -->
                                            <li id="titleErr" style="display:none;" class="style-li error-red" >Title can not be blank.</li>
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
                                            <li class="style-li"><strong>First Name:</strong></li> <li class="style-li error-red"> * </li>
                                             <!--  valid -->
                                                            <li id="firstNameErr" style="display:none;" class="style-li error-red" >First Name can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text"  path="firstName" class="form-control"  placeholder="First Name"
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')" />
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Middle Name:</strong></li> <li class="style-li error-red"> </li>
                                             <!--  valid -->
                                                            <li id="MiddleNameErr" style="display:none;" class="style-li error-red" >Middle Name can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="MiddleName" class="form-control" placeholder="Middle Name"
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')" />
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Last Name:</strong></li><li class="style-li error-red"> </li>
                                             <!--  valid -->
                                                            <li id="LastNameErr" style="display:none;" class="style-li error-red" >Last Name can not be blank.</li>
                                            
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="LastName" class="form-control" placeholder="Last Name"
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')" />
                                </div>
                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Father's Name:</strong></li> <li class="style-li error-red"> * </li>
                                             <!--  valid -->
                                             <li id="FatherNameErr" style="display:none;" class="style-li error-red" >Father Name can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="FatherName" class="form-control" placeholder="Father's Name"
                                    onkeyup="if (/\d/g.test(this.value)) this.value = this.value.replace(/\d/g,'')" />
                                </div>
                                
                                
                                      <div class="form-group" style="display:none;" id="statusDIV" >
                                                                <div>
                                                                    <ul class="lab-no">
                                                                        <li class="style-li"><strong>Approved Trainee As:</strong></li>
                                                                        <li class="style-li error-red">
                                                                            <cf:errors path="status" cssClass="error" />
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <cf:select path="status" class="form-control">
                                                                    <cf:option value="A" label="Active" />
                                                                    <cf:option value="I" label="In-Active" />
                                                                </cf:select>

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
                                            <li class="style-li"><strong>Correspondence Address Line 1:</strong></li> <li class="style-li error-red"> * </li>
                                             <!--  valid -->
                                             <li id="correspondenceAddress1Err" style="display:none;" class="style-li error-red" >correspondence Address can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress1" class="form-control" placeholder="Address" required=""/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Correspondence Address Line 2:</strong></li> <li class="style-li error-red"> </li>
                                             <!--  valid -->
                                            <!--  <li id="correspondenceAddress2Err" style="display:none;" class="style-li error-red" >correspondence Address can not be blank.</li> -->
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondenceAddress2" class="form-control" placeholder="Address" required=""/>
                                </div>




                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>State:</strong></li><li class="style-li error-red"> * </li>
                                            <!--  valid -->
                                             <li id="correspondenceStateErr" style="display:none;" class="style-li error-red" >correspondence State can not be blank.</li>
                                            
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
                                            <li class="style-li"><strong>Email:</strong></li> <li class="style-li error-red"> * </li>
                                            <!--  valid -->
                                            <li id="EmailErr" style="display:none;" class="style-li error-red" >Email can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                  
                                    <cf:input type="text" path="Email" class="form-control" placeholder="Email" onblur="emailVal(this.id,this.value)" required=""/>
                                </div>

                            </div>
                            <!-- left side ends -->

                            <!-- right side -->
                            <div class="col-md-6 col-xs-12">

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>District:</strong></li>  <li class="style-li error-red"> * </li>
                                             <!--  valid -->
                                            <li id="correspondenceDistrictErr" style="display:none;" class="style-li error-red" >District can not be blank.</li>
                                          
                                        </ul>
                                    </div>
                                    <cf:select path="correspondenceDistrict" class="form-control" onchange="getCity(this.value , 'correspondenceCity')">
                                     <cf:option value="0" label="select District"></cf:option>
                                    </cf:select>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>City:</strong></li> <li class="style-li error-red"> * </li>
                                            <!--  valid -->
                                            <li id="correspondenceCityErr" style="display:none;" class="style-li error-red" >City can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                                    <cf:select path="correspondenceCity" class="form-control">
                                    
                                    </cf:select>
                                </div>



                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Pin Code:</strong></li> <li class="style-li error-red"> * </li>
                                           <!--  valid -->
                                            <li id="correspondencePincodeErr" style="display:none;" class="style-li error-red" >Pin code can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                                    <cf:input type="text" path="correspondencePincode" class="form-control"  minlength="6"  maxlength="6" placeholder="Pin Code" required=""
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Mobile:</strong></li> <li class="style-li error-red"> * </li>
                                              <!--  valid -->
                                            <li id="mobileErr" style="display:none;" class="style-li error-red" >Mobile can not be blank.</li>
                                           
                                        </ul>
                                    </div>
                                
                                     <cf:input type="text" path="mobile" class="form-control" minlength="10"  maxlength="10" placeholder="Mobile Number" required=""
                                     onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"/>
                                    
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
                                            <li id="ResidentialLine1Err" style="display:none;" class="style-li error-red" >Correspondence Address can not be blank.</li>
                                       </ul>
                                    </div>
                                    <cf:input type="text" path="ResidentialLine1" class="form-control" placeholder="Address" required=""/>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Permanent Address Line 2:</strong></li>
                                             <li id="ResidentialLine2Err" style="display:none;" class="style-li error-red" >Correspondence Address can not be blank.</li>
                                       </ul>
                                    </div>
                                    <cf:input type="text" path="ResidentialLine2" class="form-control" placeholder="Address" required=""/>
                                </div>




                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>State:</strong></li>
                                            <li id="resStateErr" style="display:none;" class="style-li error-red" >State can not be blank.</li>
                                       </ul>
                                    </div>
                                   <cf:select path="resState" class="form-control" onchange="getDistrict(this.value , 'residentialDistrict')">
                                        <cf:option value="0" label="Select state Name" />
									<cf:options items="${listStateMaster}" itemValue="stateId" itemLabel="stateName"/>
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
                                             <li id="residentialDistrictErr" style="display:none;" class="style-li error-red" >District can not be blank.</li>
                                       </ul>
                                    </div>
                                   <cf:select path="residentialDistrict" class="form-control" onchange="getCity(this.value , 'resCity')">
                                        
                                    </cf:select>
                                </div>

                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>City:</strong></li>
                                              <li id="resCityErr" style="display:none;" class="style-li error-red" >City can not be blank.</li>
                                       </ul>
                                    </div>
                                   <cf:select path="resCity" class="form-control">
                                      
                                    </cf:select>
                                </div>



                                <div class="form-group">
                                    <div>
                                        <ul class="lab-no">
                                            <li class="style-li"><strong>Pin Code:</strong></li>
                                                <li id="resPincodeErr" style="display:none;" class="style-li error-red" >Pin code can not be blank.</li>
                                      </ul>
                                    </div>
                                    <cf:input type="text" path="resPincode" class="form-control"  minlength="6"  maxlength="6" placeholder="Pin Code" 
                                    onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" required=""/>
                                </div>
                            </div>
                            <!-- right side ends -->
                        </fieldset>
                        <!-- Permanent address ends -->


                        <!-- captcha -->
                       <fieldset id="captcha">
                            <div class="col-md-2 col-xs-12"></div>
                        <div 
					style="width: 95%; margin-left: 32px; float: left; height: 100px; border: 1px solid #cecece;"
					class="form-group">
					<div  style="float: left">
						<div style="float: left; width: 98%;">
						             
							<label id="captchaError"
								style="float: left; width: 99%; font-family: Calibri; margin-left: 0px;">Please
								enter captcha in below textbox !!!</label>
						</div>

						<div style="float: left; width: 99%;">

							<input type="text" id="txtCaptcha"
								style="background-image: url(1.jpg); text-align: center; border: none; width: 140px; margin-left: 8px; font-weight: bold; font-family: Modern"
								disabled="disabled" /> <input type="button" id="btnrefresh"
								value="Refresh" onclick="DrawCaptcha();" /> 
								 <div id="txtInputErr" style="display:none;" class="style-li error-red" >Captcha is required.</div>
                                  <input type="text" id="txtInput" placeholder="Captcha" style="width: 140px;" />

						</div>
					</div>
					<div id="chkunit" style="float: left; width: 99%;">
						<input type="checkbox" id="check"   style="margin-left: 1%;">
						<a href="#" target="_blank" class="terms-font-size"> 
						I have read and understood the Terms & Conditions and the Privacy
						Policy of FSSAI.
						</a>
					</div>
				</div>
</fieldset> 
                        <!-- button -->

                        <div class="row">
                            <div class="col-md-4 col-xs-12"></div>
                            <div class="col-md-4 col-xs-12">
                            <cf:input path="logId"  type="hidden"/>
                                <input type="submit"  style="width: 100%;" class="btn login-btn" id="createUpdateBtn"  value="Register" />
                                
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
	<!--   validation function -->
   <script>
   
   
   function validateFields(){
	   var isUpdate = '${isUpdate}';

   	 //alert($("#userType").val());
   	// alert($("#holidayReason").val());
   		 $("#userTypeErr").css("display" , "none");
			$("#titleErr").css("display" , "none");
		$("#correspondencePincodeErr").css("display", "none");
		$("#correspondencePincodeErr1").css("display", "none");
		$("#mobileErr").css("display" , "none");
		$("#AadharNumberErr").css("display" , "none");
		$("#firstNameErr").css("display" , "none");
		$("#MiddleNameErr").css("display" , "none");
		$("#LastNameErr").css("display" , "none");
		$("#FatherNameErr").css("display" , "none");
		$("#empIDErr").css("display" , "none");
		$("#dobErr").css("display" , "none");
		$("#correspondenceAddress1Err").css("display" , "none");
		$("#correspondenceStateErr").css("display" , "none");
		$("#EmailErr").css("display" , "none");
		 $("#correspondenceDistrictErr").css("display" , "none");
		 $("#correspondenceCityErr").css("display" , "none");
		 $("#txtInputErr").css("display" , "none");
		 $("#ResidentialLine1Err").css("display" , "none");
		 $("#resStateErr").css("display" , "none");
		 $("#residentialDistrictErr").css("display" , "none");
		 $("#resCityErr").css("display" , "none");
		 
		 
   	    if($("#userType").val() == ''){
   		 
   		$("#userTypeErr").css("display" , "block");
   		return false;
   	 } else if($("#AadharNumber").val().match(/^[0-9]{12}$/) == null){
 		/* alert("Please Enter 12 digit Adhar number"); */
 		 $("#AadharNumberErr").css("display" , "block");
 	     return false;
   	 }else if($("#empID").val() == ''){
   		 $("#empIDErr").css("display" , "block");
 		return false; 
   	 }else if($("#dob").val() == ''){
   		 $("#dobErr").css("display" , "block");
  		return false;
   	 }else if($("#title").val() == ''){
   		 $("#titleErr").css("display" , "block");
    		return false; 
   	 }else if($("#firstName").val() == ''){
   		 $("#firstNameErr").css("display" , "block");
 		return false; 
	 }else if($("#MiddleName").val() == ''){
   		 $("#MiddleNameErr").css("display" , "block");
 		return false; 
	 } else if($("#LastName").val() == ''){
   		 $("#LastNameErr").css("display" , "block");
  		return false; 
 	 }else if($("#FatherName").val() == ''){
   		 $("#FatherNameErr").css("display" , "block");
   		return false; 
  	 }else if($("#correspondenceAddress1").val() == ''){
   		 $("#correspondenceAddress1Err").css("display" , "block");
    		return false; 
  	 }
  	 else if($("#correspondenceState").val() == 0){
   		 $("#correspondenceStateErr").css("display" , "block");
  		return false; 
 	 }else if($("#Email").val() == ''){
   		 $("#EmailErr").css("display" , "block");
   		return false; 
  	 }else if($("#correspondenceDistrict").val() == 0){
   		 $("#correspondenceDistrictErr").css("display" , "block");
    		return false;
  	 }else if($("#correspondenceCity").val() == 0){
   		 $("#correspondenceCityErr").css("display" , "block");
    		return false;
  	 }else if($("#correspondencePincode").val().match(/^[0-9]{6}$/) == null){
  		 alert("invalid pin");
  		 $("#correspondencePincodeErr").css("display" , "block");
  		return false;
  	 }else if($("#mobile").val().match(/^[0-9]{10}$/) == null){
    	
      		 $("#mobileErr").css("display" , "block");
      		return false;
  	 }
   	   
   	
   	else  if($("#ResidentialLine1").val() == ''){
  		 $("#ResidentialLine1Err").css("display" , "block");
   		return false;
	 }
   	   
  
	else if($("#resState").val() == 0){
		 $("#resStateErr").css("display" , "block");
 		return false;
	 }
	else if($("#residentialDistrict").val() == 0){
		 $("#residentialDistrictErr").css("display" , "block");
		return false;
	 }
	
	else if($("#resCity").val() == 0){
		 $("#resCityErr").css("display" , "block");
		return false;
	 }
	else if($("#resPincode").val().match(/^[0-9]{6}$/) == null){
		 $("#resPincodeErr").css("display" , "block");
		return false;
	} 
		else if(!(isUpdate !=null && isUpdate== "Y")){
			if($("#txtInput").val() == ''){
			 $("#txtInputErr").css("display" , "block");
			return false;
		
	 }
   	 var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
     var str2 = removeSpaces(document.getElementById('txtInput').value);
     if (!(str1 == str2)) {
    	 alert("Please Enter correct captcha");
         document.getElementById('txtInput').value = "";
         return false;
     }
		}
   	 if($("#check").is(":checked")== false){
   		 alert("click on check box");
   		 return false;
  	 } 
    }
   

 

   // Remove the spaces from the entered and generated code
   function removeSpaces(string) {
       return string.split(' ').join('');
   }

 


   
   </script>
	