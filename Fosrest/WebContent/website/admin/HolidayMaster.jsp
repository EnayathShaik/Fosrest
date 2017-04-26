<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
  <script>
                function OnStart() {
                   
                	flatpickr("#holidayDate" , {
                		
                	});	
                }
                window.onload = OnStart;

            </script>
            
        
            <ct:url var="addAction" value="/HolidayMaster/add.fssai" ></ct:url>
           
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="HolidayMaster" onsubmit="return validateFields();">

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
                                                <h1>Holiday Master <label id="created">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
													<fieldset>
                                        <legend>Holiday Master</legend>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-md-6 col-xs-12">
                                            <div class="form-group">													
														<cf:input path="holidayId" type="hidden" /> 

													<div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Holiday Date:</strong></li>
                                                     <li id="holidayDateErr" style="display:none;" class="style-li error-red" >Please Select Holiday Date.</li>
                                                       </ul>
                                                </div>
                                                <cf:input class="form-control" path="holidayDate" id="holidayDate" name="holidayDate" type="text" placeholder="Date"/>
                                                
                                                 </div>
           
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">

                                                        <li class="style-li"><strong>Holiday Reason:</strong></li>
                                                        <li class="style-li error-red" id="holidayReasonErr" style="display:none;">Please Select Holiday Reason. </li>

                                                  

                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" type="text"  path="holidayReason" id="holidayReason" name="holidayReason" placeholder="Holiday Reason"/>
                                          
                                                 </div>
                                            <div class="row">
                                            
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
                                                </div> --> 
                                                
                                                
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
                                            <ct:if test="${!empty listHolidayMaster}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Holiday Date</th>
                                                        <th>Holiday Reason</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr> 
                                                </thead>
                                                
                                               	<ct:forEach items="${listHolidayMaster}" var="HolidayMaster" varStatus="loop">
										
										
											<tr>
												<td>${loop.count}</td>
												<td>${HolidayMaster.holidayDate}</td>
												<td>${HolidayMaster.holidayReason}</td>
												  
												<td><button onclick='editHoliday(${HolidayMaster.holidayId});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/HolidayMaster/remove/${HolidayMaster.holidayId}.fssai' />" >Delete</a></td>
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
                <input type="hidden" id="idH" value="" />
            </cf:form>
            <script>
             /*    var id = localStorage.getItem('activeID');
                document.getElementById(id).className = "active";
                 */
                
                 function editHoliday(id){
                    
                     
                     var name1=JSON.stringify({
                 		courseName:0
                   })
                 	$.ajax({
                 	      type: 'post',
                 	      url: 'HolidayMaster/edit/'+id+'.fssai',
                 	      contentType : "application/json",
                 		  data:name1,
                 	      success: function (response) {      
                 	      var mainData1 = jQuery.parseJSON(response);
                 	    $("#holidayId").val(mainData1.holidayId);
                 	    $("#holidayDate").val(mainData1.holidayDate);
                 	    $("#holidayReason").val(mainData1.holidayReason);
                 	     $("#updatebtn").css("display" , "block");
                 	     
                 	     $("#createbtn").css("display" , "none");
                 	      }
                 	      });     
                     
                     }

                 

                 function validateFields(){
                		$("#holidayDateErr").css("display" , "none");
                		$("#holidayReasonErr").css("display" , "none");
                	 if($("#holidayDate").val() == ''){
                		 
                		$("#holidayDateErr").css("display" , "block");
                		return false;
                	 } else if($("#holidayReason").val() == ''){
                		 $("#holidayReasonErr").css("display" , "block");
                 		return false; 
                	 }

                 }

            </script>
