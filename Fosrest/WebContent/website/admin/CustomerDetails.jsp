<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
             <script>
             function addRow(thisId){
            	
            	 rowString = "";
            	var getSrNo= $(thisId).closest('tr').attr('id');
            	$("#addRow"+getSrNo).css("display" , "none");
            	$("#deleteRow"+getSrNo).css("display" , "block");
            	console.log("getSrNo "+getSrNo);
            	var nextId = parseInt(getSrNo)+1;
            	rowString = rowString + "<tr id="+nextId+"><td><input type='text' id='employeeName"+nextId+"' name='employeeName'/></td><td><input type='text' id='description"+nextId+"' name='description'/></td><td><input type='text' id='unitPrice"+nextId+"' name='unitPrice'/></td><td><button id='addRow"+nextId+"' onclick='addRow(this);return false;'>Add</button><button style='display:none;' id='deleteRow"+nextId+"' onclick='deleteRow(this);return false;'>Remove</button></td></tr>";
            	$("#customerTable").append(rowString);
            	//flatpickr(".issueDate" , {});	
             }
             
             function deleteRow(id){
            	 
            	 $(id).parents('tr').remove();
             }
             function addCustomerDeatils(){
            	 
            	 rowString = "";
            	 
            	 rowString = rowString + "<tr id='1'><td><input type='text' id='employeeName1' name='employeeName'/></td><td><input type='text' id='description1' name='description'/></td><td><input type='text' id='unitPrice1' name='unitPrice'/></td><td><button  id='addRow1' onclick='addRow(this);return false;'>Add</button><button style='display:none;' id='deleteRow1' onclick='deleteRow(this);return false;'>Remove</button></td></tr>";
            	$("#customerTable").append(rowString); 
             }
             
             
                function OnStart() {
                   
                	
                	
                	addCustomerDeatils();
                	flatpickr(".issueDate" , {});	
                }
                window.onload = OnStart;

            </script>
            
       
            <cf:form action="CustomerDetailsAdd.fssai" name="myForm" method="POST" commandName="CustomerDetails" >

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
												<div>
													<ul class="lab-no">
														<li class="style-li"><strong>Invoice Number</strong></li>
														<li class="style-li error-red"><span id="name_status">
														</span><span id="err"> </span> <label id=userTypeError
															class="error visibility">* Select Invoice </label> <cf:errors
																path="invoiceNumber" cssClass="error" />${created }</li>
													</ul>
												</div>
												<cf:input path="id" type="hidden"/>
												<cf:select path="invoiceNumber"  class="form-control">
													<cf:option value="" label="Select invoiceNumber" />
													<cf:options items="${listCustomerMaster}" itemValue="invoiceNumber" itemLabel="description"/>
												</cf:select>
											</div>

                                            </div> <!-- left side ends -->

                                            
                                            <!-- button -->
                                            <div class="row">
                                       
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
                                            <legend>Add Customer Details</legend>
                                      		<table id="customerTable" class="table table-bordered table-responsive">
                                      		<thead >
                                      		<tr class="background-open-vacancies">
                                      		
                                      		<th>Employee Name</th>
                                      		<th>Description</th>
                                      		<th>Unit Price</th>
                                      		<th>Action</th>
                                      		</tr>
                                      		</thead>
                                      	
                                      		
                                      		</table>
                                      		<input type="submit" id="createbtn" style="float: right;margin-right: 122px;"
														value="Create"  class="btn login-btn"/>
                                     	   </fieldset>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- search div ends -->


                                            <!-- search Results -->
                                            <div class="col-xs-12 " id="testt">

                                                <!-- table -->
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                            <fieldset>
                                            <legend> List of CustomerDetails</legend>
                                            <ct:if test="${!empty listCustomerDetails}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>          	
			                                      		<th>Employee Name</th>
			                                      		<th>Description</th>
			                                      	<!-- 	<th>Issue Date</th> -->
			                                      		<th>Unit Price</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr> 
                                                </thead>
                                                
                                               	<ct:forEach items="${listCustomerDetails}" var="CustomerDetails" varStatus="loop">
										
										
											<tr>
												<td>${loop.count}</td>
												<td>${CustomerDetails.employeeName}</td>
												<td>${CustomerDetails.description}</td>
												<%-- <td>${CustomerDetails.issueDate}</td> --%>
												<td>${CustomerDetails.unitPrice}</td>
												
												  
												<td><button onclick='editTax(${CustomerDetails.id});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/removeCustomerDetails/remove/${CustomerDetails.id}.fssai' />" >Delete</a></td>
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
