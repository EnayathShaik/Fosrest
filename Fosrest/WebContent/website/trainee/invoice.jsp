<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags"%>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.util.Date"%>
        <html xmlns="http://www.w3.org/1999/xhtml">
        <%
String strNewDate = null;
try{

	strNewDate=new SimpleDateFormat("dd/MM/yyyy").format(new Date());
}catch(Exception e){
}
%>

            <head>
                <title></title>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <script type="text/javascript">
                    $("#btnPrint").live("click", function () {
                        var divContents = $("#dvContainer").html();
                        var printWindow = window.open('', '', 'height=400,width=800');
                        /* printWindow.document.write('<html><head><title>DIV Contents</title>'); */
                        printWindow.document.write('</head><body >');
                        printWindow.document.write(divContents);
                        printWindow.document.write('</body></html>');
                        printWindow.document.close();
                        printWindow.print();
                    });
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
                                <%@include file="../roles/slider.jsp" %>
                                    <!-- Sidebar menu -->
                                    <!-- /#sidebar-wrapper -->
                                    <!-- Page Content -->
                                    <div id="page-content-wrapper">
                                        <div class="container-fluid">
                                            <!-- vertical button -->
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome INVOICE</span> </a>
                                                </div>
                                            </div>
                                            <!-- add the content here for main body -->
                                            <!-- timeline  -->
                                            <div id="dvContainer">
                                                <div class="container-fluid">
                                                   <!--  <div class="row">
                                                        html code to add from here
                                                        <div class="container"> -->
      <div class="row">
        <div class="col-xs-6">
          <h1>
            <a href="https://twitter.com/tahirtaous">
            <img src="website/img/logo.png"></a>
          </h1>
        </div>
        <div class="col-xs-6 text-right">
          <h1>INVOICE</h1>
          <h1><small>Invoice #${InvoiceNum}</small></h1>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-5">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4>From: <a href="#">Zentech Info Solutions Pvt. Ltd.</a></h4>
            </div>
            <div class="panel-body">
              <p>
                Address: 105, 1st floor Building NO.-2(A/3), Sector-1, MBP 2-MIDC Complex, Mahape<br>
                Navi Mumbai, Maharashtra 400710  <br>
                Phone: 022 4100 8880 <br>
              </p>
            </div>
          </div>
        </div>
        <div class="col-xs-5 col-xs-offset-2 text-right">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4>To : <a href="#">${custName }</a></h4>	
            </div>
            <div class="panel-body">
              <p>
              <p> 	INVOICE NUMBER  :${InvoiceNum} </p>
              <p>  INVOICE DATE   : ${invoiceDate}</p>
              <p>  CLIENT PO #	4700071686</p>
              <p>  TERMS	MONTHLY T&M</p>
              <p>  F.O.B.  	Mumbai Maharashtra</p>
              <p>${custAdd} </p>
           
              </p>
            </div>
          </div>
        </div>
      </div>
      <!-- / end client details section -->
       <ct:if test="${!empty listCustDetails}">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th> <h4>Employee Name</h4></th>
            <th><h4>Description</h4></th>
            <th><h4>Rate/Price</h4></th>
            <th><h4>Sub Total</h4></th>
          </tr>
        </thead>
         <ct:forEach items="${listCustDetails}" var="CustDetails">
         	<tr>
			<td>${CustDetails.employeeName}</td>
			<td>${CustDetails.description}</td>
			<td>${CustDetails.unitPrice}</td>
			<td>${CustDetails.unitPrice}</td>
			</tr>
		</ct:forEach>
		   </table>
        </ct:if>
       <!--  <tbody>
          <tr>
            <td>Article</td>
            <td><a href="#">Title of your article here</a></td>
            <td class="text-right">-</td>
            <td class="text-right">$200.00</td>
            <td class="text-right">$200.00</td>
          </tr>
          <tr>
            <td>Template Design</td>
            <td><a href="#">Details of project here</a></td>
            <td class="text-right">10</td>
            <td class="text-right">75.00</td>
            <td class="text-right">$750.00</td>
          </tr>
          <tr>
            <td>Development</td>
            <td><a href="#">WordPress Blogging theme</a></td>
            <td class="text-right">5</td>
            <td class="text-right">50.00</td>
            <td class="text-right">$250.00</td>
          </tr>
        </tbody>
      </table> -->
      <div class="row text-right">
        <div class="col-xs-2 col-xs-offset-8">
          <p  style="width: 178px">
            <strong>
            Sub Total : <br>
           Service TAX - ${ service } % :  <br>
           Swaccha Bharat  - ${ swaccha } % : <br>
           Krishi TAX - ${ krishi } %: <br>
            Total : <br>
            </strong>
          </p>
        </div>
        <div class="col-xs-2">
          <strong>
          ${SubTotal}  <br>
           ${serviceVal }<br>	
          ${ swacchaVal }<br>	
          ${krishiVal }<br>	
        	${sumTax } 
          <%
          %>
            <br>
          </strong>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-5">
          <div class="panel panel-info">
            <div class="panel-heading">
              <h4>For Zentech Info Solutions Pvt Ltd</h4>
            </div>
            <div class="panel-body">
              <p>Authorised Signatory</p>
              <p>Email  : accounts@zentechinfo.com</p>
 
            </div>
          </div>
        </div>
        <div class="col-xs-7">
          <div class="span7">
            <div class="panel panel-info">
              <div class="panel-heading">
                <h4>MAKE ALL AMOUNT PAYABLE TO:</h4>
              </div>
              <div class="panel-body">
                <p>
                 <p> Zentech Info Solutions Pvt Ltd </p>
                 <p>
                  Bank : CANARA BANK </p>
                   <p>
                   Br:New MARINE LINES, Mumbai 400020.
                 </p> 
                 <p>A/C No: 1389261980019.</p>
                 <p>IFSC: CNRB0001389</p>
                </p>
                <h4>Payment should be made by Bank Transfer</h4>
              </div>
            </div>
          </div>
        </div>
                  <div>THANK YOU FOR YOUR BUSINESS!</div>
     <!--  </div>
    </div> -->
                                                         <!-- html code ends here -->
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