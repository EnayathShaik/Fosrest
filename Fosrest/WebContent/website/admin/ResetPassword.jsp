<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
 
   
<ct:url var="addAction" value="/addResetPassword.fssai" ></ct:url>
           
 <cf:form action="${addAction}" name="myForm" method="POST" commandName="LoginDetails" onsubmit="return validateFields();">

                <section>
                    <%@include file="../roles/top-menu.jsp"%>
                </section>
                <!-- main body -->
                <section class="main-section-margin-top">
                    <div class="container-fluid">
                        <div id="wrapper">
                            <!-- Sidebar -->
                            <%@include file="../roles/slider.jsp" %>
                                <!-- /#sidebar-wrapper -->
                                <!-- Page Content -->
                                <div id="page-content-wrapper">
                                    <div class="container-fluid">
                                        <!-- vertical button -->
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome ${userName} </span>
                                                </a>
                                            </div>
                                        </div>
                                        <!-- add the content here for main body -->
                                        <!-- timeline  -->
                                        <div class="row">

                                            <div class="col-xs-12">
                                               <%--  <h1>Reset Password <label id="created">${created }</label></h1> --%>
                                                <div class="row">
                                                    <div class="col-xs-12">
													<fieldset>
                                        <legend>Reset Password</legend>
                                        <span id="name_status" class = "style-li error-red"><h3>${created } </h3></span>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        
                                         <div class="col-md-6 col-xs-12">
                                            <div class="form-group">													
												<cf:input path="id" type="hidden" />  

													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>UserName/UserID:</strong></li>
															<li class="style-li error-red">*</li>
															<li id="loginIdErr" style="display:none;" class="style-li error-red" >UserName/UserID can not be blank.</li>
														</ul>
													</div>
													<cf:input type="text" path="loginId" 
														placeholder="UserName/UserID" class="form-control" />
												</div>
           
                                          <div class="input-group">
                                                <div>
														<ul class="lab-no">
															<li class="style-li"><strong>New Password:</strong></li>
															<li class="style-li error-red">*</li>
															<li id="PasswordErr" style="display:none;" class="style-li error-red" >New Password can not be blank.</li>
															</ul>
													</div>
													<cf:input type="password" id = "password" class="form-control" path="Password" placeholder="New Password"/>
													 <%-- <cf:input id = "password" type="password" path="Password" class="form-control" placeholder="password" /> --%>
													<span class="input-group-btn">
													  <button id= "show_password" class="btn btn-secondary" type="button" style="margin-bottom: -26px; height: 36px;margin-left:0px;">
								                        <span class="glyphicon glyphicon-eye-open"></span>
							                          </button></span>
												</div> 
												
			  </div>
			</div>
		</div>
                                            
                                               <!-- left -->
                                          <br> 
												<div class="form-group">
                                                    <input type="submit" class="btn login-btn" style="margin-left: 140px;" value="Reset Password" />
                                                     </div>
                                            
                                                
                                            </div>
                                        </div>
                                            
                                        <!-- right side -->
                                        <div class="col-md-6 hidden-xs"> </div>
                                   
                         

                                                    </div>


                                                </div>
                                            </div>

                                            <!-- search Results -->
                                            <div class="col-xs-12 " id="testt">

                                                <!-- table -->
                                                
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
               function validateFields(){
                		$("#PasswordErr").css("display" , "none");
                		$("#loginIdErr").css("display" , "none");
                		
                		if($("#loginId").val() == ''){
                   		 
                     		$("#loginIdErr").css("display" , "block");
                     		return false;
                     	 } 
                		
                	 if($("#Password").val() == ''){
                		 
                		$("#PasswordErr").css("display" , "block");
                		return false;
                	 } 
                	 

                 }
               
               $('#show_password').hover(function functionName() {
					//Change the attribute to text
					$('#password').attr('type', 'text');
					$('.glyphicon').removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close');
				}, function () {
					//Change the attribute back to password
					$('#password').attr('type', 'password');
					$('.glyphicon').removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open');
				}
			);

            </script>
