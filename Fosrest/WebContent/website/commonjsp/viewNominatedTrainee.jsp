<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<%System.out.print("trainee home page jsp"); %>

<script>
window.profileId = '${profileId}';

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
                                           <legend>Nominated Trainee List</legend>
                                            <ct:if test="${!empty listNominatedTrainee}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Trainee Name</th>
                                                        <th>Email</th>
                                                        <th>Contact No.</th>
                                                        <th>BatchCode</th>
                                                        <th>Training Center Name</th>
                                                         <th>State Name</th>
                                                        </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listNominatedTrainee}" var="nominatedTrainee" varStatus="loop">
                                                <tr>
												<td>${loop.count}</td>
												<td>${nominatedTrainee[1]} &nbsp &nbsp ${nominatedTrainee[2]}</td>
												 <td>${nominatedTrainee[3]}</td>
												<td>${nominatedTrainee[4]}</td>
												<td>${nominatedTrainee[5]}</td>
												<td>${nominatedTrainee[6]}</td>
												<td>${nominatedTrainee[7]}</td>
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
/* 
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
} */

</script>
