<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
         
            
        
            <ct:url var="addAction" value="/EmployeeMonthlyCharges/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="EmployeeMonthlyCharges" >

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
                                                <h1>MONTHLY CHARGES AS PER CANDIDATE<label id="created">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
													<fieldset>
                                        <legend>MONTHLY CHARGES AS PER CANDIDATE</legend>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-xs-6">
                                         	<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Customer</strong></li>
														<li class="style-li error-red"><span id="name_status">
														</span><span id="err"> </span> <label id=userTypeError
															class="error visibility">* Select Customer </label> <cf:errors
																path="customer" cssClass="error" />${created }</li>
													</ul>
												</div>
												<cf:input path="id" type="hidden"/>
												<cf:select path="customer" class="form-control">
													<cf:option value="" label="Select Customer" />
													<cf:options items="${listCustomerMaster}" itemValue="customerId" itemLabel="name"/>
												</cf:select>
											</div>
                                            
                                            
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>resource:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												 <cf:input class="form-control" path="resource"  type="text" placeholder="resource"/>
												 
											</div>
                                                
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>skill:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                               <cf:input class="form-control" path="skill"  type="text" placeholder="skill"/>
                                                </div>
                                                
                                                    <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>quantity:</strong></li>
                                                            <li class="style-li error-red"><label class="error visibility" id="courseError">* error</label></li>
                                                        </ul>
                                                    </div>
                                                 <cf:input class="form-control" path="quantity"  type="text" placeholder="quantity"/>
                                                 
                                                </div>
                                                
                                                <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> unit:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" path="unit"  type="text" placeholder="unit"/>
                                                
													
                                            </div>
                                            
                                            </div> <!-- left side ends -->

                                            <!-- right side -->
                                            <div class="col-xs-6">

											<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>reporting:</strong></li>
														<li class="style-li error-red"></li>
													</ul>
												</div>
												<cf:input class="form-control" path="reporting"  type="text" placeholder="reporting"/>
												
											</div>
											
													<div class="form-group">
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Unit Price:</strong></li>
														<li class="style-li error-red"></li>
													</ul>
												</div>
												<cf:input class="form-control" path="unitPrice"  type="text" placeholder="Unit Price"/> 
												
											</div>

											<div class="form-group">
                                                    <div>
													<ul class="lab-no">
														<li class="style-li"><strong>Amount:</strong></li>
														<li class="style-li error-red"><cf:errors
																path="amount" cssClass="error" /></li>
													</ul>
												</div>
												<cf:input class="form-control" path="amount"  type="text" placeholder="Amount"/> 

                                                </div>
                                   
                                            </div> <!-- rigth side ends -->
                                            
                                            <!-- button -->
                                            <div class="row">
                                                
                                                	
                                                <div class="col-md-6 col-xs-12">
													<input type="submit"  id="updatebtn" style="display:none;float: right;margin-right: 122px;"
														value="Update" class="btn login-btn"/>
												
												
													<input type="submit" id="createbtn"
														value="Create"  class="btn login-btn"/>
                                                    <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" style="margin-left: 381px;" data-target="#show-result" aria-expanded="false" value="Search"/> 
                                               
                                                </div>
                                            </div>
                                           
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
                                            <legend>Training Schedule</legend>
                                            <ct:if test="${!empty listEmployeeMonthlyCharges}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Resources</th>
                                                        <th>skill</th>
                                                        <th>quantity</th>
                                                        <th>unit</th>
                                                        <th>reporting</th>
                                                        <th>unitPrice</th>
                                                        <th>amount</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr> 
                                                </thead>
                                                
                                               	<ct:forEach items="${listEmployeeMonthlyCharges}" var="EmployeeMonthlyCharges">
										
										
											<tr>
												<td>${EmployeeMonthlyCharges.id}</td>
												<td>${EmployeeMonthlyCharges.resource}</td>
												<td>${EmployeeMonthlyCharges.skill}</td>
												<td>${EmployeeMonthlyCharges.quantity}</td>
												<td>${EmployeeMonthlyCharges.unit}</td>
												<td>${EmployeeMonthlyCharges.reporting}</td>
												<td>${EmployeeMonthlyCharges.unitPrice}</td>
												<td>${EmployeeMonthlyCharges.amount}</td>
												  
												<td><button onclick='editTax(${EmployeeMonthlyCharges.id});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/TaxMaster/remove/${EmployeeMonthlyCharges.id}.fssai' />" >Delete</a></td>
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
            	      url: 'EmployeeMonthlyCharges/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#id").val(mainData1.id);
            	    $("#customer").val(mainData1.customer.customerId);
            	    $("#resource").val(mainData1.resource);
            	    $("#skill").val(mainData1.skill);
            	    $("#quantity").val(mainData1.quantity);
            	    $("#unit").val(mainData1.unit);
            	    $("#reporting").val(mainData1.reporting);
            	    $("#unitPrice").val(mainData1.unitPrice);
            	    $("#amount").val(mainData1.amount);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }

            </script>
