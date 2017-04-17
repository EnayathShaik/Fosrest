<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
   <script>
   

   function OnStart() {
      
   	flatpickr("#startDate" , {
   		enableTime: true
   	});	
   	
    	flatpickr("#endDate" , {
    		enableTime: true
   	});	
   }
   window.onload = OnStart;

  
   
            </script>
 
 
 
 
<cf:form action="onlinelistassessmentquestions.fssai" name="tiForm" method="POST" commandName="AssessmentQuestionForm" onsubmit="return validateFields();"> 



  <section>
        <%@include file="../roles/top-menu.jsp"%>
    </section>
    <!-- main body -->
    <section class="main-section-margin-top">
        <div class="container-fluid">
            <div id="wrapper">
                <!-- Page Content -->
                <div><%@include file="../roles/slider.jsp" %>
                </div>
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <!-- vertical button -->
                        <div class="row">
                            <div class="col-lg-12">
                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome ${userName} </span> </a>
                            </div>
                        </div>
                        <!-- add the content here for main body -->
                        <!-- timeline  -->
                        <div class="row">
                          
                              
                                <div class="col-xs-12">
                                    
                                    <!-- table -->
                                    <div class="row">
                                        
                                        <!-- question list -->
                                        <div class="col-xs-12 table-overflow-responsive">
                                        
                                            <fieldset>
                                                <legend>Question List</legend>
                                                
                                           
                                                
                                                <table id="newTable" class="table table-responsive table-bordered table-hover">
                                                           <ct:choose>
                                            <ct:when test="${!empty listAssessmentQuestion}">
                                         
                                            
                                           
                                            
                                                          <ct:set var="i" value="0" />
                                                   
 										 	 <ct:forEach items="${listAssessmentQuestion}" var="ti">
                                                <ct:set var="i" value="${i+1}" />
                                           
											<h3>  Question no.${i}: ${ti.questionHint} </h3>
											
											
											<%-- 	 <cf:radiobuttons path="correctAnswer" items="${numbersList}" /> 
											 --%>	 
											 
            									<ct:forEach  begin="0" end="${ti.noOfOption-1}" var="mybean" varStatus="rowCount">
            								<ct:out value="${rowCount.index+1}) " />
              										 <ct:if test="${rowCount.index==0}" >
              										  <cf:radiobutton path="correctAnswer" name="optradio" /> ${ti.optionOne} <br/> 
              										  </ct:if>
              										   
              									<ct:if test="${rowCount.index==1}" >
              										  <cf:radiobutton path="correctAnswer" name="optradio" /> ${ti.optionTwo} <br/> 
              										  </ct:if>
              									<ct:if test="${rowCount.index==2}" >
              										  <cf:radiobutton path="correctAnswer" name="optradio" /> ${ti.optionThree} <br/> 
              										  </ct:if>
              									<ct:if test="${rowCount.index==3}" >
              										  <cf:radiobutton path="correctAnswer" name="optradio" /> ${ti.optionFour} <br/> 
              										  </ct:if>
              									  <ct:if test="${rowCount.index==4}" >
              										  <cf:radiobutton path="correctAnswer" name="optradio" /> ${ti.optionFive} <br/> 
              										  </ct:if>
              								  <ct:if test="${rowCount.index==5}" >
              										  <cf:radiobutton path="correctAnswer" name="optradio" /> ${ti.optionSix} <br/> 
              										  </ct:if>
          											  </ct:forEach>
 												 
											 
											
										</ct:forEach> 
                                                        <tbody>
                                                        </tbody>
                                                               </ct:when>
                                           <ct:otherwise>Empty</ct:otherwise>
                                           </ct:choose>
                                                    </table>
                                                    
 
                                          <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" value="Submit"/> 
                                         
                                            </fieldset>
                                            
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                        
                                    </div>
                                </div> 
                                
                                      </div>
                    </div>
                </div>
            </div>
        </div>
                                </section>
                                   </cf:form>