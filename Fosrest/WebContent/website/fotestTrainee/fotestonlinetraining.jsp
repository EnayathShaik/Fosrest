<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>

               
<!--

//-->
</script>

 <%-- <ct:url var="addAction" value="/TrainingSchedule/add.fssai" ></ct:url> --%>
<cf:form action="fotestonlinetraining.fssai" name="myForm" method="POST" commandName="fotestonlineTrainingForm" onsubmit="return validateFields();"> 

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
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome FotestTrainee</span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                        <div class="row">

                                <div class="col-xs-12">
                                
                                 <!-- search Results -->
                                            <div class="col-xs-12 " id="testt">

                                                <!-- table -->
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                            <fieldset>
                                           <legend>Online Training</legend>
                                         <ct:if test="${!empty listfotestonlineTraining}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Course Name</th>
                                                         <th>Training Date & Time</th>
                                                          <th>Training Lab Name</th>
                                                           <th>Online Training</th>
                                                       
                                                        
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listfotestonlineTraining}" var="fotestonlineTraining" varStatus="loop">
                                                <tr>
												<td>${loop.count}</td>
												<td>${fotestonlineTraining.courseName}</td>
												<td>${fotestonlineTraining.trainingDate} &nbsp;&nbsp;&nbsp;&nbsp;  ${fotestonlineTraining.trainingTime}  </td>
												<td>${fotestonlineTraining.trainingLab}</td>
												<td> <input type="button" class="form-control login-btn" value="Start Here"></td>
                                                 </tr>
												</ct:forEach>
                                            </table>
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
 
 <input type="hidden" id="idHidden" value="" />
 <input type="hidden" id="hiddenCourseType" value="" />                                             
   </cf:form>