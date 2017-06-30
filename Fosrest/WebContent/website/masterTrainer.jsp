
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
<ct:if test="${!empty mastertrainerList}">
	  <table id="datatablesfosrest" class="table table-bordered table-responsive">
	<thead>
	<tr>
	<th >Sr. No</th>
		<th >Name</th>
		<th >Email</th>
		<th >Mobile</th>
		<th >Subject Name</th>
	</tr>
	</thead>
	<ct:forEach items="${mastertrainerList}" var="Lrlist" varStatus="loop">
	<tr>
			<td>${loop.count}</td>
			<td>${Lrlist[0]}</td>
		 <td>${Lrlist[1]}</td>
			<td>${Lrlist[2]}</td> 
			<td>${Lrlist[3]}</td> 
			
		</tr>
	</ct:forEach>
	</table>
</ct:if>
<ct:if test="${empty mastertrainerList}">
NO Data Available
</ct:if>
</fieldset> 
</div>
</div>
</div>
</div>
</section>
