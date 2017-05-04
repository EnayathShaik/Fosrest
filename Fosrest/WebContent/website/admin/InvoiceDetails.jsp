<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
             <script>

             function OnStart() {

         	flatpickr("#invoiceDate" , {});
             }
             window.onload = OnStart;
            </script>
            
       		<ct:url var="addAction" value="/InvoiceMaster/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="InvoiceMasterForm" >

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
                                             
                                                <div class="row">
                                                    <div class="col-xs-12">
													<fieldset>
                                        <legend>Customer Details</legend>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-xs-6">
                                         	<div class="form-group">
                                         		<cf:input path="id" type="hidden" />
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Customer</strong></li>
														<li class="style-li error-red"><span id="name_status">
														</span><span id="err"> </span> <label id=userTypeError
															class="error visibility">* Select Customer </label> <cf:errors
																path="customerId" cssClass="error" />${created }</li>
													</ul>
												</div>
												<cf:input path="id" type="hidden"/>
												<cf:select path="customerId"  class="form-control">
													<cf:option value="0" label="Select Customer" />
													<cf:options items="${listCustomerMaster}" itemValue="customerId" itemLabel="name"/>
												</cf:select>
											</div>
											
											  <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Description:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" type="text"  path="description"  placeholder="Description"/> 
                                                </div>

                                            </div> <!-- left side ends -->

                                              <!-- right side -->
                                        <div class="col-md-6 col-xs-12">
                                        
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Invoice Date:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" type="text"  path="invoiceDate"  placeholder="InvoiceDate"/> 
                                                </div>

                                          
                                           
                                        </div>

                                       
                                    </div>
                                    
                                            <div class="row">
                                               <input type="submit"  id="updatebtn" style="display:none;float: right;margin-right: 122px;"
														value="Update" class="btn login-btn"/>
												
												
													<input type="submit" id="createbtn"
														value="Create"  class="btn login-btn" onclick="return validateFields();"/>
                                                <div class="col-md-6 col-xs-12" style="margin-top: 25px;">
                                                 
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
                                            <legend> List of InvoiceMaster</legend>
                                            <ct:if test="${!empty listInvoiceMaster}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>          	
			                                      		<th>Invoice Number</th>
			                                      		<th>Description</th>
			                                      		<th>Issue Date</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr> 
                                                </thead>
                                                
                                               	<ct:forEach items="${listInvoiceMaster}" var="InvoiceMaster" varStatus="loop">
										
										
											<tr>
												<td>${loop.count}</td>
												<td>${InvoiceMaster.invoiceNumber}</td>
												<td>${InvoiceMaster.description}</td>
												<td>${InvoiceMaster.invoiceDate}</td>
												
												
												  
												<td><button onclick='editTax(${InvoiceMaster.id});return false;' >Edit</button></td>
												<td><a href="invoicePrint.fssai?custId=${InvoiceMaster.customer.customerId}&invoiceNum=${InvoiceMaster.invoiceNumber}">GET INVOICE</a></td>
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
            	      url: 'InvoiceMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#id").val(mainData1.id);
            	    $("#customer").val(mainData1.customer.customerId);
            	    $("#resource").val(mainData1.resource);
            	    $("#skill").val(mainData1.skill);
            	    $("#quantity").val(mainData1.quantity);
           
            	    $("#reporting").val(mainData1.reporting);
            	    $("#unitPrice").val(mainData1.unitPrice);
            	    $("#amount").val(mainData1.amount);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }

            </script>
