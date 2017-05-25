<%@page import="com.ir.form.common.EventsCreater"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
<script type="text/javascript">
	function preventBack() {
		window.history.forward();
	}
	setTimeout("preventBack()", 10);
	window.onunload = function() {
		null
	};
</script>

<head>
<base href="<%=basePath%>">

<title>Fosrest</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FOSTAC - Food Safety Training and Certification</title>
<!-- core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/swipebox.css" rel="stylesheet">
<link href="css/owl.transitions.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/monthly.css" rel="stylesheet">


<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    
   <style>
#news .item img {
	display: block;
	width: 100%;
	height: auto;
}
#blog .item img {
	display: block;
	width: 100%;
	height: auto;
}
#gallery-photo .item img {
	display: block;
	width: 100%;
	height: auto;
7
}
</style>

</head>
<!--/head-->

<body class="homepage">

	<header id="header">
 <div class="top-bar">
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-xs-4">
          <div class="top-logo"><a href="fostac.fssai"><img class="img-responsive" src="website/images/fosrest-logo.png" alt="Food Safety Regulatory Staff Training" title="Food Safety Regulatory Staff Training"></a> </div>
        </div>
        <div class="col-sm-6 col-xs-8">
          <div class="social">
            <div class="social-share"><a href="http://www.fssai.gov.in/" target="_blank"><img class="img-responsive" src="website/images/fssai.png"></a></div>
          </div>
        </div>
      </div>
    </div>
    <!--/.container--> 
  </div>
		<!--/.top-bar-->

<nav class="navbar navbar-inverse" role="banner">
    <div class="container">
      <div class="navbar-header">
        <button style="background:#000070;" type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div class="collapse navbar-collapse navbar-left text-center">
        <ul class="nav navbar-nav">
          <li class="active"><a href="fostac.fssai">HOME</a></li>
          <li><a href="about.fssai">ABOUT</a></li>
          <li class="dropdown"> <a href="courses.html" class="dropdown-toggle" data-toggle="dropdown">Training<i class="fa fa-angle-down"></i></a>
            <ul class="dropdown-menu">
              <li><a href="induction-training.html">Induction Training</a></li>
              <li><a href="refresher-training.html">Refresher Training</a></li>
              <li><a href="training-of-trainers.html">Training of Trainers</a></li>
              <li><a href="specific-training.html">Specific Training</a></li>
            </ul>
          </li>
          <li><a href="#">Useful Links</a></li>
          <li><a href="faq.fssai">FAQ</a></li>
          <li><a href="contact.fssai">CONTACT</a></li>
          <li><a href="login.fssai">LOGIN</a></li>
        </ul>
        <div class="search">
          <form role="form" class="searchbar">
            <input type="text" class="search-form" autocomplete="off" placeholder="Search...">
            <i style="color:#71b44b;" class="fa fa-search"></i>
          </form>
        </div>
      </div>
    </div>
    <!--/.container--> 
  </nav>
  <!--/nav--> 

	</header>
	<!--/header-->


<section id="main-slider" class="no-margin">
  <div class="carousel slide">
    <div class="carousel-inner">
      <div class="item active header-bg" style="background-image: url(website/images/slider/bg1.jpg)">
        <div class="container">
          <div class="row slide-margin">
            <div class="col-sm-12">
              <div class="carousel-content">
                <h1 class="animation animated-item-1">Food Safety Regulatory Staff Training</h1>
                <h2 class="animation animated-item-2">
                  <a class="btn topbtn" href="login.fssai">Login</a>
                </h2>
              </div>
            </div>
            <div class="col-sm-6 hidden-xs animation animated-item-4">
              <div class="slider-img"> </div>
            </div>
            <div class="circle-wrap center-block">
              <ul>
                <li><a href="induction-training.html"><img src="website/images/induction.png"></a></li>
                <li><a href="refresher-training.html"><img src="website/images/refresher-training.png"></a></li>
                <li><a href="training-of-trainers.html"><img src="website/images/training-of-trainers.png"></a></li>
                <li><a href="specific-training.html"><img src="website/images/specific-training.png"></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!--/.item--> 
      
      <!--/.item--> 
      
      <!--/.item--> 
    </div>
    <!--/.carousel-inner--> 
  </div>
  <!--/.carousel--> 
</section>
<!--/#main-slider--> 

	<!--/#feature-->
<section id="feature" >
  <div class="container">
    <div class="row pdtop">
      <div class="features">
        <div class="col-md-3 col-xs-12 wow fadeInDown btm-space" data-wow-duration="1000ms" data-wow-delay="600ms"> <a href="trainingInstitute.fssai">
          <div class="feature-wrap course-bg"> <img class="img-responsive center-block" src="website/images/training-partner-icon.png">
            <h3 class="industry-heading">Training Partner</h3>
          </div>
          </a> </div>
        <!--/.col-md-4-->
        
        <div class="col-md-3 col-xs-12 wow fadeInDown btm-space" data-wow-duration="1000ms" data-wow-delay="600ms"> <a href="trainer.fssai">
          <div class="feature-wrap course-bg"> <img class="img-responsive center-block" src="website/images/trainer-icon.png">
            <h3 class="industry-heading">Trainer</h3>
          </div>
          </a> </div>
        <!--/.col-md-4-->
        
        <div class="col-md-3 col-xs-12 wow fadeInDown btm-space" data-wow-duration="1000ms" data-wow-delay="600ms"> <a href="#">
          <div class="feature-wrap course-bg"> <img class="img-responsive center-block" src="website/images/learning-resource-icon.png">
            <h3 class="industry-heading">Learning resource</h3>
          </div>
          </a> </div>
        <!--/.col-md-4-->
        
       
        <!--/.col-md-4--> 
        
      </div>
      <!--/.services--> 
    </div>
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<section id="feature" style="margin:0px; padding:0px;" >
  <div class="container">
    <div class="row">
      <div class="features">
        <div class="col-md-6 col-xs-12 wow fadeInDown btm-space" data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="row">
            <div class="course-heading">Photo Gallery</div>
          </div>
          <div class="feature-wrap training-box">
            <div id="gallery" class="owl-carousel">
              <div class="item"> <a href="website/images/photo-gallery.jpg" class="swipebox" title="Event Name"> <img src="website/images/photo-gallery.jpg" alt="image"> </a> </div>
              <div class="item"> <a href="website/images/photo-gallery.jpg" class="swipebox" title="Event Name"> <img src="website/images/photo-gallery.jpg" alt="image"> </a> </div>
              <div class="item"> <a href="website/images/photo-gallery.jpg" class="swipebox" title="Event Name"> <img src="website/images/photo-gallery.jpg" alt="image"> </a> </div>
              <div class="item"> <a href="website/images/photo-gallery.jpg" class="swipebox" title="Event Name"> <img src="website/images/photo-gallery.jpg" alt="image"> </a> </div>
            </div>
          </div>
        </div>
        <!--/.col-md-4-->
        
      <!--   <div class="col-md-6 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="course-heading">News and Updates</div>
          <div id="news" class="owl-carousel">
            <div class="item">
              <p class="txt-ellip" style="padding:20px;">FSSAI vide Gazette notification number S.O 2428 (E) dated the 13th July, 2016 notified 112 NABL accredited food testing laboratories for the purpose of carrying out Analysis of samples taken under Section 47 of the Food Safety and Standard Act, 2006.</p>
              <div class=" text-center"><a href="#" class="btn btn-default" target="_blank">Read More</a></div>
            </div>
            <div class="item">
              <p class="txt-ellip" style="padding:20px;">FSSAI vide Gazette notification number S.O 2428 (E) dated the 13th July, 2016 notified 112 NABL accredited food testing laboratories for the purpose of carrying out Analysis of samples taken under Section 47 of the Food Safety and Standard Act, 2006.</p>
              <div class="text-center"><a href="#" class="btn btn-default" target="_blank">Read More</a></div>
            </div>
          </div>
        </div> -->
         <div class="col-md-3 col-xs-12 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="page">
            <div style="display:inline-block;">
              <div class="monthly" id="mycalendar"></div>
            </div>
          </div>
        </div>
        <!--/.col-md-4--> 
        
      </div>
      <!--/.services--> 
    </div>
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>
<section id="feature" style="margin:0px; padding:0px;" >
  <div class="container">
    <div class="row">
      <div class="features">
        <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="feature-wrap training-box center-block">
            <div style="margin-top:10px; padding:0px;"><a href="#"><img src="website/images/share-intitiave.jpg"></a></div>
          </div>
        </div>
        <!--/.col-md-4-->
        
        <div class="col-md-6 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
          <div class="feature-wrap training-box center-block">
            <div style="margin-top:10px; padding:0px;"><a href="#"><img src="website/images/fssai-blog.jpg"></a></div>
          </div>
        </div>
        <!--/.col-md-4--> 
        
      </div>
      <!--/.services--> 
    </div>
    <!--/.row--> 
  </div>
  <!--/.container--> 
</section>

<section id="bottom">
  <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
    <div class="row">
      <div class="col-md-3 col-sm-6">
        <div class="widget center-block">
          <ul>
            <li><a href="fostac.fssai">Home</a></li>
            <li><a href="about.fssai">About</a></li>
            <li class="dropdown"> <a href="courses.html" class="dropdown-toggle" data-toggle="dropdown">Courses<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="basic-level.html">Basic Level</a></li>
                <li><a href="advance-level.html">Advance Level</a></li>
                <li><a href="special-level.html">Special Level</a></li>
              </ul>
            </li>
            <li><a href="#">Risk & Solutions</a></li>
            <li><a href="#">Help</a></li>
            <li><a href="contact.fssai">Contact</a></li>
          </ul>
        </div>
      </div>
      <!--/.col-md-3-->
      
      <div class="col-md-3 col-sm-6">
        <div class="widget center-block">
          <ul>
            <li><a href="#">Sitemap</a></li>
            <li><a href="disclaimer.html">Disclaimer</a></li>
            <li><a href="#">Archives</a></li>
            <li><a href="#">Useful Links</a></li>
            <li><a href="#">Faqs</a></li>
            <li><a href="#">Feedback</a></li>
          </ul>
        </div>
      </div>
      <!--/.col-md-3-->
      
      <div class="col-md-3 col-sm-6">
        <div class="widget center-block text-center" style="border-right: none;">
          <ul>
            <li class="subscribe">Sign up for our mailing list to get latest updates and offers.
              <form action="#" id="form-subscribe">
                <div class="form-field">
                  <input type="email" placeholder="Email Address" id="email">
                  <input class="btn" type="submit" id="submit" value="Subscribe">
                </div>
              </form>
            </li>
            <li class="pd-top"> <a href="#" target="_blank"><img src="website/images/facebook.png" width="30" height="30"></a>&nbsp; <a href="#" target="_blank"><img src="website/images/twitter.png" width="30" height="30"></a>&nbsp; <a href="#" target="_blank"><img src="website/images/linkedin.png" width="30" height="30"></a> &nbsp;<a href="#" target="_blank"><img src="website/images/google-plus.png" width="32" height="32"></a></li>
          </ul>
        </div>
      </div>
      <!--/.col-md-3-->
      
      <div class="col-md-3 col-sm-6">
        <div class="widget center-block text-center" style="border-right:none;">
          <ul>
            <li><a href="http://www.fssai.gov.in/" target="_blank"><img src="website/images/fssai.png" alt="FSSAI" width="151" height="86"></a></li>
          </ul>
        </div>
      </div>
      <!--/.col-md-3--> 
    </div>
  </div>
</section>
	<!--/#bottom-->

<footer id="footer" class="midnight-blue">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">Design and Developed by &nbsp;<a href="http://www.zentechinfo.com/" target="_blank" style="color:#1c1b1b; text-decoration:underline;">Zentech Info Solutions Pvt. Ltd.</a> &copy; FSSAI 2016- All Right Reserved.</div>
    </div>
  </div>
</footer>
<!--/#footer--> 
<script src="js/jquery.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.isotope.min.js"></script> 
<script src="js/wow.min.js"></script> 
<script src="js/owl.carousel.js"></script> 
<script src="js/monthly.js"></script> 
<script src="js/jquery.swipebox.js"></script> 
<script>
        $(document).ready(function () {

            $("#gallery").owlCarousel({

                navigation: false, // Show next and prev buttons
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true,
                autoPlay: true,
				responsive: true

                // "singleItem:true" is a shortcut for:
                // items : 1, 
                // itemsDesktop : false,
                // itemsDesktopSmall : false,
                // itemsTablet: false,
                // itemsMobile : false

            });

        });
    </script> 
<script>
        $(document).ready(function () {

            $("#news").owlCarousel({

                navigation: false, // Show next and prev buttons
                slideSpeed: 300,
                paginationSpeed: 400,
                singleItem: true,
                autoPlay: true,
				responsive: true

                // "singleItem:true" is a shortcut for:
                // items : 1, 
                // itemsDesktop : false,
                // itemsDesktopSmall : false,
                // itemsTablet: false,
                // itemsMobile : false

            });

        });
    </script> 
<script type="text/javascript">
    ; (function ($) {

        $('.swipebox').swipebox();

    })(jQuery);
    </script> 
<script type="text/javascript">
    $(window).load(function () {

        $('#mycalendar').monthly({
            mode: 'event',
            //jsonUrl: 'events.json',
            //dataType: 'json'
            xmlUrl: 'events.xml'
        });

        $('#mycalendar2').monthly({
            mode: 'picker',
            target: '#mytarget',
            setWidth: '250px',
            startHidden: true,
            showTrigger: '#mytarget',
            stylePast: true,
            disablePast: true
        });

        switch (window.location.protocol) {
            case 'http:':
            case 'https:':
                // running on a server, should be good.
                break;
            case 'file:':
                alert('Just a heads-up, events will not work when run locally.');
        }

    });
    </script>
</body>
</html>
	
