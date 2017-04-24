<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
         
            
        
            <ct:url var="addAction" value="/CustomerMaster/add.fssai" ></ct:url>
            <cf:form action="${addAction}" name="myForm" method="POST" commandName="CustomerMaster" onsubmit="return validateFields();">

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
                                                <h1>Customer Master <label id="created">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
													<fieldset>
                                        <legend>Customer Master</legend>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-md-6 col-xs-12">
                                            <div class="form-group">													
														<cf:input path="CustomerId" type="hidden" /> 

													<div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Name:</strong></li>
                                                        <li > <cf:errors path="name" style="color:red" ></cf:errors> </li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" path="name" id="name" name="name" type="text" placeholder="Customer Name"/> </div>
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Address:</strong></li>
                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                                <cf:input class="form-control" type="text"  path="address" id="address" name="address" placeholder="Address"/> </div>
                                            <div class="row">
                                            
                                               <!-- left -->
                                          
												
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
                                            <ct:if test="${!empty listCustomerMaster}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                                <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Customer Date</th>
                                                        <th>Customer Reason</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr> 
                                                </thead>
                                                
                                               	<ct:forEach items="${listCustomerMaster}" var="CustomerMaster">
										
										
											<tr>
												<td>${CustomerMaster.customerId}</td>
												<td>${CustomerMaster.name}</td>
												<td>${CustomerMaster.address}</td>
												  
												<td><button onclick='editCustomer(${CustomerMaster.customerId});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/CustomerMaster/remove/${CustomerMaster.customerId}.fssai' />" >Delete</a></td>
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
                
                function editCustomer(id){
               // alert(id);
                
                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'CustomerMaster/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	      var mainData1 = jQuery.parseJSON(response);
            	    $("#customerId").val(mainData1.customerId);
            	    $("#name").val(mainData1.name);
            	    $("#address").val(mainData1.address);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none");
            	      }
            	      });     
                
                }

            </script>
