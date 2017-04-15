<%@page import="org.springframework.ui.Model"%>
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
          
        	<ct:url var="addAction" value="/ModuleMaster/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="ModuleMasterForm" onsubmit="return validateFields();">

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
                                                <h1>Module Master <label id="created">${created }</label></h1>
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
                                                        
                                                         <li id="unitIdErr" style="display:none;" class="style-li error-red" > Holiday Date can not be blank.</li>
                                         
                                                    </ul>
                                                </div>
                                                  <cf:select path="unitId" class="form-control">
													<cf:option value="0" label="Select Unit Name" />
													<cf:options items="${listUnitMaster}" itemValue="unitId" itemLabel="unitCode"/><!-- itemlabel -->
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
                                            
                                              <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Content Name:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                    <cf:input type="text" path="contentName"  placeholder="Content Name" class="form-control"/>
                                            </div>
  
                                        </div>
                                        <!-- right side -->
                                        <div class="col-md-6 col-xs-12">
                                            
                                        
                                            
                                            
                                            <div class="form-group">
                                                                   <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Module Name:</strong></li>
                                                        <li class="style-li error-red"><cf:errors path="moduleName" value=""></cf:errors> </li>
                                                        
                                                    </ul>
                                                </div>
                                                    <cf:input type="text" path="moduleName"  placeholder="Module Name" class="form-control"/>
                                            </div>
                                            
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> Content Type:</strong></li>
                                                        <li class="style-li error-red"> </li>
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
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                    <cf:input type="text" path="contentLink"  placeholder="Content Link" class="form-control"/>
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
                                           <legend>Module Master</legend>
                                           <ct:if test="${!empty listModuleMaster}">
                                            <table class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Module Name</th>
                                                        <th>Status</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                   </tr>
                                                </thead>
                                                  <ct:forEach items="${listModuleMaster}" var="ModuleMaster">
                                                <tr>
												<td>${ModuleMaster.moduleId}</td>
												<td>${ModuleMaster.moduleName}</td>
												<td><ct:choose><ct:when test="${ ModuleMaster.status == 'A'}">Active</ct:when> <ct:otherwise>In-Active</ct:otherwise></ct:choose></td> 
												<td><button onclick='editModule(${ModuleMaster.moduleId});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/ModuleMaster/remove/${ModuleMaster.moduleId}.fssai' />" >Delete</a></td>
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
                alert(id);
                
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
            	    $("#unitId").val(mainData1.unitMaster.unitId);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                 
                }
            
            
            function validateFields(){
           	 alert($("#moduleName").val());
           	 
           	 alert($("#unitId").val());
           	 if($("#moduleName").val() == ''){
           		 
           		$("#modNameErr").css("display" , "block");
           		return false;
           	           	 }
           	 else if($("#unitId").val() == ''){
           		 
            		$("#unitIdErr").css("display" , "block");
            		return false;
            	           	 }

            }

            </script>

            <!--     <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Module Name:<font color="red"><cf:errors path="moduleName" cssClass="form-control" cssStyle="error" /></font></strong>
                                                        </li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                	 <div> <cf:input  type="text" class="form-control" path="moduleName" placeholder="Name"/>
                            						<%-- 	<cf:errors path="moduleName" cssClass="style-li error-red" element="div"/> --%>
                            							</div>
                            							${aa}	
															<ct:if test="${aa}<0" >                         							
                            								<div id="moduleName.errors" class="style-li error-red">username is required!</div>
                            								</ct:if> 
                                                  <%--   <cf:input type="text" path="moduleName"  placeholder="Module Name" cssClass="form-control"/> --%>
                                            </div> -->
            
            