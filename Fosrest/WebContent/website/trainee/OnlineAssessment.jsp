<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!--

//-->
</script>

 <%-- <ct:url var="addAction" value="/TrainingSchedule/add.fssai" ></ct:url> --%>
<cf:form action="ListOnlineAssessment.fssai" name="myForm" method="POST" commandName="OnlineAssessmentForm" onsubmit="return validateFields();"> 

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
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Trainee</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                       
                        <div class="row">
                             <div class="container-fluid">
                            <div class="row">
                                <!-- legend -->
                                <div class="col-xs-12">
                                    <fieldset>
                                        <legend> Online Assessment</legend>
                                        <h4>Training Type:</h4>
                                        <h4>Training Phase:</h4>
                                        <h4>Training Duration: </h4>
                                        <br> </fieldset>
                                    <br> </div>
                              
                              
                              
                                
                                <!-- search Results -->
                                           <div class="col-xs-12">
                                    
                                        <legend>Assessment Instruction</legend>
                                       
                                    <br> </div>
                            </div>
                                          
                                      <!-- button -->
                                         
                                              <div class="row">
                                            <div class="col-md-4  col-xs-12">
                                          <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" value="Start Assessment"/> 
                                               
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
 
 <input type="hidden" id="idHidden" value="" />
 <input type="hidden" id="hiddenCourseType" value="" />                                             
   </cf:form>