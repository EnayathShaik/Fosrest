<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<%System.out.print("trainee home page jsp"); %>

<script>
wwindow.profileId = '${profileId}';

</script>
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
          
                  <div class="row">
                                            <div class="col-xs-12">
                                           <fieldset>
                                           <legend>Training Requests for Institute</legend>
                                            <ct:if test="${!empty listTrainingSchedule}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Training Type</th>
                                                        <th>User Type</th>
                                                        <th>Training Phase</th>
                                                        <th>Training Start Date</th>
                                                        <th>Training End Date</th>
                                                        <th>No. Of Enrollments</th>
                                                        <th>Status</th>
                                                        <th>Accept</th>
                                                        <th>Reject</th>
                                                        
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listTrainingSchedule}" var="TrainingSchedule" varStatus="loop">
                                                <tr>
												<td>${loop.count}</td>
												<td>${TrainingSchedule.trainingType}</td>
												<td>${TrainingSchedule.userType}</td>
												<td>${TrainingSchedule.trainingPhase}</td>
												<td>${TrainingSchedule.trainingStartDate}</td>
												<td>${TrainingSchedule.trainingEndDate}</td>
												<td>20</td>
												<td>${TrainingSchedule.trainingInstitudeStatus}</td>
												<td><button  class="btn login-btn" onclick='acceptTrainingRequest(${TrainingSchedule.trainingScheduleId} ,${profileId},${userTableId },"accept");return false;' >Accept</button></td>
												<td><button  class="btn login-btn" onclick='acceptTrainingRequest(${TrainingSchedule.trainingScheduleId} ,${profileId},${userTableId },"reject" );return false;' >Reject</button></td>
												
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
<script>

function acceptTrainingRequest(id , profileId,userTableId,operation){
	//alert(" id "+id + "profileId  "+profileId+" userID:"+userTableId+"OPeration : "+operation);
		if( confirm("Are you sure you want to "+operation + " ? ")){
	   var name1=JSON.stringify({
  		courseName:0
    })
  	$.ajax({
  	      type: 'post',
  	    url: 'TrainingSchedule/accept/'+id+'.fssai?profileId='+profileId+'&userTableId='+userTableId+'&operation='+operation,
  	      contentType : "application/json",
  		  data:name1,
  	      success: function (response) {  
  	    	  location.reload();
  	      }
  	}); 
}
}

</script>
