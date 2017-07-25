<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String strNewDate = null;
	try {

		strNewDate = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
	} catch (Exception e) {
	}
%>

<head>
<title></title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
	function printDiv() {
		var printContents = document.getElementById('dvContainer').innerHTML;
		var originalContents = document.body.innerHTML;
		document.body.innerHTML = printContents;
		window.print();
		document.body.innerHTML = originalContents;
	}
/* 
	$("#btnPrint").live("click", function() {
		var divContents = $("#aaa").html();
		var printWindow = window.open('', '', 'height=400,width=800');
		//printWindow.document.write('<html><head><title>DIV Contents</title>');
		printWindow.document.write('</head><body >');
		printWindow.document.write(divContents);
		printWindow.document.write('</body></html>');
		printWindow.document.close();
		printWindow.print();
	});
*/
</script>
</head>

<body>
	<form>
		<!-- horizontal navigation -->
		<section>
			<%@include file="../roles/top-menu.jsp"%>
		</section>
		<!-- main body -->
		<section class="main-section-margin-top">
			<div class="container-fluid">
				<div id="wrapper">
					<!-- Sidebar menu -->
					<%@include file="../roles/slider.jsp"%>
					<!-- Sidebar menu -->
					<!-- /#sidebar-wrapper -->
					<!-- Page Content -->
					<div id="page-content-wrapper">
						<div class="container-fluid">
							<!-- vertical button -->
							<div class="row">
								<div class="col-lg-12">
									<a href="#menu-toggle" class="vertical-menu-position-btn"
										id="menu-toggle"> <i class="fa fa-bars"></i> <span
										class="orange-font">Welcome ${userName}</span>
									</a>
								</div>
							</div>
							<!-- add the content here for main body -->
							<!-- timeline  -->
							<div class="container-fluid">
								<div class="row">
									<div id="dvContainer">

										<!-- html code to add from here -->
										<div id="aaa" class="col-xs-12 certi-width">
											<div class="col-xs-12">
												<img src="website/img/certificate-final_blank.png"
													class="img-responsive">
											</div>

											<div class="col-xs-12 this-certify" style="top: -63em;">
												<h1 class="text-center th-pos">
													<b>Certificate</b>
												</h1>
												<br /> <br /> <br />

												<h3 class="text-center th-pos">This is to certify that</h3>
												<p class="text-center for-p">
													<span><strong>${traineeCertificateName}</strong></span>
												</p>
												<hr class="nam-hr">
												<div class="di-msg">
													<!--  <p>has received necessary training required to be a trainer for Project Clean Streat Food . The Training</p> -->
													<p>
														has attended and successfully completed the <span><strong
															style="margin-left: 34px;">
																${calendarDetail.designation}-
																${calendarDetail.trainingType}-
																${calendarDetail.trainingPhase} Programme </strong> </span>
													</p>
													<hr style="margin-left: 369px; margin-top: -7px; width: 43%; border-top: 1px solid #bdbcbc;" />
													<p>organised by Fssai & Commissionerate of Food Safety. The Training was held from <span class="on-dat-general"
															style="border-bottom: 1px solid #ccc; left: 11px;">${trainingDate}</span>
													</p>
													<p>
														to <span class="on-dat-general"
															style="border-bottom: 1px solid #ccc; left: 15px;">${trainingDate}</span>
														<span style="margin-left: 30px;"> at</span> <span
															style="margin-left: 147px; left: 2%;"><strong>${trainingAddress}</strong>
														</span> <span class="full-stop-general">.</span>
													</p>
													<hr style="border-top: 1px solid #bdbcbc; width: 42%; margin-top: -10px; margin-left: 190px;">
												</div>
											</div>

											<div class="col-xs-12 sign-pos-general" style="top: -56em;">
												<div class="col-md-6 col-xs-6">
													<hr class="left-sign">
													<h4></h4>
													<p class="left-p" style="left: 78px;">
														<b style="left: 78px;">Madhavi Das</b> <br /> Chief
														Management Service Officer <br /> <span>Fssai,
															New-Delhi.</span>

													</p>
												</div>
												<div class="col-md-6 col-xs-6">
													<hr class="right-sign">
													<p class="right-p text-center">
														Commissioner Of Food Safety <br />
														<span>FSSAI</span>
													</p>
												</div>
											</div>

											<div class="col-xs-12 cert-btm-general" style="top: -47em;">
												<p class="btm-p">Certificate Number : ${certificateID}</p>
												<p class="btm-p">
													Date Issued :
													<%=strNewDate%></p>
												<p class="btm-p">Refresher Due : 2 years from date of
													issue.</p>
											</div>



										</div>
										<!-- html code ends here -->
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-4 col-xs-12"></div>
								<div class="col-md-4 col-xs-12" style="top: -32em; left: -2px;">
									<a href="#" onclick="printDiv()" class="btn login-btn"
										style="width: 100%;">Print</a>
								</div>
								<div class="col-md-4 col-xs-12"></div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
		<!-- scripts -->
	</form>
</body>

</html>