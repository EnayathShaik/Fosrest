<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="website/js/commonController.js"></script>

<script type="text/javascript">

function OnStart() {
	var userList = '${listEligibleuser}';
	
	if(userList !=''){
		//alert("Y" +userList);
		$("#moduleDIV").css("display", "block");
		$("#unitDIV").css("display", "block");
	}else{

		
	}
}
window.onload = OnStart;
</script>
<cf:form action="ListEligibleUser.fssai" name="myForm" method="POST" commandName="NominateTraineeForm" > 

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
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Admin</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                        <div class="row">

                                <div class="col-xs-12">
                                    <h1>Nominate Trainee</h1>
                                    <div class="row">
                                        <div class="col-xs-12">

                                            <!-- left side -->
                                            <div class="col-xs-6">
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>User Type:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="userType" class="form-control">
													<cf:option value="" label="Select user Type" />
													<cf:options items="${userTypeMap}" />
												</cf:select>
											</div>
                                                
                                      		      <div class="form-group" id="moduleDIV" style="display:none">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Module :</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="module" class="form-control">
													<cf:option value="" label="Select module" />
													<cf:options items="${moduleList}" itemValue="moduleId" itemLabel="moduleCode" />
												</cf:select>
											</div>
                                                
                                            
                                            </div> <!-- left side ends -->

                                            <!-- right side -->
                                            <div class="col-xs-6">
     										      <div class="form-group" id="unitDIV" style="display:none">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Unit :</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="unit" class="form-control" onchange="getModule(this.value ,'module' )">
													<cf:option value="" label="Select Unit" />
													<cf:options items="${unitList}" itemValue="unitId" itemLabel="unitCode" />
												</cf:select>
											</div>
                                            </div>
                                             <!-- rigth side ends -->
                                            
                                            <!-- button -->
                                            <div class="row">
                                                <div class="col-md-6 col-xs-12"></div>
                                                
                                                <div class="col-md-6 col-xs-12">
													
                                                    <input type="submit" style="margin-top: 24px;"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Get List"/> 
                                               
                                                </div>
                                            </div>
                                           
                                        </div>

                                       
                                    </div>
                                </div>

                                
                                <!-- search Results -->
                                            <div class="col-xs-12 " id="testt">

                                                <!-- table -->
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                            <fieldset>
                                           <legend>Eligible User List</legend>
                                            <ct:if test="${!empty listEligibleuser}">
                                            <table class="table table-bordered table-responsive" id="testTable">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        
                                                       <th>S.No.</th>
                                                        <th>User Type</th>
                                                        <th>Trainee Name</th>
                                                        <th>Enroll for Trainee</th>
                                                        
                                                       
                                                        
                                                    </tr>
                                                </thead>
                                              <%--   <ct:set var="count" value="0" scope="page" />
                                                <ct:set var="count" value="${count + 1}" scope="page"/> --%>
                                                <ct:forEach items="${listEligibleuser}"  var="EligibleUser" varStatus="loop">
                                                <ct:out value="${loop.index}"></ct:out>
												<td>${loop.index}</td>
												<td>${EligibleUser.userType}</td>
												<td id="userName_${loop.index}">${EligibleUser.firstName} <input type="hidden" id="userId_${loop.index}" value="${EligibleUser.id}"/> </td>
												 <td class="text-center">
                                                            <input type="checkbox">
                                                        </td>
                                                       
												
											</tr>
										</ct:forEach>
										 
                                            </table>
                                            <div class="col-md-6 col-xs-12"></div>
                                               
                                                 <div class="col-md-6 col-xs-12">

                                                    <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" onclick="getUser();return false;" value="Enroll"/> 
                                               
                                                </div>
                                                    </div>
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
   </cf:form>
   
   <script>
   
   
   function getUser(){
	   var loginIds = "";
		$('#testTable').find('input[type="checkbox"]').each(function (i) {
		     if(this.checked){
			// console.log($("#userId_"+i).val());
			if(loginIds ==""){
				 loginIds = $("#userId_"+i).val() + "@"+$("#userName_"+i).text() ;	
			}else{
				 loginIds = loginIds + ","+$("#userId_"+i).val()+"@"+$("#userName_"+i).text() ;	
			}
			
			 }
		    });
	   
	   console.log(loginIds);
	   var unit = $("#unit").val();
	   var module = $("#module").val();
	   var moduleCode =  $("#module :selected").text();
	  
	   var name=JSON.stringify({
			courseType:0,
			courseName:0
	  });
	  var result = loginIds+"-"+unit+"-"+module+"-"+moduleCode;
	  alert(result);
		 $.ajax({
			type : 'post',
			url : 'enrollUser.fssai?data='+ result,
			contentType : "application/json",
		    data:name,
			success : function(response) {
				alert(response);
				location.reload();
			}
		});
	   
	    
	   
   }
   
 
   </script>