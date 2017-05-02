<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
        <!-- @author Jyoti Mekal -->
<script src="website/js/commonController.js"></script>
   			  <ct:url var="addAction" value="/RegionMaster/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="RegionMasterForm" onsubmit="return validateFields();">

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
                                                <h1>Region Master <label id="created">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
												                           <fieldset>
                                        <legend>Search Region Master</legend>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-md-6 col-xs-12">
                                            
                                            <cf:input path="regionId" type="hidden" />
                                             <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> State Name:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                         <li id="stateIdErr" style="display:none;" class="style-li error-red" >State should not be blank.</li>
                                                    </ul>
                                                </div>
                                                <cf:select path="stateId" class="form-control" onchange="getDistrict(this.value , 'districtId')">
													<cf:option value="0" label="Select state Name" />
													<cf:options items="${listStateMaster}" itemValue="stateId" itemLabel="stateName"/>
													</cf:select>
                                            </div>
                                            
                                              <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> City Name:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                         <li id="cityIdErr" style="display:none;" class="style-li error-red" >City should not be blank.</li>
                                                    </ul>
                                                </div>
                                                <cf:select path="cityId" class="form-control">
													<cf:option value="0" label="Select City Name" />
													<cf:options items="${listCityMaster}" itemValue="cityId" itemLabel="cityName"/>
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
                                                        <li class="style-li"><strong> District Name:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                         <li id="districtIdErr" style="display:none;" class="style-li error-red" >District should not be blank.</li>
                                                    </ul>
                                                </div>
                                                <cf:select path="districtId" class="form-control" onchange="getCity(this.value , 'cityId')">
													<cf:option value="0" label="Select District Name" />
													<cf:options items="${listDistrictMaster}" itemValue="districtId" itemLabel="districtName"/>
													</cf:select>
                                            </div>
                                            
                                            
                                            
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Region Name:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                         <li id="regionNameErr" style="display:none;" class="style-li error-red" >Region should not be blank.</li>
                                                    </ul>
                                                </div>
                                                <cf:input type="text" path="regionName"  placeholder="Region Name" class="form-control"/> 
                                            </div>
                                            
                                        
                                            
                                            <div class="row">
                                                <div class="col-md-6 col-xs-12" style="margin-top: 25px;">
                                                   <input type="submit"  id="updatebtn" style="display:none;float: right;margin-right: 122px;"
														value="Update" class="btn login-btn"/>
												
												
													<input type="submit" id="createbtn"
														value="Create"  class="btn login-btn"/>
												
                                                </div>
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
                                           <legend>Region Master</legend>
                                            <ct:if test="${!empty listRegionMaster}">
                                           <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>State Name</th>
                                                        <th>District Name</th>
                                                        <th>City Name</th>
                                                        <th>Region Name</th>
                                                        <th>Status</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listRegionMaster}" var="RegionMaster" varStatus="loop">
                                                <tr>
												<td>${loop.count}</td>
												<td>${RegionMaster.cityMaster.districtMaster.stateMaster.stateName}</td>
												<td>${RegionMaster.cityMaster.districtMaster.districtName}</td>
												<td>${RegionMaster.cityMaster.cityName}</td>
												<td>${RegionMaster.regionName}</td>
												<td><ct:choose><ct:when test="${ RegionMaster.status == 'A'}">Active</ct:when> <ct:otherwise>In-Active</ct:otherwise></ct:choose></td> 
												<td><button onclick='editRegion(${RegionMaster.id});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/RegionMaster/remove/${RegionMaster.id}.fssai' />" >Delete</a></td>
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
            function editRegion(id){
               // alert(id);
                
                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'RegionMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#regionId").val(mainData1.id);
            	    $("#stateId").val(mainData1.cityMaster.districtMaster.stateMaster.stateId);
            	    $("#districtId").val(mainData1.cityMaster.districtMaster.districtId);
            	    $("#cityId").val(mainData1.cityMaster.cityId);
            	    $("#regionName").val(mainData1.regionName);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }

          
            function validateFields(){
            	 $("#stateIdErr").css("display" , "none");
            	 $("#districtIdErr").css("display" , "none");
            	 $("#cityIdErr").css("display" , "none");
            	 $("#regionNameErr").css("display" , "none");
            	 
                   	if($("#stateId").val() == 0){
                  		 $("#stateIdErr").css("display" , "block");
                   		return false; 
                  	 }
                   	if($("#districtId").val() == 0){
                 		 $("#districtIdErr").css("display" , "block");
                  		return false; 
                 	 }
                   	if($("#cityId").val() == 0){
                    		 $("#cityIdErr").css("display" , "block");
                     		return false; 
                    	 }
                	if($("#regionName").val() == 0){
               		 $("#regionNameErr").css("display" , "block");
                		return false; 
               	 }
               }
               
            </script>
