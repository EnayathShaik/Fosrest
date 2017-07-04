<%@page import="com.ir.form.common.EventsCreater"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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

<style>
.box-shadow (@x: 0, @y: 1px, @blur: 2px, @alpha: 0.33) {
  -webkit-box-shadow: @x @y @blur rgba(0, 0, 0, @alpha);
  -moz-box-shadow: @x @y @blur rgba(0, 0, 0, @alpha);
  box-shadow: @x @y @blur rgba(0, 0, 0, @alpha);
}

.timepicker {
  @clock-padding: 5px;
  
  background-color: #F2F2F2;
  position: absolute;
  color: #8C8C8C;
  border: 1px solid #B5B5B5;
  .box-shadow(2px, 2px, 4px);
  z-index: 2147483647;
  
  .clock {
    width: 200px;
    height: 200px;
    position: relative;
    padding: @clock-padding;
  }
  
  .done {
    cursor: pointer;
    text-align: center;
    text-wrap: nowrap;
    line-height: 34px;
    font-size: 14px;
    display: block;
    border-top: 1px solid #DEDEDE;
    &:hover {
      background-color: #DEDEDE;
      color: #848484;
    }
  }
  
  .meridiem {
    position: absolute;
    bottom: @clock-padding;
    width: 32px;
    height: 32px;
    background-color: white;
    line-height: 32px;
    font-size: 14px;
    text-align: center;
    border-radius: 50%;
    cursor: pointer;
    
    &.selected {
      background-color: #D6F0F9;
      color: #6D828C;
    }
    &.am {
      left: @clock-padding;
    }
    &.pm {
      right: @clock-padding;
    }
  }
  
  .bubble {
    position: absolute;
    width: 32px;
    height: 32px;
    line-height: 32px;
    font-size: 14px;
    text-align: center;
    border-radius: 50%;
    cursor: pointer;
    
    &:hover {
      background-color: #D6F0F9;
      color: #6D828C;
    }
    
    &.selected {
      color: #D6F0F9;
      background-color: #33B4E4
    }
  }
  
  .unit {
    top: @clock-padding;
    background-color: white;
    
    &.hour {
      left: @clock-padding;
    }
    &.minute {
      right: @clock-padding;
    }
  }
  
  
  .face {
    width: 100%;
    height: 100%;
    background-color: white;
    border: none;
    border-radius: 50%;
    position: relative;
    
    &:after {
      position: absolute;
      top: 50%;
      left: 50%;
      width: 6px;
      height: 6px;
      margin: -3px 0 0 -3px;
      background-color: #33B4E4;
      border-radius: 50%;
      content: "";
      display: block;
    }
  }
  
  .hand {
    width: 0;
    height: 0;
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform-origin: 50% 100%;
    -moz-transform-origin: 50% 100%;
    -ms-transform-origin: 50% 100%;
    transform-origin: 50% 100%;
    pointer-events:none;
    background-color: #8C8C8C;
    
    &.minute {
      margin: -30% 0 0 -1px;
      padding: 30% 1px 0;
      border-radius: 1px 1px 0 0;
    }
    
    &.hour {
      margin: -23% 0 0 -2px;
      padding: 23% 2px 0;
      border-radius: 2px 2px 0 0;
    }
    
    &.selected {
      background-color: #33B4E4;
    }
  }
  
  .time {
    background-color: #F2F2F2;
  }
}
body {
  margin: 10px;
}
</style>

<script>
$(document).ready(function() {
	 $("#readFile").click(function() {
	    $.get('test.txt', function(data) {
	      $("#bottom_pane_options").html(data); // #bottom_pane_options is the div I want the data to go
	    }, 'text');
	 });
	});
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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="website/js/jquery.mousewheel.min.js"></script>
<script src="website/js/jquery.newstape.js"></script>
<link href="website/css/demo.css" rel="stylesheet">
<style>
.holder { 
  background-color:#ccc;
  width:300px;
  height:250px;
  overflow:hidden;
  padding:10px;
  font-family:Helvetica;
}
.holder .mask {
  position: relative;
  left: 0px;
  top: 10px;
  width:300px;
  height:240px;
  overflow: hidden;
}
.holder ul {
  list-style:none;
  margin:0;
  padding:0;
  position: relative;
}
.holder ul li {
  padding:10px 0px;
}
.holder ul li a {
  color:darkred;
  text-decoration:none;
}
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
body{
overflow-x:hidden;}
.xs3{
width:30%;
}
</style>
<script>
jQuery.fn.liScroll = function(settings) {
	settings = jQuery.extend({
		travelocity: 0.03
		}, settings);		
		return this.each(function(){
				var $strip = jQuery(this);
				$strip.addClass("newsticker")
				var stripHeight = 1;
				$strip.find("li").each(function(i){
					stripHeight += jQuery(this, i).outerHeight(true); // thanks to Michael Haszprunar and Fabien Volpi
				});
				var $mask = $strip.wrap("<div class='mask'></div>");
				var $tickercontainer = $strip.parent().wrap("<div class='tickercontainer'></div>");								
				var containerHeight = $strip.parent().parent().height();	//a.k.a. 'mask' width 	
				$strip.height(stripHeight);			
				var totalTravel = stripHeight;
				var defTiming = totalTravel/settings.travelocity;	// thanks to Scott Waye		
				function scrollnews(spazio, tempo){
				$strip.animate({top: '-='+ spazio}, tempo, "linear", function(){$strip.css("top", containerHeight); scrollnews(totalTravel, defTiming);});
				}
				scrollnews(totalTravel, defTiming);				
				$strip.hover(function(){
				jQuery(this).stop();
				},
				function(){
				var offset = jQuery(this).offset();
				var residualSpace = offset.top + stripHeight;
				var residualTime = residualSpace/settings.travelocity;
				scrollnews(residualSpace, residualTime);
				});			
		});	
};

$(function(){
    $("ul#ticker01").liScroll();
});
</script>
</head>
<!--/head-->

<body class="homepage">

	<header id="header">
		<div class="top-bar">
			<div class="container">
<!-- 				<div class="row"> -->
					<div class="col-sm-6 col-xs-4">
						<div class="top-logo">
							<a href="fostac.fssai"><img class="img-responsive"
								src="website/images/fosrest-logo.png"
								alt="Food Safety Regulatory Staff Training"
								title="Food Safety Regulatory Staff Training"></a>
						</div>
					</div>
					<div class="col-sm-6 col-xs-8">
						<div class="social">
							<div class="social-share">
								<a href="http://www.fssai.gov.in/" target="_blank"><img
									class="img-responsive" src="website/images/fssai-logonew.jpg" width="303"></a>
							</div>
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
					<button style="background: #000070;" type="button"
						class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse navbar-left text-center">
					<ul class="nav navbar-nav">
						<li class="active"><a href="fostac.fssai">HOME</a></li>
						<li><a href="about.fssai">ABOUT</a></li>
						<li class="dropdown"><a href="courses.html"
							class="dropdown-toggle" data-toggle="dropdown">Training<i
								class="fa fa-angle-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="induction-training.html">Induction
										Training</a></li>
								<li><a href="refresher-training.html">Refresher
										Training</a></li>
								<li><a href="training-of-trainers.html">Training of
										Trainers</a></li>
								<li><a href="specific-training.html">Specific Training</a></li>
							</ul></li>
						<li><a href="#">Useful Links</a></li>
						<li><a href="faq.fssai">FAQ</a></li>
						<li><a href="contact.fssai">CONTACT</a></li>
						<li><a href="login.fssai">LOGIN</a></li>
					</ul>
					<div class="search">
						<form role="form" class="searchbar">
							<input type="text" class="search-form" autocomplete="off"
								placeholder="Search..."> <i style="color: #71b44b;"
								class="fa fa-search"></i>
						</form>
					</div>
				</div>
			</div>
			<!--/.container-->
		</nav>
		<!--/nav-->

	</header>
	<!--/header-->
	<hr>
	
	
	
<div class="header">
<div class="container">
<div class="row" >
<div class="col-sm-8">
 <div class = "panel panel-default" style="border:1px solid #ccc;padding:3px;">
<div class = "panel-heading">
   <h4 class = "panel-title">
      <a data-toggle = "collapse"  href = "#collapseTwo">
      <center style="font-size:20px; color:#e6511a;font-weight:bold;">State Admin</center> 
      </a>
   </h4>
</div>

<div id = "collapseTwo" class = "panel-collapse collapse in">
   <div class = "panel-body" style="background-image: url(website/images/slider/bg2.jpg); height: 20em; ">
           <div class="row">
<div class="col-sm-12 text-center">
<div style="font-size:16px;color:#000;font-weight:bold;"><a href="login.fssai" style="color:#000;">Login</a></div>
</div>
</div> 
<div class="row" style="height:55px;">
</div>
<div class="row">
<div class="col-sm-2"></div>
<div class="col-sm-3">
	<div class="feature-wrap panelimg">
								<img class="img-responsive center-block" style="height: 50px;"
src="website/images/training-partner-icon.png"><a href="trainingInstitute.fssai">
<h3 class="industry-heading" style="color:#fff !important;padding:0px;">Training <br>Institute</h3></a>
							</div>
</div>
<div class="col-sm-3">
<div class="feature-wrap panelimg">
								<img class="img-responsive center-block" style="height: 50px;"
src="website/images/trainer-icon.png"><a href="trainer.fssai">
<h3 class="industry-heading" style="color:#fff !important;padding:0px;">Trainer <br>&nbsp;&nbsp;</h3></a>
							</div>
</div>
<div class="col-sm-3">
<div class="feature-wrap panelimg">
<img class="img-responsive center-block" style="height: 50px;"
src="website/images/learning-resource-icon.png"><a href="learningresource.fssai">
<h3 class="industry-heading" style="color:#fff !important;padding:0px;">Learning <br>resource</h3></a>
</div>
</div>
</div>
         </div>
      </div>
   </div>
	</div>
<div class="col-sm-4">
<div class = "panel-group" id = "accordion">
  <div class = "panel panel-default" style="border:1px solid #ccc;padding:3px;">
<div class = "panel-heading">
 <h4 class = "panel-title">
<a data-toggle = "collapse" href = "#collapseOne">
<center style="font-size:20px; color:#e6511a;font-weight:bold;">  Fssai Admin</center>
</a>
   </h4>
</div>
<div id = "collapseOne" class = "panel-collapse collapse in">
   <div class = "panel-body" style="background-image: url(website/images/slider/bg.jpg); height: 20em; width: 39em;">
<div class="row">
<div class="col-sm-8 text-center">
<div style="font-size:16px;color:#000;font-weight:bold;"><a href="login.fssai" style="color:#fff;">Login</a></div>
</div>
</div>
<div class="row" style="height:55px;">
</div>
<div class="row">

<div class="col-sm-4">
	<div class="feature-wrap panelimg" >
<img class="img-responsive center-block" style="height: 39px;"><a href="mastertrainer.fssai">
<h3 class="industry-heading" style="color:#fff !important;padding:0px;margin-bottom: 37px;">Master Trainer</h3></a></div>
</div>
<div class="col-sm-4">
<div class="feature-wrap panelimg">
<img class="img-responsive center-block" style="height: 25px;"><a href="TotCalendar.fssai">
<h3 class="industry-heading" style="color:#fff !important;padding:0px;margin-bottom: 28px;">Training of Trainer Calendar</h3></a></div>
</div>
<div class="col-sm-2"></div>
</div>         

         </div>
      </div>
      </div>
   </div>
	</div>
	</div>
	</div>
	</div>
	<div class="gallery">
	<div class="container">
	<div class="row">
			<div class="col-md-5 wow fadeInDown btm-space"
						data-wow-duration="1000ms" data-wow-delay="600ms">
						<div class="row">
							<div class="course-heading"> Gallery</div>
						</div>
						<div class="feature-wrap training-box">
							<div id="gallery" class="owl-carousel">
								<div class="item">
									<a href="website/images/photo-gallery.jpg" class="swipebox"
										title="Event Name"> <img
										src="website/images/photo-gallery.jpg" alt="image">
									</a>
								</div>
								<div class="item">
									<a href="website/images/photo-gallery.jpg" class="swipebox"
										title="Event Name"> <img
										src="website/images/photo-gallery.jpg" alt="image">
									</a>
								</div>
								<div class="item">
									<a href="website/images/photo-gallery.jpg" class="swipebox"
										title="Event Name"> <img
										src="website/images/photo-gallery.jpg" alt="image">
									</a>
								</div>
								<div class="item">
									<a href="website/images/photo-gallery.jpg" class="swipebox"
										title="Event Name"> <img
										src="website/images/photo-gallery.jpg" alt="image">
									</a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-sm-3">
    <h3 class="text-center">Upcoming Events</h3>
    <div class="newstape">
        <div class="newstape-content">
            <div class="news-block">
                <p class="text-justify">
                 <a href="#" style="cursor:pointer">  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</a>
                </p>
                <hr />
            </div>
            <div class="news-block">             
                <p class="text-justify">
  <a href="#" style="cursor:pointer">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</a></p>
                <hr />
            </div>
            <div class="news-block">
                <p class="text-justify">
  <a href="#" style="cursor:pointer">Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.                </p>
            </a>    <hr />
            </div>
        </div>
    </div>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</div>
	<!-- <div class="col-md-3  wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" style="margin-left:-45px;">
						<div class="page">
							<div style="display: inline-block;">
								<div class="monthly" id="mycalendar"></div>
							</div>
						</div>	
				</div> -->
	<div class="col-sm-3" style="margin-left:25px;">
	<div style="margin-top: 10px; padding: 0px;">
								<a href="shareInitiative.fssai"><img src="website/images/share-intitiave.jpg" class="img-responsive"></a>
							</div>
							<div style="margin-top: 30px; padding: 0px;">
								<a href="http://www.fssai.gov.in/home" target="blank"><img src="website/images/fssai-blog.jpg" class="img-responsive"></a>
							</div>
							<div style="margin-top: 42px; padding: 0px;">
							<span style="background-color: #000070;
    padding: 26px;
    color: #fff;
    font-weight: bold;
    font-size: 15px;">Download training guidelines</span>
							</div>
	</div>
	</div>
	</div>
	</div>
	

	<section id="bottom">
		<div class="container wow fadeInDown" data-wow-duration="1000ms"
			data-wow-delay="600ms">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="widget center-block">
						<ul>
							<li><a href="fostac.fssai">Home</a></li>
							<li><a href="about.fssai">About</a></li>
							<li class="dropdown"> <a href="courses.html" class="dropdown-toggle" data-toggle="dropdown">Courses<i class="fa fa-angle-down"></i></a>
              <ul class="dropdown-menu">
                <li><a href="basic-level.fssai">Basic Level</a></li>
                <li><a href="advance-level.fssai">Advance Level</a></li>
                <li><a href="special-level.fssai">Special Level</a></li>
              </ul>
            </li>
							<!-- <li><a href="#">Risk & Solutions</a></li>
							<li><a href="#">Help</a></li> -->
							<li><a href="contact.fssai">Contact</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-2 col-sm-6">
					<div class="widget center-block">
						<ul>
							<li><a href="#">Sitemap</a></li>
							<!-- <li><a href="disclaimer.html">Disclaimer</a></li>
							<li><a href="#">Archives</a></li>
							<li><a href="#">Useful Links</a></li> -->
							<li><a href="#">FAQ's</a></li>
							<li><a href="#">Feedback</a></li>
						</ul>
					</div>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-3 col-sm-6 text-left">
			<ul>
			<li><a href="#" target="_blank"><img src="website/images/facebook.png" width="30" height="30" alt="Facebook"></a> &nbsp;&nbsp;
			<a href="#" target="_blank"><img src="website/images/twitter.png" width="30" height="30" alt="Twitter"></a> &nbsp;&nbsp;&nbsp;
			<a href="#" target="_blank"><img src="website/images/linkedin.png" width="30" height="30" alt="Linkedin"></a>&nbsp;&nbsp;&nbsp;
			<a href="#" target="_blank"><img src="website/images/google-plus.png" width="32" height="32" alt="Google Plus"></a></li>

			</ul>
				</div>
				<!--/.col-md-3-->

				<div class="col-md-3 col-sm-6">
							<div class="widget center-block text-center"
						style="border-right: none;">
						<ul>
							<li class="subscribe">Sign up for our mailing list to get
								latest updates and offers.
								<form action="#" id="form-subscribe">
									<div class="form-field">
										<input type="email" placeholder="Email Address" id="email">
										<input class="btn" type="submit" id="submit" value="Subscribe">
									</div>
								</form>
							</li>
						
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
				<div class="col-sm-12 text-center">
					Design and Developed by &nbsp;<a href="http://www.zentechinfo.com/"
						target="_blank"
						style="color: #1c1b1b; text-decoration: underline;">Zentech
						Info Solutions Pvt. Ltd.</a> &copy; FSSAI 2016- All Right Reserved.
				</div>
			</div>
		</div>
	</footer>
	<!--/#footer-->
 	<!-- <script src="js/jquery.js"></script> -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/monthly.js"></script>
	<script src="js/jquery.swipebox.js"></script>
	<script>
		$(document).ready(function() {

			$("#gallery").owlCarousel({

				navigation : false, // Show next and prev buttons
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true,
				autoPlay : true,
				responsive : true

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
		$(document).ready(function() {

			$("#news").owlCarousel({

				navigation : false, // Show next and prev buttons
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true,
				autoPlay : true,
				responsive : true

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
		;
		(function($) {

			$('.swipebox').swipebox();

		})(jQuery);
	</script>
	<script type="text/javascript">
		$(window)
				.load(
						function() {

							$('#mycalendar').monthly({
								mode : 'event',
								//jsonUrl: 'events.json',
								//dataType: 'json'
								xmlUrl : 'events.xml'
							});

							$('#mycalendar2').monthly({
								mode : 'picker',
								target : '#mytarget',
								setWidth : '250px',
								startHidden : true,
								showTrigger : '#mytarget',
								stylePast : true,
								disablePast : true
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
	<script>
    $(function() {
        $('.newstape').newstape();
    });
</script>
</body>
</html>