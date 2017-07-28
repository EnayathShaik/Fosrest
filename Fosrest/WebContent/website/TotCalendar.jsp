<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<%System.out.print("trainee home page jsp"); %>

<!-- horizontal navigation -->

<script>

	 function myFunction() {
		    var searchText = document.getElementById('myInput').value;
		    var targetTable = document.getElementById('datatablesfosrest');
		    var targetTableColCount;
		    for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
		        var rowData = '';

		        if (rowIndex == 0) {
		           targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
		           continue;
		        }
		        for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
		        	rowData += targetTable.rows.item(rowIndex).cells.item(colIndex).innerText.toLowerCase();
		        	 
		        }
		        if (rowData.toLowerCase().indexOf(searchText) == -1)
		            targetTable.rows.item(rowIndex).style.display = 'none';
		        else
		            targetTable.rows.item(rowIndex).style.display = 'table-row';
		    }
		}
</script>
<section>

      <div id="page-content-wrapper">
        <div class="container-fluid"> 
          
                                      <div class="row">
                                            <div class="col-xs-12">
                                           <fieldset>
                                           <legend>Training of Trainer Calendar</legend>
                                            <div>
                                            <span style="font-weight:bold;margin-left: 936px;">Search:</span>
                                            <input type="text" onkeyup="myFunction();this.value = this.value.toLowerCase();" id="myInput"  placeholder="Enter search text">
                                             </div>
                                            <ct:if test="${!empty listTotCalendar}">
                                            <table id="datatablesfosrest" class="table table-bordered table-responsive">
                                               <thead>
                                                    <tr class="background-open-vacancies">
                                                        <th>S.No.</th>
                                                        <th>Trainer</th>
                                                        <th>Training Schedule code</th>
                                                        <th>Subject</th>
                                                        <th>Training Start Date</th>
                                                        <th>Training End Date</th>
                                                        <th>Training Institute</th>
                                                        
                                                        
                                                    </tr>
                                                </thead>
                                                
                                                <ct:forEach items="${listTotCalendar}" var="TotCalendar" varStatus="loop">
                                                <tr>
												<td>${loop.count}</td>
												<td>${TotCalendar[1]}</td>
												<td>${TotCalendar[2]}</td>
												<td>${TotCalendar[0]}</td>
												<td>${TotCalendar[3]}</td>
												<td>${TotCalendar[4]}</td>
												<td>${TotCalendar[5]} &nbsp;${TotCalendar[6]}</td>
												<%-- <td>20</td>
												<td>${TrainingSchedule.trainingInstitudeStatus}</td>
											    <td><button  class="btn login-btn" onclick='acceptTrainingRequest(${TrainingSchedule.trainingScheduleId} , ${profileId },${loginUser2 },"accept");return false;' >Accept</button></td>
											   <td><button  class="btn login-btn" onclick='acceptTrainingRequest(${TrainingSchedule.trainingScheduleId} , ${profileId },${loginUser2 },"reject");return false;' >Reject</button></td> --%>
										</tr>
										</ct:forEach>
                                            </table>
                                           </ct:if>
                                           <ct:if test="${empty listTotCalendar}">
												NO Records Available
												</ct:if>
                                                                               </fieldset>
                                                    </div>
                                                </div>
                 
        </div>
      </div>
    
</section>