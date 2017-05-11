
<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
        <!-- @author Jyoti Mekal -->

   			  <ct:url var="addAction" value="/UnitMaster/add.fssai" ></ct:url>
            <cf:form action="fotestcertification.fssai" name="myForm" method="POST" commandName="certification">

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
                                            <div class="col-lg-12">
                                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome Admin</span>
                                                </a>
                                            </div>
                                        </div>
            
<fieldset><legend><h3>certification</h3></legend>
<ct:if test="${!empty listcertification}">
	 <table border="1" id="datatablesfosrest" class="table table-bordered table-responsive">
	<tr>
	<th width="80">Sr. No</th>
		<th width="80">Course Name</th>
		<th width="120">Training Date & Time</th>
		<th width="120">Training LAB Name</th>
		<th width="120">certification</th>

	
	</tr>
	<ct:forEach items="${listcertification}" var="listcertification">
	
	
		<tr>
			<td>1</td>
			<td>${listcertification.courseName}</td>
			<td>${listcertification.trainingDate} &nbsp;&nbsp;&nbsp;&nbsp;  ${listcertification.trainingTime}  </td>
			<td>${listcertification.trainingLab}</td>
			<td><input type="button" value="Start Here"  class="form-control login-btn"></td>
		</tr>
	</ct:forEach>
	</table>
</ct:if>
</fieldset>
</div>
</div>
</div>
</div>
</section>
            </cf:form>