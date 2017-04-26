<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
        
            <ct:url var="addAction" value="/TrainingPartner/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="TrainingPartner" onsubmit="return validateFields();">

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
                                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Admin</span>
                                                </a>
                                            </div>
                                        </div>
                                        <!-- add the content here for main body -->
                                        <!-- timeline  -->
                                        <div class="row">

                                            <div class="col-xs-12">
                                                <h1>Training Partner List<label id="created">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
													<fieldset>
                                        <legend>Training Partner</legend>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-md-6 col-xs-12">
                                            <div class="form-group">													
														<cf:input path="trainingPartnerId" type="hidden" /> 

													<div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Training Partner Name:</strong></li>
                                                        <li > <cf:errors path="trainingPartnerName" style="color:red" >*</cf:errors> </li>
                                                         <li id="trainingPartnerNameErr" style="display: none;"
															class="style-li error-red">Please Enter Partner Name.</li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" path="trainingPartnerName" type="text" placeholder="Training Partner Name"/> </div>
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Training Partner Website Link:</strong></li>
                                                        <li class="style-li error-red"> *</li>
                                                         <li id="tpWebLinkErr" style="display: none;"
															class="style-li error-red">Please Enter Website.</li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" type="text"  path="tpWebLink"  placeholder="Training Partner Website Link"/> </div>
                                 				    <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> Status:</strong></li>
                                                        <li class="style-li error-red">*</li>
                                                        <li id="statusErr" style="display: none;"
															class="style-li error-red">Please Select Status.</li>
                                                    </ul>
                                                </div>
                                           	<cf:select path="status" class="form-control">
                                             <cf:option value="A" label="Active" />
                                              <cf:option value="I" label="In-Active" />
                                              </cf:select>
                                            </div>
                                            
                                               <!-- left -->
                                          
												
													<input type="submit"  id="updatebtn" style="display:none;float: right;margin-right: 122px;"
														value="Update" class="btn login-btn"/>
												
												
													<input type="submit" id="createbtn"
														value="Create"  class="btn login-btn"/>
												
                                            
                                                <!-- <div class="col-md-6 col-xs-12">
                                                    <input type="submit" class="btn login-btn" value="Add"/>
                                                </div> -->
                                               <!--  <div class="col-md-6 col-xs-12">
                                                    <button type="button" class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" onclick='showdetails();return false;'>Show Details</button>
                                                </div>  -->
                                                
                                                
                                            </div>
                                        </div>
                                        <!-- right side -->
                                        <div class="col-md-6 hidden-xs"> </div>
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
                                            <legend>Training Schedule</legend>
                                            <ct:if test="${!empty listTrainingPartner}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Training Partner Name</th>
                                                        <th>Website Link</th>
                                                        <th>status</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr> 
                                                </thead>
                                                
                                               	<ct:forEach items="${listTrainingPartner}" var="TrainingPartner" varStatus="loop">
										
										
											<tr>
												<td>${loop.count}</td>
												<td>${TrainingPartner.trainingPartnerName}</td>
												<td>${TrainingPartner.tpWebLink}</td>
												 <td><ct:choose><ct:when test="${ TrainingPartner.status == 'A'}">Active</ct:when> <ct:otherwise>In-Active</ct:otherwise></ct:choose></td>  
												<td><button onclick='editTrainingPartner(${TrainingPartner.trainingPartnerId});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/TrainingPartner/remove/${TrainingPartner.trainingPartnerId}.fssai' />" >Delete</a></td>
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
          
            </cf:form>
            <script>
             /*    var id = localStorage.getItem('activeID');
                document.getElementById(id).className = "active";
                 */
                
                function editTrainingPartner(id){
                //alert(id);
                
                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'TrainingPartner/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#trainingPartnerId").val(mainData1.trainingPartnerId);
            	    $("#trainingPartnerName").val(mainData1.trainingPartnerName);
            	    $("#tpWebLink").val(mainData1.tpWebLink);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }
                 function validateFields(){ 
                	 $("#trainingPartnerNameErr").css("display" , "none");
                	 $("#tpWebLinkErr").css("display" , "none");
                	 $("#statusErr").css("display" , "none");
                	 
                 if($("#trainingPartnerName").val() == 0){
              		 
              		$("#trainingPartnerNameErr").css("display" , "block");
              		return false;
              	 }
             	if($("#tpWebLink").val() == 0){
               		 
              		$("#tpWebLinkErr").css("display" , "block");
              		return false;
              	 }
                 if($("#status").val() == ''){
                		 $("#statusErr").css("display" , "block");
                 		return false; 
                 }
                 }
               

            </script>
           