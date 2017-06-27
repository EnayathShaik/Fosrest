\<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<%System.out.print("trainee home page jsp"); %>

<!-- horizontal navigation -->


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
                                            <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome ${userName }</span>
                                            </a>
                                        </div>
                                    </div>
            <div class="row">
                                            <div class="col-xs-12">
                                           <fieldset>
                                           <legend>Upcoming Training</legend>
                                            <ct:if test="${!empty listTrainingSchedule}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Training Schedule code</th>
                                                        <th>Subject</th>
                                                        <th>Training Start Date</th>
                                                        <th>Training End Date</th>
                                                        <th>Training Institute</th>
                                                        
                                                        
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listTrainingSchedule}" var="TrainingSchedule" varStatus="loop">
                                                <tr>
												<td>${loop.count}</td>
												<td>${TrainingSchedule[1]}</td>
												<td>${TrainingSchedule[0]}</td>
												<td>${TrainingSchedule[2]}</td>
												<td>${TrainingSchedule[3]}</td>
												<td>${TrainingSchedule[4]} &nbsp;${TrainingSchedule[5]}</td>
												<%-- <td>20</td>
												<td>${TrainingSchedule.trainingInstitudeStatus}</td>
											    <td><button  class="btn login-btn" onclick='acceptTrainingRequest(${TrainingSchedule.trainingScheduleId} , ${profileId },${loginUser2 },"accept");return false;' >Accept</button></td>
											   <td><button  class="btn login-btn" onclick='acceptTrainingRequest(${TrainingSchedule.trainingScheduleId} , ${profileId },${loginUser2 },"reject");return false;' >Reject</button></td> --%>
										</tr>
										</ct:forEach>
                                            </table>
                                           </ct:if>
                                                                               </fieldset>
                                                    </div>
                                                </div>
                 
        </div>
      </div>
    </div>
  </div>
</section>
<!-- scripts --> 

<!-- <script>

function acceptTrainingRequest(id , profileId,loginUser2,operation){
	//alert(" id "+id + "profileId  "+profileId+" userID:"+loginUser2+" OPer="+operation);
	if( confirm("Are you sure you want to "+operation + " ? ")){
	   var name1=JSON.stringify({
  		courseName:0
    })
  	$.ajax({
  	      type: 'post',
  	    url: 'TrainingSchedule/accept/'+id+'.fssai?profileId='+profileId+'&loginUser2='+loginUser2+'&operation='+operation,
  	      contentType : "application/json",
  		  data:name1,
  	      success: function (response) {  
  	    	location.reload();  
  	      }
  	});
	   
}
}

</script> -->
