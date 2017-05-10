<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="website/js/jquery-toaster/jquery.toaster.js"></script>



<ct:url var="addAction" value="/regionMapping/add.fssai"></ct:url>
<cf:form action="${addAction}" name="myForm" method="POST"
	commandName="RegionMappingForm" onsubmit="return validateFields();">

	<section>
		<%@include file="/website/roles/top-menu.jsp"%>
	</section>
	<!-- main body -->
	<section class="main-section-margin-top">
		<div class="container-fluid">
			<div id="wrapper">
				<!-- Sidebar -->
				<%@include file="/website/roles/slider.jsp"%>
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
									Region Mapping <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Region Mapping</legend>
											<cf:input path="id" type="hidden" />

											<!-- left side -->
											<div class="col-xs-6">
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Region Name: <span
																	style="color: red;">*</span>

															</strong></li>
															<li id="regionNameErr" style="display: none;"
																class="style-li error-red">Region Name should not
																be blank.</li>

														</ul>
													</div>
													<cf:input path="regionName" placeholder="Region Name"
														class="form-control" />

												</div>

											</div>
											<!-- right side -->
											<div class="row">

												<!-- left -->
												<div class="col-xs-6">

													<div class="form-group">
														<div>
															<ul class="lab-no">
																<li class="style-li"><strong>District:</strong></li>
																<li class="style-li error-red"></li>
																<li id="districtErr" style="display: none;"
																	class="style-li error-red">District should not be
																	blank.</li>
															</ul>
														</div>

														<cf:select path="district" class="form-control">
															<cf:option value="" label="Select District" />
															<cf:options items="${DistrictMap}" />
														</cf:select>
													</div>


													<input type="submit" id="updatebtn"
														style="display: none; /* float: right; */ margin-right: 122px;"
														value="Update" class="btn login-btn" /> <input
														type="submit" id="createbtn" value="Create"
														class="btn login-btn" />
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
											<legend>Region Mapping</legend>
											<ct:if test="${!empty listRegionMapping}">
												 <table border="1" id="datatablesfosrest" class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															<th>Region Name</th>
															<th>District</th>
															<th>Edit</th>
															<th>Delete</th>
														</tr>
													</thead>

													<ct:forEach items="${listRegionMapping}"
														var="RegionMapping" varStatus="loop">

														<tr>
															<td>${loop.count}</td>
															<td>${RegionMapping.regionName}</td>
															<td>${RegionMapping.district}</td>
														 <td><button
																	onclick='editRegion(${RegionMapping.id});return false;'>Edit</button></td>
															<td><a
																href="<ct:url value='/RegionMapping/remove/${RegionMapping.id}.fssai' />">Delete</a></td>
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

function editRegion(id){

                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'regionMapping/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#id").val(mainData1.id);
            	    $("#regionName").val(mainData1.regionName);
            	    $("#district").val(mainData1.district);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }
                 
               function validateFields(){
                     
                  	if($("#regionName").val() == ''){
                 		 $("#regionNameErr").css("display" , "block");
                  		return false; 
                 	 }
                  	if($("#district").val() == 0){
                		 $("#districtErr").css("display" , "block");
                 		return false; 
                	 }
              }
                </script>