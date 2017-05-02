<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
        <!-- @author Jyoti Mekal -->

   			  <ct:url var="addAction" value="/DistrictMaster/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="DistrictMasterForm" onsubmit="return validateFields();">

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
                                                <h1>District Master <label id="created">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
												                           <fieldset>
                                        <legend>Search District Master</legend>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-md-6 col-xs-12">
                                            
                                            <cf:input path="districtId" type="hidden" />
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> State Name:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                         <li id="stateIdErr" style="display:none;" class="style-li error-red" > State should not be blank.</li>
                                                    </ul>
                                                </div>
                                                <cf:select path="stateId" class="form-control">
													<cf:option value="0" label="Select state Name" />
													<cf:options items="${listStateMaster}" itemValue="stateId" itemLabel="stateName"/>
													</cf:select>
                                            </div>
                                              <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> Status:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                           	<cf:select path="status" class="form-control">
                                             <cf:option value="A" label="Active" />
                                              <cf:option value="I" label="In-Active" />
                                              </cf:select>
                                            </div>
                                            
                                        </div>
                                        <!-- right side -->
                                        <div class="col-md-6 col-xs-12">
                                            
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>District Name:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                       <li id="districtNameErr" style="display:none;" class="style-li error-red" > District should not be blank.</li>

                                                    </ul>
                                                </div>
                                                <cf:input type="text" path="districtName"  placeholder="District Name" class="form-control"/> 
                                            </div>
                                        
                                            <div class="row">
                                               <input type="submit"  id="updatebtn" style="display:none;float: right;margin-right: 122px;"
														value="Update" class="btn login-btn"/>
												
												
													<input type="submit" id="createbtn"
														value="Create"  class="btn login-btn" onclick="return validateFields();"/>
                                                <div class="col-md-6 col-xs-12" style="margin-top: 25px;">
                                                   <!--   <button  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false">Show Details</button> -->
                                                </div>
                                            </div>
                                        </div>
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
                                           <legend>District Master</legend>
                                            <ct:if test="${!empty listDistrictMaster}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>State Name</th>
                                                        <th>District Name</th>
                                                        <th>Status</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listDistrictMaster}" var="DistrictMaster" varStatus="loop">
                                              <tr>
										<td>${loop.count}</td>
												 <td>${DistrictMaster.stateMaster.stateName}</td> 
												<td>${DistrictMaster.districtName}</td>
												<td><ct:choose><ct:when test="${ DistrictMaster.status == 'A'}">Active</ct:when> <ct:otherwise>In-Active</ct:otherwise></ct:choose></td> 
												<td><button onclick='editDistrict(${DistrictMaster.districtId});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/DistrictMaster/remove/${DistrictMaster.districtId}.fssai' />" >Delete</a></td>
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
            function editDistrict(id){                
                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'DistrictMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#districtId").val(mainData1.districtId);
            	    $("#stateId").val(mainData1.stateMaster.stateId);
            	    $("#districtName").val(mainData1.districtName);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }

            function validateFields(){
            	  $("#stateIdErr").css("display" , "none");
            	  $("#districtIdErr").css("display" , "none");
                     	if($("#stateId").val() == 0){
                    		 $("#stateIdErr").css("display" , "block");
                     		return false; 
                    	 }
                     	if($("#districtName").val() == 0){
                   		 $("#districtNameErr").css("display" , "block");
                    		return false; 
                   	 }
              }

            </script>
