
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
        <!-- @author Jyoti Mekal -->

                <!-- main body -->
                <section>
                    <div class="container-fluid">
                        <div style="padding:100px">
                          
                                <!-- Page Content -->
                                <div id="page-content-wrapper">
                                    <div class="container-fluid">
                           
            
<fieldset><legend><h2>Learning Resources</h2></legend>
<ct:if test="${!empty learningResourceList}">
	  <table id="datatablesfosrest" class="table table-bordered table-responsive">
	<thead>
	<tr>
	<th >Sr. No</th>
		<th >Subject Name</th>
		<!-- <th >Content Name</th>
		<th >Content Type</th> -->
		<th >Study Material</th>
	</tr>
	</thead>
	<ct:forEach items="${learningResourceList}" var="Lrlist" varStatus="loop">
	<tr>
			<td>${loop.count}</td>
			<td>${Lrlist[0]}</td>
		<%-- <td>${Lrlist[1]}</td>
			<td>${Lrlist[2]}</td> --%>
			<%-- <td><a href="${Lrlist[3]}" target="_blank">${Lrlist[3]}</a></td> --%>
			<td><ct:choose>
			<ct:when test="${ Lrlist[1]== 'No Study-Material'}">No Study-Material</ct:when>
			<ct:otherwise><a href="${Lrlist[1]}" target="_blank" >${Lrlist[1]}</a></ct:otherwise> 
			</ct:choose></td>
         <%--   <td><a href="" >Fosrest/Subject/${Lrlist[0]}</a></td> --%>
		</tr>
	</ct:forEach>
	</table>
</ct:if>
<ct:if test="${empty learningResourceList}">
NO Data Available
</ct:if>
</fieldset> 
</div>
</div>
</div>
</div>
</section>
