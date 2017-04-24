<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
         
            
        
            <ct:url var="addAction" value="/TaxMaster/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="TaxMaster" >

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
                                                <h1>Tax Master <label id="created">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
													<fieldset>
                                        <legend>Tax Master</legend>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-md-6 col-xs-12">
                                            <div class="form-group">													
														<cf:input path="taxId" type="hidden" /> 

													<div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Service Tax Rate:</strong></li>
                                                        <li > <cf:errors path="serviceTaxRate" style="color:red" ></cf:errors> </li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" path="serviceTaxRate" id="serviceTaxRate" name="serviceTaxRate" type="text" placeholder="service Tax Rate"/> </div>
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Swaccha Bharat Cess:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" type="text"  path="swacchaBharatCess" id="swacchaBharatCess" name="swacchaBharatCess" placeholder="Swaccha Bharat Cess"/>
                                                 </div>
                                                
                                            <div class="row">
                                            
                                               <!-- left -->
                                             <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>krishi Kalyan Cess:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" type="text"  path="krishiKalyanCess" id="krishiKalyanCess" name="krishiKalyanCess" placeholder="krishi Kalyan Cess"/>
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
                                            <ct:if test="${!empty listTaxMaster}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>service Tax Rate</th>
                                                        <th>swaccha Bharat Cess</th>
                                                        <th>krishi Kalyan Cess</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr> 
                                                </thead>
                                                
                                               	<ct:forEach items="${listTaxMaster}" var="TaxMaster">
										
										
											<tr>
												<td>${TaxMaster.taxId}</td>
												<td>${TaxMaster.serviceTaxRate}</td>
												<td>${TaxMaster.swacchaBharatCess}</td>
												<td>${TaxMaster.krishiKalyanCess}</td>
												  
												<td><button onclick='editTax(${TaxMaster.taxId});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/TaxMaster/remove/${TaxMaster.taxId}.fssai' />" >Delete</a></td>
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
      
                function editTax(id){
               // alert(id);
                
                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'TaxMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#taxId").val(mainData1.taxId);
            	    $("#serviceTaxRate").val(mainData1.serviceTaxRate);
            	    $("#swacchaBharatCess").val(mainData1.swacchaBharatCess);
            	    $("#krishiKalyanCess").val(mainData1.krishiKalyanCess);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }

            </script>
