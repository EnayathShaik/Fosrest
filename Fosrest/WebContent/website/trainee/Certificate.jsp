<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>

               
<!--

//-->
</script>

 <%-- <ct:url var="addAction" value="/TrainingSchedule/add.fssai" ></ct:url> --%>
<cf:form action="ListCertificate.fssai" name="myForm" method="POST" commandName="CertificateForm" onsubmit="return validateFields();"> 

    <section>
         <%@include file="../roles/top-menu.jsp"%>
    </section>
    <!-- main body -->
    <section class="main-section-margin-top">
        <div class="container-fluid">
            <div id="wrapper">
                <!-- Sidebar -->
                <div > <%@include file="../roles/slider.jsp" %>
                </div>
                <!-- /#sidebar-wrapper -->
                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <!-- vertical button -->
                        <div class="row">
                            <div class="col-lg-12">
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Trainee</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                        <div class="row">

                                <div class="col-xs-12">
                                    <h1></h1>
                                   <%--  <div class="row">
                                        <div class="col-xs-12">

                                            <!-- left side -->
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Type:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="trainingType" class="form-control">
													<cf:option value="" label="Select training" />
													<cf:options items="${trainingType}" />
												</cf:select>
											</div>
                                                
                                               <div class="form-group">
                                                    <div>
													<ul class="lab-no">
														<li class="style-li"><strong>Status:</strong></li>
														<li class="style-li error-red"><cf:errors
																path="status" cssClass="error" /></li>
													</ul>
												</div>
  																<cf:select path="status" class="form-control">
                                                                    <cf:option value="A" label="Completed" />
                                                                    <cf:option value="I" label="Confirmed" />
                                                                </cf:select>

                                                </div>
                                                
                                            
                                            </div> <!-- left side ends -->

                                            <!-- right side -->
                                            <div class="col-xs-6">

											<div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training Start Date:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												
                                         		<cf:input path="startDate" type="text" class="form-control" />
                                                </div>
                                                

											<div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Training End Date:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												
                                         		<cf:input path="endDate" type="text" class="form-control" />
                                                </div>
                                                
                                         
                                         
                                                
                                            </div> <!-- rigth side ends -->
                                            
                                            <!-- button -->
                                            <div class="row">
                                                <div class="col-md-6 col-xs-12"></div>
                                                
                                                <div class="col-md-6 col-xs-12">

                                                    <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Search"/> 
                                               
                                                </div>
                                            </div>
                                           
                                        </div>

                                       
                                    </div>
                                </div>

                                 --%>
                                <!-- search Results -->
                                            <div class="col-xs-12 " id="testt">

                                                <!-- table -->
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                            <fieldset>
                                           <legend>Certificate</legend>
                                         <ct:if test="${!empty listCertificate}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Training Type</th>
                                                         <th>Completion Status</th>
                                                          <th>Certificate Available</th>
                                                           <th>Generate Certificate</th>
                                                       
                                                        
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listCertificate}" var="Certificate" varStatus="loop">
                                                <tr>
												<td>${loop.count}</td>
												<td>${Certificate.trainingType}</td>
												<td>${Certificate.completionStatus}</td>
												<td>${Certificate.certificateAvailable}</td>
												
												<%-- <a href="GetCertificate.fssai?userId=${Certificate.id}">GET CERTIFICATE</a> --%>
                                                <!--  <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Get Certificate"/> --> 												
                                                <ct:choose>
                                                <ct:when test="${Certificate.certificateAvailable=='YES'}">
                                                <td>${Certificate.generateCertificate}
                                                <a href="GetCertificate.fssai?userId=${Certificate.id}" >GET CERTIFICATE</a>
                                                </td>
                                                </ct:when>
                                              <ct:otherwise>
                                                <td>${Certificate.generateCertificate}
												<!-- <a href=""> -->NO CERTIFICATE</a> 
                                                        </td>
                                                </ct:otherwise> 
                                                </ct:choose>
                                                
                                                 </tr>
												</ct:forEach>
                                            </table>
                                           </ct:if> 
                                        </fieldset>
												
                                                       
                                                        
                                              
											
										
                                                    </div>
                                                </div>
                                            </div>
                             <!-- search div ends -->
                        </div><!-- row ends -->
                    </div>
                </div>
            </div>
        </div>
    </section>
 
 <input type="hidden" id="idHidden" value="" />
 <input type="hidden" id="hiddenCourseType" value="" />                                             
   </cf:form>