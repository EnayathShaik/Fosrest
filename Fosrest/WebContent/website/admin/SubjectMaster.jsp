<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

<ct:url var="addAction" value="/SubjectMaster/add.fssai"></ct:url>
<cf:form action="${addAction}" method="POST"
	commandName="SubjectMasterForm" onsubmit="return validateFields();" enctype="multipart/form-data">

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
									class="orange-font">Welcome ${userName}</span>
								</a>
							</div>
						</div>
						<!-- add the content here for main body -->
						<!-- timeline  -->
						<div class="row">

							<div class="col-xs-12">
								<h1>
									Subject Master <label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Search Subject Master</legend>
											<!-- table starts here -->
											<!-- left side -->
											<div class="col-md-6 col-xs-12">
                                              <cf:input path="subjectId" type="hidden" />


										 <%-- <div class="form-group">
													<cf:input path="moduleId" type="hidden" />
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong> Subject Name:</strong></li>
														 <li id="unitIdErr" style="display:none;" class="style-li error-red" >Please Select Subject Name.</li>
                                                        <li class="style-li error-red"> </li>


														</ul>
													</div>
													<cf:select path="unitId" class="form-control">
														<cf:option value="0" label="Select Subject Name" />
														<cf:options items="${listUnitMaster}" itemValue="unitId"
															itemLabel="unitName" />
														<!-- itemlabel -->
													</cf:select>

												</div>  --%>
												<div class="form-group">
													<div>
														<ul class="lab-no">
															<li class="style-li"><strong>Subject Name:</strong></li>
															<li class="style-li error-red">*</li>
															<li id="subjectNameErr" style="display:none;" class="style-li error-red" >Subject name can not be blank.</li>
															<!-- <li id="subjectNameErr2" style="display:none;" class="style-li error-red" >Subject Name should be minimum 3 characters.</li> -->

														</ul>
													</div>
													<cf:input type="text" path="subjectName" 
														placeholder="Select Subject Name" class="form-control" />
												</div>
												<br>
												
												 <div class="form-group">
												    <div>
														<ul class="lab-no">
															<li class="style-li"><strong>Upload Study Material:</strong></li>
															<li class="style-li error-red"></li>
														</ul>
													</div>
									              <input class="btn login-btn" type="file" id="file" name="file"/>
									          
                                                  <!-- <input type="submit" class="btn login-btn" value="Upload"> -->
                                                     </div>          
								                  
								             
                                             
											</div>
											
											<!-- right side -->
											<div class="col-md-6 col-xs-12">
											
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
											<legend>Subject Master</legend>
										<ct:if test="${!empty listSubjectMaster}">
									<table border="1" id="datatablesfosrest" class="table table-bordered table-responsive">
													<thead>
														<tr class="background-open-vacancies">
															<th>S.No.</th>
															 <th>Subject Name</th>
															<th>Study Material</th>
															<th>Status</th>
															<th>Edit</th>
															<th>Delete</th>
														</tr>
													</thead>
													
													<ct:forEach items="${listSubjectMaster}" var="SubjectMaster" varStatus="loop">
														<tr>
															<td>${loop.count}</td>
															
															<td>${SubjectMaster[10]}</td>
															
															<td><ct:choose>
														<ct:when test="${ SubjectMaster[1]== 'No Study-Material'}">No Study-Material</ct:when>
																	<ct:otherwise><a href="${SubjectMaster[1]}" target="_blank" >${SubjectMaster[1]}</a></ct:otherwise> 
															</ct:choose></td>
															
															<%-- <td><a href="">Fosrest/Subject/${SubjectMaster[10]}</a></td> --%>
															<td><ct:choose>
														<ct:when test="${ SubjectMaster[8]== 'A'}">Active</ct:when>
																	<ct:otherwise>In-Active</ct:otherwise>
															</ct:choose></td>
															
															<td><button 
																	onclick='editSubject(${SubjectMaster[0]});return false;'>Edit</button></td>
															<td>
															<a href="<ct:url value='/SubjectMaster/remove/${SubjectMaster[0]}.fssai' />">Delete</a></td>
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
            function editSubject(id){
               
                //alert(id);
                 var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	    url: 'SubjectMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#subjectId").val(mainData1.subjectId);
            	    $("#subjectName").val(mainData1.subjectName);
            	    $("#status").val(mainData1.status);
            	    $("#contentLink").val(mainData1.contentLink);
            	  /*   $("#contentName").val(mainData1.contentName);
            	    $("#contentLink").val(mainData1.contentLink);
            	    $("#contentType").val(mainData1.contentType); */
            	   /*  $("#unitId").val(mainData1.unitMaster.unitId); */
            	    
            	      document.getElementById("subjectName").readOnly = true;
            	      $("#updatebtn").css("display" , "block");
            	     $("#createbtn").css("display" , "none");
            	     $("#studyMaterial").css("display" , "block");
            	    
            	      }
            	      });     
                 
                }
            
            
            
            function validateFields(){
            	
           	
           	 $("#contentNameErr").css("display" , "none");
           	 $("#subjectNameErr").css("display" , "none");
           	 $("#contentTypeErr").css("display" , "none"); 
           	 $("#contentLinkErr").css("display" , "none");
           
          
           	 
           	 if($("#subjectName").val()== ''){
          		 $("#subjectNameErr").css("display" , "block");
        		return false; 
       	 }
           	/* else 	if($("#subjectName").val().match(/^[a-zA-Z]{3,}/ )== null){
      		 $("#subjectNameErr2").css("display" , "block");
     		return false; 
    	 } */
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

