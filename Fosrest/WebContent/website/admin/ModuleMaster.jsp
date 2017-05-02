<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

<ct:url var="addAction" value="/ModuleMaster/add.fssai"></ct:url>
<cf:form action="${addAction}" method="POST"
	commandName="ModuleMasterForm" onsubmit="return validateFields();">

	<section>
		<%@include file="../roles/top-menu.jsp"%>
	</section>
	<!-- main body -->
	<section class="main-section-margin-top">
		<div class="container-fluid">
			<div id="wrapper">
				<!-- Sidebar -->
				<%@include file="../roles/slider.jsp"%>
				<!-- /#sidebar-wrapper -->
				<!-- Page Content -->
				<div id="page-content-wrapper">
					<div class="container-fluid">
						<!-- vertical button -->
						<div class="row">
							<div class="col-lg-12">
								<a href="#menu-toggle" class="vertical-menu-position-btn"
									id="menu-toggle"> <i class="fa fa-bars"></i> <span
									class="orange-font">Welcome Admin</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>
									Module Master <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Search Module Master</legend>
											<!-- table starts here -->
											<!-- left side -->
											<div class="col-md-6 col-xs-12">




												<div class="form-group">
													<cf:input path="moduleId" type="hidden" />
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong> Unit Name:</strong></li>
														 <li id="unitIdErr" style="display:none;" class="style-li error-red" >Please Select User Name.</li>
                                                        <li class="style-li error-red"> </li>


														</ul>
													</div>
													<cf:select path="unitId" class="form-control">
														<cf:option value="0" label="Select Unit Name" />
														<cf:options items="${listUnitMaster}" itemValue="unitId"
															itemLabel="unitCode" />
														<!-- itemlabel -->
													</cf:select>

												</div>

                                           
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong> Status:</strong></li>
															<li class="style-li error-red"></li>
															
														</ul>
													</div>
													<cf:select path="status" class="form-control">
														<cf:option value="A" label="Active" />
														<cf:option value="I" label="In-Active" />
													</cf:select>
												</div>

												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Content Name:</strong></li>
															<li class="style-li error-red"></li>
															 <li id="contentNameErr" style="display:none;" class="style-li error-red" >Please Select Content Name.</li>
                                                        <li class="style-li error-red"> </li>
															
														</ul>
													</div>
													<cf:input type="text" path="contentName"
														placeholder="Content Name" class="form-control" />
												</div>

											</div>
											<!-- right side -->
											<div class="col-md-6 col-xs-12">




												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Module Name:</strong></li>
															<li class="style-li error-red"></li>
															<li id="moduleNameErr" style="display:none;" class="style-li error-red" >Please Select module Name.</li>

														</ul>
													</div>
													<cf:input type="text" path="moduleName"
														placeholder="Module Name" class="form-control" />
												</div>

												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong> Content Type:</strong></li>
															<li class="style-li error-red"></li>
															<li id="contentTypeErr" style="display:none;" class="style-li error-red" >Please Select Content Type.</li>
															
														</ul>
													</div>
													<cf:select path="contentType" class="form-control">
														<cf:option value="0" label="Select Content Type" />
														<cf:options items="${contentType}" />
													</cf:select>
												</div>

												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Content Link:</strong></li>
															<li class="style-li error-red"></li>
															<li id="contentLinkErr" style="display:none;" class="style-li error-red" >Please Select Content link.</li>
															
														</ul>
													</div>
													<cf:input type="text" path="contentLink"
														placeholder="Content Link" class="form-control" />
												</div>

												<div class="row">
													<div class="col-md-6 col-xs-12" style="margin-top: 25px;">
														<input type="submit" id="updatebtn"
															style="display: none; float: right; margin-right: 122px;"
															value="Update" class="btn login-btn" /> <input
															type="submit" id="createbtn" value="Create"
															class="btn login-btn" />

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
											<legend>Module Master</legend>
											<ct:if test="${!empty listModuleMaster}">
												<table border="1" id="datatablesfosrest" class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Module Name</th>
															<th>Status</th>
															<th>Edit</th>
															<th>Delete</th>
														</tr>
													</thead>
													<ct:forEach items="${listModuleMaster}" var="ModuleMaster" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															<td>${ModuleMaster.moduleName}</td>
															<td><ct:choose>
																	<ct:when test="${ ModuleMaster.status == 'A'}">Active</ct:when>
																	<ct:otherwise>In-Active</ct:otherwise>
																</ct:choose></td>
															<td><button
																	onclick='editModule(${ModuleMaster.moduleId});return false;'>Edit</button></td>
															<td><a
																href="<ct:url value='/ModuleMaster/remove/${ModuleMaster.moduleId}.fssai' />">Delete</a></td>
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
            function editModule(id){
               
                
                 var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'ModuleMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#moduleId").val(mainData1.moduleId);
            	    $("#moduleName").val(mainData1.moduleName);
            	    $("#status").val(mainData1.status);
            	    $("#contentName").val(mainData1.contentName);
            	    $("#contentLink").val(mainData1.contentLink);
            	    $("#contentType").val(mainData1.contentType);
            	    $("#unitId").val(mainData1.unitMaster.unitId);
            	    
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                 
                }
            
            
            
            function validateFields(){
            	
           	 $("#unitIdErr").css("display" , "none");
           	 $("#contentNameErr").css("display" , "none");
           	 $("#moduleNameErr").css("display" , "none");
           	 $("#contentTypeErr").css("display" , "none"); 
           	 $("#contentLinkErr").css("display" , "none");
           
          
           	 if($("#unitId").val() == 0){
           		 $("#unitIdErr").css("display" , "block");
              		return false; 
           	 } 
           	else if($("#moduleName").val() == ''){
          		 $("#moduleNameErr").css("display" , "block");
        		return false; 
       	 }
            else if($("#contentType").val() == 0){
          		 $("#contentTypeErr").css("display" , "block");
         		return false; 
       	 } 	 
           	 else if($("#contentName").val() == ''){
           		 
             		$("#contentNameErr").css("display" , "block");
             		return false;
           	 
        	 }
        	
        	 else if($("#contentLink").val() == ''){
           		 $("#contentLinkErr").css("display" , "block");
           		return false;
        	 }
        	
           }
            
        

            </script>

