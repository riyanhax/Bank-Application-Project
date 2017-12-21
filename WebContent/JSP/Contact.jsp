<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<head>
<link rel="shortcut icon" href="../IMAGES/icon.jpg" type="" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link href="/PROJECTTEAMD/CSS/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/PROJECTTEAMD/CSS/font-awesome.min.css">
<link href="/PROJECTTEAMD/CSS/animate.min.css" rel="stylesheet">
<link href="/PROJECTTEAMD/CSS/prettyPhoto.css" rel="stylesheet">
<link href="/PROJECTTEAMD/CSS/main.css" rel="stylesheet">
<link href="/PROJECTTEAMD/CSS/responsive.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.3/angular.min.js"></script>
<script type="text/javascript" src="/PROJECTTEAMD/JS/ng-controller.js"></script>
<link rel="stylesheet" href="/PROJECTTEAMD/CSS/Team_D.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>HOME: TATA BANK</title>
<% int timeout = session.getMaxInactiveInterval();
       response.setHeader("Refresh", timeout + "; URL = /PROJECTTEAMD/JSP/Login.jsp");%>
<script>
	function validate() {
		
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;

		if (username.trim().length == 0) {
			alert('Please Enter Username');
			return false;
		}
		if (password.trim().length == 0) {
			alert('Please Enter Password');
			return false;
		}

		return true;
	}
</script>

</head>
<body ng-app="myApp" ng-controller="myController">
	<header id="header"> <nav class="navbar navbar-fixed-top" role="banner">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

		</div>
		<div class="collapse navbar-collapse navbar-left">
			<button type="button" class="btn btn-info">TATA BANK</button>

		</div>

		<div class="collapse navbar-collapse navbar-right">
			<ul class="nav navbar-nav">

				<li ><a href="/PROJECTTEAMD/JSP/Login.jsp">Home</a></li>
				<li><a href="/PROJECTTEAMD/JSP/AboutUs.jsp">About Us</a></li>
				<li><a href="/PROJECTTEAMD/JSP/Service.jsp">Services</a></li>
				<li><a href="/PROJECTTEAMD/JSP/Contact.jsp">Contact</a></li>
			</ul>
		</div>
	</div>
	<!--/.container--> </nav> <!--/nav--> </header>

	<div class="row">
		<div class="col-sm-3">
			<div class="btn pull-right">
				<b><span ng-bind="ddMMMMyyyy"></span> -
					{{currentTime | date:'HH:mm:ss'}}</b>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="about-slider">
					<div id="carousel-slider" class="carousel slide"
						data-ride="carousel">
						<!-- Indicators -->
						 <ol class="carousel-indicators visible-xs">
							<li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-slider" data-slide-to="1"></li>
							
						</ol>

						<div class="carousel-inner">
							
							<div class="item active">
								<img src="/PROJECTTEAMD/IMAGES/meeting.jpg"	class="img-responsive" alt="">
							</div>
							<div class="item">
								<img src="/PROJECTTEAMD/IMAGES/tcs-chandrasekaran.jpg" class="img-responsive" alt="">
							</div>
						</div>

											</div>
					<!--/#carousel-slider-->
				</div>
				<!--/#about-slider-->
			</div>

			<div class="col-sm-6">
				<div class="panel-group">
					<div class="panel panel-primary">
						<div class="panel-heading" style="background-color: #ff751a;">Contact Us</div>
						<div class="panel-body">
							<p>
								<center>
							<table class="table">
							<tr><td colspan="2">
								Email</td>
								<td> <b>tataBank.contact@gmail.com</b></td>
								</tr>
							</ul>
							 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							<tr><td  colspan="2">
								Phone Number </td><td><b>1800 020 1014</b></td>
							
							</tr>
								</table>
								
								</center>
								
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	
	<div class="container-fluid">
	<div class="row">
	
	<div class="col-sm-12 text-center">
	
	
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3668.9591236681426!2d80.2279225678644!3d12.917119647611827!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a525c885555551f%3A0x6b7faae281b3ff4a!2sTCS+ILP+center!5e0!3m2!1sen!2sin!4v1513303308568" width="1300" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	
	</div>
	
	
	</div>
	</div>
	
	
	
<section id="bottom">
	<div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
		<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="widget">
					<h3>Company</h3>
					<ul>
						<li><a href="#">About us</a></li>
						<li><a href="#">We are hiring</a></li>
						<li><a href="#">Meet the team</a></li>
						<li><a href="#">Copyright</a></li>
					</ul>
				</div>
			</div>
			<!--/.col-md-3-->

			<div class="col-md-3 col-sm-6">
				<div class="widget">
					<h3>Support</h3>
					<ul>
						<li><a href="#">Faq</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Forum</a></li>
						<li><a href="#">Documentation</a></li>
					</ul>
				</div>
			</div>
			<!--/.col-md-3-->

			<div class="col-md-3 col-sm-6">
				<div class="widget">
					<h3>Branches</h3>
					<ul>
						<li><a href="#">India</a></li>
						<li><a href="#">America</a></li>
						<li><a href="#">Japan</a></li>
						<li><a href="#">Chaina</a></li>
					</ul>
				</div>
			</div>
			<!--/.col-md-3-->

			<div class="col-md-3 col-sm-6">
				<div class="widget">
					<h3>Our Partners</h3>
					<ul>
						<li><a href="#">Bank of China</a></li>
						<li><a href="#">JPMorgan Chase & Co.</a></li>
						<li><a href="#">Bank of America</a></li>
						<li><a href="#">Barclays PLC</a></li>
					</ul>
				</div>
			</div>
			<!--/.col-md-3-->
		</div>
	</div>
	</section>
	<!--/#bottom-->

	<div class="top-bar">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="social">
							<ul class="social-share">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								
								<li><a href="#"><i class="fa fa-skype"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--/.container-->
		</div>
		<!--/.top-bar-->

		<footer id="footer" class="midnight-blue">
		<div class="container">
			<div class="row">
				<div class="col-sm-12" style="text-align: center;">
				<a target="_blank" href="https://www.google.com/" title="Google"> &copy; 2017  TATA BANK  All Rights Reserved</a>
				</div>
				<!-- <div class="col-sm-6">
					<ul class="pull-right">
						<li><a href="#">Home</a></li>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Faq</a></li>
						<li><a href="#">Contact Us</a></li>
					</ul>
				</div> -->
			</div>
		</div>
		</footer>
		<!--/#footer-->


</body>
</html>