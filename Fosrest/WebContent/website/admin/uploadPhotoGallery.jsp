<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <ct:url var="addAction" value="/uploadphotogallery.fssai"></ct:url>
 --%><cf:form action="uploadphotogallery.fssai" method="POST" enctype="multipart/form-data"  onsubmit="return validateFields();">

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
									Photo Gallery<label id="created">${created }</label>
								</h1>
								<div class="row">
									<div class="col-xs-12">
										<fieldset>
											<legend>Photo Gallery</legend>
											<!-- table starts here -->
											<!-- left side -->
											<div class="col-md-6 col-xs-12">
                                           <div class="form-group">
												    <div>
														<ul class="lab-no">
															<li class="style-li"><strong>Upload Photo:</strong></li>
															<li class="style-li error-red"></li>
														</ul>
													</div>
									              <input class="btn login-btn" type="file" id="file" name="file"/>
									          
                                                  <!-- <input type="submit" class="btn login-btn" value="Upload"> -->
                                                     </div>          
								                  
								             
                                             
											</div>
											
											<!-- right side -->
											<div class="col-md-6 col-xs-12">
											
											<div class="row">
													<div class="col-md-6 col-xs-12" style="margin-top: 25px; margin-left: -60px;">
														 <input type="submit" id="createbtn" value="Upload"
															class="btn login-btn"/>

													</div>
													
												</div>
											</div>
										</fieldset>
									</div>


								</div>
							</div>

							<!-- search Results -->
							<%-- <div class="col-xs-12 " id="testt">

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
															
															<td><a href="">Fosrest/Subject/${SubjectMaster[10]}</a></td>
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
							</div> --%>
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
             function validateFields(){
            	var fileName= $('#file').val();
     		var n = fileName.lastIndexOf(".");
         if(fileName.charAt(n+1)=='j'||fileName.charAt(n+1)=='p'){
        	  if(fileName.charAt(n+2)=='p'||fileName.charAt(n+2)=='n')
        		  if(fileName.charAt(n+3)=='e'||fileName.charAt(n+3)=='g')
        			return true;   
          }
         else{
        	 alert("Please Select Image Only");
        	 return false;
          }
      }
            
            
            </script>

