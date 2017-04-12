<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
            <script>
                function OnStart() {
                   
                	flatpickr("#StateDate" , {
                		
                	});	
                }
                window.onload = OnStart;

            </script>
            
        
            <ct:url var="addAction" value="/StateMaster/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="StateMaster" onsubmit="return validateFields();">

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
                                                <h1>State Master <label id="created">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
													<fieldset>
                                        		<legend>State Master</legend>
												<cf:input path="stateId" type="hidden" /> 

                                                        <!-- left side -->
                                                        <div class="col-xs-6">
                                                            <div class="form-group">
                                                                <div>
                                                                    <ul class="lab-no">
                                                                        <li class="style-li"><strong>State Name:
														<span style="color:red;">*</span>
														</strong></li>
                                                                        <li class="style-li error-red">
                                                                            <span id="name_status"></span>
                                                                            <label class="error visibility" id="stateNameError">* error</label>
                                                                            <label id="created">${created }</label>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <cf:input path="stateName" placeholder="State Name" class="form-control" onkeyup="checkState();" />

                                                            </div>

                                                        </div>
                                            <div class="row">
                                            
                                               <!-- left -->
                                                <div class="col-xs-6">

                                                            <div class="form-group">
                                                                <div>
                                                                    <ul class="lab-no">
                                                                        <li class="style-li"><strong>Status:</strong></li>
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
                                          
												
													<input type="submit"  id="updatebtn" style="display:none;float: right;margin-right: 122px;"
														value="Update" class="btn login-btn"/>
												
												
													<input type="submit" id="createbtn"
														value="Create"  class="btn login-btn"/>
												
                                            
                                                <!-- <div class="col-md-6 col-xs-12">
                                                    <input type="submit" class="btn login-btn" value="Add"/>
                                                </div> -->
                                                <div class="col-md-6 col-xs-12">
                                                    <button type="submit" class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false">Show Details</button>
                                                </div> 
                                                
                                                
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
                                            <ct:if test="${!empty listStateMaster}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>State Name</th>
                                                        <th>Status</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr> 
                                                </thead>
                                                
                                               	<ct:forEach items="${listStateMaster}" var="StateMaster">
										
												<tr>
												<td>${StateMaster.stateId}</td>
												<td>${StateMaster.stateName}</td>
												 <td><ct:choose><ct:when test="${ StateMaster.status == 'A'}">Active</ct:when> <ct:otherwise>In-Active</ct:otherwise></ct:choose></td> 
												<td><button onclick='editState(${StateMaster.stateId});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/StateMaster/remove/${StateMaster.stateId}.fssai' />" >Delete</a></td>
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
                
                function editState(id){

                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'StateMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#stateId").val(mainData1.stateId);
            	    $("#stateName").val(mainData1.stateName);
            	    $("#status").val(mainData1.status);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }

            </script>
