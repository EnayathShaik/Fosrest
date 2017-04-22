<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>


 <script src="website/js/commonController.js"></script> 
<cf:form action="listassessmentquestions.fssai" name="tiForm" method="POST" commandName="AssessmentQuestionForm" onsubmit="return validateFields();"> 


<script>

function generateAnsSeq(){
	$('#assAnsTable').html("");
	var noOfAssmentQ =  $("#noOfAssesmentQues").val();
	$('#assAnsTable').append('<tr><td>Sr. No.</td><td>Options</td></tr>')
	for(i=1;i<=noOfAssmentQ;i++){
		if(i==1){
			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionOne" class="form-control" /></td></tr>')
			document.getElementById('optionOne').value = '';
			
		}else if(i==2){
			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionTwo" class="form-control" /></td></tr>')
			document.getElementById('optionTwo').value = '';
			
		}else if(i==3){
			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionThree" class="form-control" /></td></tr>')
			document.getElementById('optionThree').value = '';
			
		}else if(i==4){
			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionFour" class="form-control" /></td></tr>')
			document.getElementById('optionFour').value = '';
			
		}else if(i==5){
			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionFive" class="form-control" /></td></tr>')
			document.getElementById('optionFive').value = '';
			
		}else if(i==6){
			$('#assAnsTable').append('<tr><td>'+i+'</td><td><cf:input path="optionSix" class="form-control" /></td></tr>')
			document.getElementById('optionSix').value = '';
	}
	}
}
</script>
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
                                 <fieldset>	
                                       <legend>Search Assessment Question	</legend>
                                    
                                    <div class="row">
                                        <div class="col-xs-12">

                                            <!-- left side -->
                                            <div class="col-md-6 col-xs-12">
                                             <%--    
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Course Type:</strong></li>
                                                            <li class="style-li error-red"> </li>
                                                        </ul>
                                                    </div>
                                                   <cf:select path="courseType" class="form-control" onchange="getCourseName(this.value , 'courseNameSearch');">
														<cf:option value="0" label="Select Course Type" />
														<cf:options items="${listCourseType}" itemValue="CourseTypeId" itemLabel="CourseType" />
                                                      </cf:select>
                                                </div>
                                                 --%>
                                                    <div  class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Question Number:</strong></li>
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                      <cf:input path="questionNumber" id="questionNumber" class="form-control"  placeholder="Question Number" />
                                                    </div>
                                                    
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Unit Code:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="unitCode" class="form-control">
													
													<cf:options items="${listUnitMaster}" itemLabel="unitCode" itemValue="unitId" />
												</cf:select> 
											</div>
                                                 
                                            </div> <!-- left side ends -->

                                            <!-- right side -->
                                            <div class="col-md-6 col-xs-12">
                                                                                          
                                               
                                                
                                                   <div class="form-group">  
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Module Name:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="moduleCode"   class="form-control">
													
												
												   <ct:forEach var="twofields" items="${listModuleMaster}">
       												 <cf:option value="${twofields.moduleId}"><ct:out value="${twofields.moduleId} - ${twofields.moduleName}"/></cf:option>
    												</ct:forEach>
												 </cf:select>
											</div>
                                                
                                            </div>
                                            
                                             <!-- rigth side ends -->
                                            
                                            <!-- button -->
                                            <div class="row">
                                                <div class="col-md-6 col-xs-12"></div>
                                                
                                                <div class="col-md-6 col-xs-12">
                                               
  <input type="submit"  class="btn login-btn show-details-vacancy collapsed" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Get Content"/> 
                                                                                             
                                                         </div>
                                            </div>
                                           
                                        </div>

                                       
                                    </div>
                                     </fieldset>
                                </div>

                              
                                
                                 <!-- search Results -->
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
                                         
                                              
                                                        <thead>

                                                            <tr class="background-open-vacancies">
                                                                <th class="text-center"><input type="checkbox"> </th>
                                                                <th>Unit Code</th>
                                                                <th>Module Code</th>
                                                                <th>Number of options</th>
                                                                <th>Question Hint</th>
                                                                <th>Question Title</th>
                                                                <th>Correct Answer</th>
                                                                <th>Modify</th>
                                                                <th>Delete</th>
                                                                </tr>

                                                        </thead>
 											 <ct:forEach items="${listAssessmentQuestion}" var="ti">
                                                <tr>
												<th class="text-center"><input type="checkbox"> </th>
												<td>${ti.unitCode}</td>
												<td>${ti.moduleCode}</td>
												<td>${ti.noOfOption}</td>
												<td>${ti.questionHint}</td>
												<td>${ti.questionTitle}</td>
												<td>${ti.correctAnswer}</td>
												<td><button onclick='editassessmentquestion(${ti.id});return false;' >Edit</button></td>
												 <td><a href="<ct:url value='/removeassessmentquestion/remove/${ti.id}.fssai' />" >Delete</a></td>
												
												
				
                                                      
												
											</tr>
										</ct:forEach>
                                                        <tbody>
                                                        </tbody>
                                                                  <input type="submit"  class="btn login-btn pull-right" data-toggle="collapse" data-target="#show-result" aria-expanded="false" value="Delete"/> 
  																 </ct:when>
                                           <ct:otherwise>Empty</ct:otherwise>
                                           </ct:choose>
                                                    </table>
                                                    
                                            
                                            </fieldset>
                                            
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                        
                                    </div>
                                </div> <!-- search div ends -->
                                
                                      </div>
                    </div>
                </div>
            </div>
        </div>
                                </section>
                                   </cf:form>
                                <cf:form action="addassessmentquestions.fssai" name="tiForm" method="POST" commandName="AssessmentQuestionForm" onsubmit="return validateFields();"> 
                                
                                 <section class="main-section-margin-top">
       									 <div class="container-fluid">
          										  <div id="wrapper">
              									 <div>
          											  <div class="row">

                                <div >
                                <div class="col-xs-12 table-overflow-responsive">
                                            <fieldset>
                                                <legend>Add/Modify Questions</legend>
                                                
                                                <!-- left side -->
                                                <div class="col-md-6 col-xs-12">
                                                   
                                                   
                                                      <div class="form-group">
                                                      <cf:input path="id" type="hidden" />
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Module Name:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
													<cf:select path="moduleCode"   class="form-control">
													
												
												   <ct:forEach var="twofields" items="${listModuleMaster}">
       												 <cf:option value="${twofields.moduleId}"><ct:out value="${twofields.moduleId} - ${twofields.moduleName}"/></cf:option>
    												</ct:forEach> 
												 
												 
												 
												 </cf:select>
											</div>
                                                    
                                                    <div  class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Question Number:</strong></li>
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                      <cf:input path="questionNumber" id="questionNumber" class="form-control"  placeholder="Question Number" />
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Question Title:</strong></li>
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                      <cf:input path="questionTitle" class="form-control" placeholder="Question Title" />
                                                    </div>
                                                    
                                                    
                                                    
                                                    
                                                </div>
                                                
                                                <!-- right side -->
                                                <div class="col-md-6 col-xs-12">
                                             
                                                <div class="form-group">
                                                    <div>
                                                        <ul class="lab-no">
                                                            <li class="style-li"><strong>Unit Code:</strong></li>
                                                            <li class="style-li error-red">
                                                            <span id="name_status" class = "clear-label"> </span>
                                                            ${created }</li>
                                                        </ul>
                                                    </div>
												<cf:select path="unitCode" id="unitCode" class="form-control">
													
													<cf:options items="${listUnitMaster}" itemLabel="unitCode" itemValue="unitId" />
												</cf:select>
											</div>
                                             
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Question Hint:</strong></li>
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                        <cf:input path="questionHint" class="form-control" placeholder="Help Text" />
                                                    </div>     
                                                    
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Number of Options:</strong></li>
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                         <cf:select id="noOfAssesmentQues" onchange="generateAnsSeq();" path="noOfOption" class="form-control">
                                                            <cf:option value="-1" label="Please Select" />
                                                            <cf:option value="1" label="1" />
                                                             <cf:option value="2" label="2" />
                                                             <cf:option value="3" label="3" />
                                                              <cf:option value="4" label="4" />
                                                               <cf:option value="5" label="5" />
                                                                <cf:option value="6" label="6" />
                                                        </cf:select> 
                                                    </div>     
                                                    
                                                </div>
                                                
                                                <div class="col-md-6 col-xs-12">
                                                    <h3>Correct Answer</h3>
                                                    <table id="assAnsTable" class="table table-bordered table-responsive">
                                                    <thead>
                                                        <tr class="background-open-vacancies">
                                                            <th>S.No.</th>
                                                            <th>Options</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody></tbody>
                                                </table>
                                                    
                                                    <div class="form-group">
                                                        <div>
                                                            <ul class="lab-no">
                                                                <li class="style-li"><strong>Answer Number:</strong></li>
                                                                <li class="style-li error-red"> </li>
                                                            </ul>
                                                        </div>
                                                    <cf:input path="correctAnswer" onkeyup="allnumeric(this.id,this.value);" class="form-control" placeholder="Answer Number" />
                                                         
                                                    </div>
                                                    <cf:input type="hidden" path="id" class="form-control" placeholder="Help Text" />
                                                    <input type="submit"  id="updatebtn" style="display:none;float: right;margin-right: 122px;"
														value="Update" class="btn login-btn"/>
                                                    <button id="save" class="btn login-btn pull-right">Save</button>
                                                </div> 
                                                
                                                <div class="col-md-6 col-xs-12">
                                                  
                                                
                                                </div>
                                            </fieldset>
                                            <br><br>
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
   
   
   <script>
   
   
   
   
   
   
   function editassessmentquestion(id){
       alert(id);
        
        var name1=JSON.stringify({
    		courseName:0
      })
      
       alert("2");
    	$.ajax({
    	      type: 'post',
    	      url: 'Assessmentquestion/edit/'+id+'.fssai',
    	      Accept: 'application/json',
    	      contentType : "application/json",
    		  data:name1,
    	      success: function (response) {      
                  alert("3");
    	    /* 	  var mainData1 = jQuery.parseJSON(response);
    	    $("#holidayId").val(mainData1.holidayId);
    	    $("#holidayDate").val(mainData1.holidayDate);
    	    $("#holidayReason").val(mainData1.holidayReason);
    	     $("#updatebtn").css("display" , "block");
    	     
    	     $("#createbtn").css("display" , "none");
             alert("4"); */
    	      }
    	      });     
        
        }
 /*   function editassessmentquestion(id){
        alert(id);
        
        var name1=JSON.stringify({
    		courseName:0
      
        }) 
        
                       alert("2");
    	$.ajax({
    	
    	      type: 'post',
    	      url: 'Assessmentquestion/edit/'+id+'.fssai',
    	      contentType : "application/json",
    		  data:name1, 	
    	      success: function (response) { 
    	    	  
                  alert("3");
    	      var mainData1 = jQuery.parseJSON(response);
    	      
    	    $("#unitCode").val(mainData1.unitCode);
    	    $("#moduleCode").val(mainData1.moduleCode);
    	    $("#questionNumber").val(mainData1.questionNumber);
    	     $("#updatebtn").css("display" , "block");
    	     
    	     $("#save").css("display" , "none");
             alert("4");
    	      }
    	      });     
        
        }
   
   */ 



   </script>
   