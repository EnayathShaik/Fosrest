<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="website/js/commonController.js"></script>

<script>
function OnStart(){
	
	
	var e = document.getElementById("subjectCode1");
	var sub = e.options[e.selectedIndex].label;
	var aa = $('#name_status').html("[ "+sub+" ]");
	//alert('${listAllSubjectQuestion[0].questionNumber}');

/* 	var iframe = document.createElement('iframe');
	var str="";
	
	var html = '<body>Foo</body>';
	document.body.appendChild(iframe);
	iframe.style.width = "700px";s
	iframe.style.height = "700px";
	iframe.contentWindow.document.open();
	iframe.contentWindow.document.write(html);
	iframe.contentWindow.document.close(); */

	}
	window.onload = OnStart;

	
	
	function printDiv() {
		var printContents = document.getElementById('printDiv').innerHTML;
		var originalContents = document.body.innerHTML;
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
		location.reload();
		return false;
		
	} 
</script>

<cf:form  action="viewassessmentquestions.fssai"  method="POST" commandName="assessmentQuestionForm" > 

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
                        <h1>View Assessment Questions</h1> 
                        <div class="row">

                                <div class="col-xs-12">
                                  	
                                   <fieldset> <legend>Subject</legend>
                                   
                                   <BR>                          
                                    <div class="row">
                                        <div class="col-xs-12">
									        
 										<div class="col-md-6 col-xs-12">
                                            <!-- right side -->
                                                   <div class="form-group">   
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Subject Name:</strong></li>
                                                            <li class="style-li error-red">	
                                                           <%-- ${created } --%></li>
                                                        </ul>
                                                    </div>
												<cf:select  path="subjectCode1"   class="form-control">
										<%-- 		 <cf:option value="0" label="Select Subject"></cf:option> --%>
												   <ct:forEach var="twofields" items="${listSubjectMaster}">
												   <cf:option value="${twofields[0]}" ><ct:out value="${twofields[10]} - ${twofields[11]}"/></cf:option>
    												</ct:forEach>
												 </cf:select>
											</div>
											<div class="row">	
                                                <div class="col-md-6 col-xs-12"></div>
                                                
                                                <div class="col-md-6 col-xs-12">
                                                <input type="submit"  class="btn login-btn" value="View All Questions" > 
                                                                                                        </div>
                                            </div>
                                             </div> <!-- rigth side ends -->
                                            <!-- button -->
                                            
                                         
                                        </div>

                                       
                                    </div>
                                </fieldset>
                                </div>
                                
                                 <div class="col-xs-12">
                                    
                                    <!-- table -->
                                    <div class="row">
                                        
                                        <!-- question list -->
                                        <div class="col-xs-12 table-overflow-responsive">
                                        
                                <fieldset><legend>All Questions </legend>
                                <ct:if test="${!empty listAllSubjectQuestion }">
                                 <div id="printDiv">
                                 <h3><strong><span id="name_status" class = "clear-label" style=" margin-left: 240px;"> </span></strong></h3>

                                <ct:forEach items="${listAllSubjectQuestion}" var="aa" varStatus="loop">
                                
                                <div>
                               <h4><Strong> ${loop.count}) ${aa.questionTitle}</Strong></h4>
                                <ol type="a">
                                <li>${aa.optionOne}</li>
                                <li>${aa.optionTwo}</li>
                                 <ct:if test="${aa.optionThree!=null}">
                                <li>${aa.optionThree}</li>
                                </ct:if>
                                    <ct:if test="${aa.optionFour!=null}">
                                <li>${aa.optionFour}</li>
                                </ct:if>
                                   <ct:if test="${aa.optionFive!=null}">
                                <li>${aa.optionFive}</li>
                                </ct:if>
                                <ct:if test="${aa.optionSix!=null}">
                                <li>${aa.optionSix}</li>
                                </ct:if>
                                </ol>	
                                Correct Answer: 
                                <ct:if test="${aa.correctAnswer==1}">
                                a
                                </ct:if>
                                <ct:if test="${aa.correctAnswer==2}">
                                b
                                </ct:if>
                                <ct:if test="${aa.correctAnswer==3}">
                                c
                                </ct:if>
                                <ct:if test="${aa.correctAnswer==4}">
                                d
                                </ct:if>
                                <ct:if test="${aa.correctAnswer==5}">
                                e
                                </ct:if>
                                <ct:if test="${aa.correctAnswer==6}">
                                f
                                </ct:if>
                                <br /><br />
                                </div>
                                 </ct:forEach>
                                 </div>
                                  <input type="button" onclick="printDiv();" class="btn login-btn" value="Print"  />
                                 </ct:if>
                                 </fieldset>
                                
</div></div></div>
                             </div>
                             </div>
                             </div>
                             </div>
                             </div>
                              
                              
    </section>
    
   
    </cf:form>
    
    