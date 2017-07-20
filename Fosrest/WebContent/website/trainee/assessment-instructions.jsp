<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

function OnStart(){
	var trainingPhase='${isOfflineTrainee}';
	 if(trainingPhase=='Y'){
		alert( "Your Training is OFFLINE. You are  not Eligible for Online Assessment.");
		window.location.href ='/Fosrest/loginProcess.fssai';
	}
	var steps = 2;
	var traineeSteps =
		<%=(Integer) session.getAttribute("traineeSteps")%>
	if(traineeSteps == steps){
		//allow
	}else{ 
		if(steps-1 == traineeSteps){
			alert('Please Complete Your Previous Training First')
		}else if(steps<traineeSteps){
			alert("Your Assessment is already saved");
			
		}
		else{
			alert('Please Flow Step By Step..');
		}
		window.location.href ='/Fosrest/loginProcess.fssai';
	}

}
 window.onload = OnStart;
</script>      

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
            <div class="col-lg-12"> <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome ${userName}</span> </a> </div>
          </div>
        <!-- add the content here for main body --> 
        <!-- timeline  -->
        <section class="section-form-margin-top">
              <div class="container">     
            <!-- login form -->
            <div class="row btm-margin">
                  <div class="col-md-6  col-xs-12"> 
                      <fieldset>
                    <legend>Training Details</legend>
                    <h4>Training Type: <span class="f16">${listOnlineTraining.trainingType }</span></h4>
                    <h4>Training Phase: <span class="f16">${listOnlineTraining.trainingPhase}</span></h4>
                    <h4>Training Duration: <span class="f16">${listOnlineTraining.trainingstartdate} -  ${listOnlineTraining.trainingenddate}</span></h4>
                    <h4>Subjects:</h4>
                    <ct:forEach var="subjects" items="${listsubjects}">
                    <li> <ct:out value="${subjects}"/><br></li>
                     </ct:forEach>
                    
                  </fieldset>
                     <br>
              <h3 class="text-capitalize heading-3-padding">Assesment Instructions</h3>
              </div>
                  <div class="col-md-2 hidden-xs"></div>
                </div>
          </div>
            </section>
            <section class="section-form-margin-top">
              <div class="container">     
            <!-- login form -->
                <div class="row">
                       <div class="col-md-12  col-xs-12">
                       <p>The test consists of 60 (5 point Likert scale) items across the Big 5 personality factors</p>
                            <ol>
                            <li>Extraversion</li>
                            <li>Agreeableness</li>
                            <li>Conscientiousness</li>
                            <li>Emotional Stability and</li>
                            <li>Openness to Experience</li>                    
                            </ol>      
                        </div>
                        <div class="col-md-2 hidden-xs"></div>
                    </div>

                    <div class="row">
                       <div class="col-md-12  col-xs-12">
                       <p><strong>Click to start Test</strong></p>

                        </div>
                        <div class="col-md-2 hidden-xs"></div>
                    </div>

                    <div class="row">
                       <div class="col-md-12  col-xs-12">
                       <div class="form-group">
                         <a href="traineeAssessmentOnline.fssai"><input style="width:150px;"  type="button" class="form-control login-btn btn" value="Start Assessment" /></a>
                        </div>

                        </div>
                        <div class="col-md-2 hidden-xs"></div>
                    </div>

          </div>
            </section>

        <!-- scripts --> 

       </div>
       </div>
       </div>
       </div>
       </section>