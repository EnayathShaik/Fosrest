<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
 <script>
 function validateFields(){
	 alert("validate");
 }
</script>
 <ct:url var="addAction" value="/manageCourseCarricullum/add.fssai" ></ct:url>
<!-- method="post"  -->
<cf:form action="${addAction}"  method="post" commandName="manageCourseCarricullum" onsubmit="return validateFields();">
<cf:input path="id" type="hidden" />
<%-- <ct:if test="${!empty manageCourseCarricullum.trainingName}">
	
			
	
	</ct:if> --%>
                <section>
                    <%@include file="/website/roles/top-menu.jsp"%>
                </section>
                <!-- main body -->
                <section class="main-section-margin-top">
                    <div class="container-fluid">
                        <div id="wrapper">
                            <!-- Sidebar -->
                            <%@include file="/website/roles/slider.jsp" %>
                                <!-- /#sidebar-wrapper -->
                                <!-- Page Content -->
                                <div id="page-content-wrapper">
                                    <div class="container-fluid">
                                        <!-- vertical button -->
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Admin</span>
                                                </a>
                                            </div>
                                        </div>
                                        <!-- add the content here for main body -->
                                        <!-- timeline  -->
                                        <div class="row">

                                            <div class="col-xs-12">
                                                <h1>Manage Course Curriculum <label id="created" class="style-li error-red">${created }</label></h1>
                                                <div class="row">
                                                    <div class="col-xs-12">
												                           <fieldset>
										 <ct:if test="${empty manageCourseCarricullum.trainingName}">
                                        <legend>Add</legend>
                                        </ct:if>
                                         <ct:if test="${!empty manageCourseCarricullum.trainingName}">
                                        <legend>Edit</legend>
                                        </ct:if>
                                        <!-- table starts here -->
                                        <!-- left side -->
                                        <div class="col-md-6 col-xs-12">
                                            
                                           <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> Training Name:</strong></li>
<!--                                                          <li id="userTypeErr" style="display:none;" class="style-li error-red" >Please Select User Type.</li>
 -->                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                               	<cf:input id="trainingName" path="trainingName" class="form-control"/>
                                            </div>
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong> Curriculum Duration:</strong></li>
<!--                                                         <li id="trainingTypeErr" style="display:none;" class="style-li error-red" > Please Select Training Type.</li>
 -->                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                           		<cf:input id="curricullumDuratiuon" path="curricullumDuratiuon" class="form-control"/>
                                            </div>
                                      
                                        </div>
                                        <!-- right side -->
                                        <div class="col-md-6 col-xs-12">
                                            
                                            <div class="form-group">
                                                <div>
                                                    <ul class="lab-no">
                                                        <li class="style-li"><strong>Curriculum Topic:</strong></li>
<!--                                                            <li id="unitNameErr" style="display:none;" class="style-li error-red" > Please Enter Unit Name.</li>
 -->                                                        <li class="style-li error-red"> </li>
                                                    </ul>
                                                </div>
                                           <cf:input id="curricullumnTopic" path="curricullumnTopic" class="form-control" /> </div>
                                           <ct:if test="${!empty manageCourseCarricullum.trainingName}">
				<input type="submit"
					value="Edit" />
			</ct:if>
			<ct:if test="${empty manageCourseCarricullum.trainingName}">
				<input type="submit"
					value="Add" />
			</ct:if>
                                     </div>
                                    </fieldset>
                                                    </div>


                                                </div>
                                                <br><br><br>
                                            </div>
	
                                          <fieldset>  <legend>Manage Course Curriculum List</legend>
<ct:if test="${!empty listmanageCourseCarricullum}">
	<table  id="datatablesfosrest" class="table table-bordered table-responsive">
	<tr>
		<th width="80"> ID</th>
		<th width="120">Training  Name</th>
		<th width="120">Curriculum Topic</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<ct:forEach items="${listmanageCourseCarricullum}" var="manageCourseCarricullum">
	
	
		<tr>
			<td>${manageCourseCarricullum.id}</td>
			<td>${manageCourseCarricullum.trainingName}</td>
			<td>${manageCourseCarricullum.curricullumnTopic}</td>
			<td><button onclick='editCC(${manageCourseCarricullum.id});return false;' >Edit</button></td>
												<td><a href="<ct:url value='/manageCourseCarricullum/remove/${manageCourseCarricullum.id}.fssai' />" >Delete</a></td>
		</tr>
	</ct:forEach>
	</table>
</ct:if>
</fieldset>
                                            <!-- search div ends -->

                                        </div>
                                        <!-- row ends -->

                                    </div>
                                </div>
                        </div>
                    </div>
                </section>
                <input type="hidden" id="idH" value="" />
                
            </cf:form>
			    <script>
			    
			    
            function editCC(id){
               
                var name1=JSON.stringify({
            		courseName:0
              })
            	$.ajax({
            	      type: 'post',
            	      url: 'manageCourseCarricullum/edit/'+id+'.fssai',
            	      contentType : "application/json",
            		  data:name1,
            	      success: function (response) {      
            	    	
            	      var mainData1 = jQuery.parseJSON(response);
            	     
            	      $("#id").val(mainData1.id);
            	    $("#trainingName").val(mainData1.trainingName);
            	    $("#curricullumDuratiuon").val(mainData1.curricullumDuratiuon);
            	    $("#curricullumnTopic").val(mainData1.curricullumnTopic);
            	   /*  $("#trainingPhase").val(mainData1.trainingPhase);
            	    $("#unitName").val(mainData1.unitName);
            	     $("#updatebtn").css("display" , "block");
            	     
            	     $("#createbtn").css("display" , "none"); */
            	      }
            	      });     
            
                }
                </script>