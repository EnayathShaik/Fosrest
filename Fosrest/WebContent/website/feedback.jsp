<!-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FOSTAC - Food Safety Training and Certification</title>

[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]
</head>
/head

<body class="homepage">
<section id="main-slider" class="no-margin">
    <div class="carousel-inner innerpage">
        <div class="container">
          <div class="row slide-margin">
            <div class="col-sm-12">
            <h1 class="animation animated-item-1" style="padding-bottom:10px;">REGISTER HERE</h1>
            </div>
              <div class="circle-wrap circle-wrap-inner center-block">              
              <ul>
                <li><a href="#"><img src="website/images/trainee.png"></a></li>
                <li><a href="#"><img src="website/images/trainer.png"></a></li>
                <li><a href="#"><img src="website/images/training-partner.png"></a></li>
                <li><a href="#"><img src="website/images/assessor.png"></a></li>
              </ul>
            </div>
          </div>
        </div>
    
      /.item 
      
      /.item 
      
      /.item 
    </div>
    /.carousel-inner 

  /.carousel 
</section>
/#main-slider 

/#feature

<section id="ab">
  <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
  <div class="row">
    <div class="col-md-6 col-sm-6">
      <h2 style="float:left; border-bottom: 1px solid #339;">Feedback</h2>
    </div>
  </div>
  
  <div class="row">
    <div class="col-md-2 col-sm-2">
      <p class="course-name">Name:</p>
      <input class="textfield-format" name="" type="text">
    </div>
  </div>
  
  <div class="row">
    <div class="col-md-2 col-sm-2">
      <p class="course-name">Email:</p>
      <input class="textfield-format" name="" type="text">
    </div>
  </div>
  
  <div class="row">
    <div class="col-md-2 col-sm-2">
      <p class="course-name">Subject:</p>
      <input class="textfield-format" name="" type="text">
    </div>
  </div>
  
  
  <div class="row">
    <div class="col-md-2 col-sm-2">
      <p class="course-name">Message:</p>
      <textarea name="" cols="4" rows="4"></textarea>
    </div>
  </div>
  </div>
  <div class="row">
    <div class="col-md-2 col-sm-2">
      <p class="course-name "></p>
    </div>
    <div class="col-md-2 col-sm-2">
      <button style="" class="btn" type="button"><strong>Submit</strong></button>
    </div>
  </div>
  </div>
</section>
</body>
</html> -->

<%@ taglib prefix="cf" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib prefix="cs" uri="http://www.springframework.org/tags" %>
        <%@ taglib prefix="ct" uri="http://java.sun.com/jsp/jstl/core" %>
           <!--  <script>
                function OnStart() {
                   BlankFields();
                }
                window.onload = OnStart;

            </script> -->
            <script>
                function BlankFields() {
                    //document.getElementById("emailAddress").value='';
                    //document.getElementById("messageDetails").value='';
                }

            </script>
              <script type='text/javascript'>
                function validateFields() {
                	
                    /* if(document.getElementById("emailAddress").value=="") {
                    document.getElementById("emailAddress").style.borderColor = "red";
                    document.getElementById("emailAddressError").style.display = 'block';
                    document.getElementById("emailAddress").focus();
                    return false;
                    }else{
                        document.getElementById('emailAddress').style.borderColor = "#ccc";
                        document.getElementById("emailAddressError").style.display = 'none';
                        } */
                    
                    var x = document.getElementById('emailAddress').value;
                        var a=document.getElementById("messageDetails").value;
                      var c=a.length;
                    var atpos = x.indexOf("@");
                    var dotpos = x.lastIndexOf(".");
                    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
                      document.getElementById('emailAddress').style.borderColor = "red";
                        document.getElementById("emailAddressError").style.display = 'block';
                        document.getElementById("emailAddress").focus();
                        return false;
                    } else {
                        document.getElementById('emailAddress').style.borderColor = "#ccc";
                        document.getElementById("emailAddressError").style.display = 'none';
                    }
                    if (document.getElementById("messageDetails").value == "") {
                    	document.getElementById("messageDetails").style.borderColor = "red";
                        document.getElementById("messageDetailsError").style.display = 'block';
                        document.getElementById("messageDetails").focus();
                        return false;
                    } else if((document.getElementById("messageDetails").value).length>2000){
                     document.getElementById("messageDetailsError2").style.display = 'block';
                    } 
                    else {
                        document.getElementById('messageDetails').style.borderColor = "#ccc";
                        document.getElementById("messageDetailsError").style.display = 'none';
                    }
                    return (true);
                }
            </script> 

            <!-- horizontal navigation -->
            <cf:form action="shareInitiativesave.fssai" name="myForm" method="POST" commandName="ContactTrainee" onsubmit="return validateFields();">
               <%--  <section>
                    <%@include file="website/roles/top-menu.jsp"%>
                </section> --%> 

                <!-- main body -->
                <section class="main-section-margin-top">
                    <div class="container-fluid">
                        <div id="wrapper">

                            <!-- Sidebar menu -->
                           <%-- <%@include file="../roles/slider.jsp" %> --%>
                                <!-- Sidebar menu -->
                                <!-- /#sidebar-wrapper -->
                                <!-- Page Content -->
                                <div id="page-content-wrapper">
                                    <div class="container-fluid">

                                        <!-- vertical button -->
                                        <!-- <div class="row">
                                            <div class="col-lg-12">
                                                <a href="#menu-toggle" class="vertical-menu-position-btn" id="menu-toggle"> <i class="fa fa-bars"></i> <span class="orange-font">Welcome </span> </a>
                                            </div>
                                        </div> -->

                                        <!-- add the content here for main body -->
                                        <!-- feedback form  -->

                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-xs-12 contact-margin-top">
                                                    <fieldset>
                                                        <legend>
                                                            <h2>Feedback.!</h2></legend>
                                                        <br>
                                                        <form>
                                                            <div class="form-group">

                                                                <label>Your Email Address: &nbsp;&nbsp;</label>
                                                                <label class="error" style="color:red;"> ${created }</label>
                                                                <label class="error visibility" id="emailAddressError" style="color:red;">* enter your email address </label>
                                                                <cf:input type="emailAddress" path="emailAddress" class="form-control" value="${defaultMail}" placeholder="Enter Your Email" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Message Details</label>
                                                                <label class="error visibility" id="messageDetailsError" style="color:red;">* write your message</label>
                                                                <label class="error visibility" id="messageDetailsError2" style="color:red;">* Message should be in 2000 characters</label>
                                                                <cf:textarea class="form-control" path="messageDetails" placeholder="Enter Your Message (2000 Words)"/>
                                                            </div>
                                                            <input style="margin-top:20px; width:100px;" type="submit" class="form-control login-btn btn" value="Submit" />
                                                        </form>
                                                    </fieldset>


                                                </div>
                                                <div class="col-md-2 hidden-xs"> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </section>

                <!-- scripts -->

            </cf:form>

            <!-- <script>
                var id = localStorage.getItem('activeID');
                document.getElementById(id).className = "active";

            </script> -->