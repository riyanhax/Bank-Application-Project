<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Executive: Demo Cash</title>
<% int timeout = session.getMaxInactiveInterval();
       response.setHeader("Refresh", timeout + "; URL = /PROJECTTEAMD/JSP/Login.jsp");%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body ng-app="myApp" ng-controller="myController">

<header id="header"> <nav class="navbar navbar-fixed-top"
		role="banner">
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
				<li>
				<form action="/PROJECTTEAMD/LoginController" style="float: right">
					<input type="submit" name="action" class="btn btn-danger"
						value="Logout">
				</form>
				
				</li>
			</ul>
		</div>
	</div>
	<!--/.container--> </nav> <!--/nav--> </header>


	<div class="container">
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="/PROJECTTEAMD/IMAGES/BSE.jpg" class="img-responsive"
							alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">Bank Executive</div>
						
					</div>

					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="#"> <a
									class="glyphicon glyphicon-home"
									href="/PROJECTTEAMD/CustomerController?action=customerCreation">
										Create Customer</a>
							</a></li>
							<li><a href="#"> <a class="glyphicon glyphicon-user"
									href="/PROJECTTEAMD/CustomerController?action=viewCustomer">
										View Customer</a></a></li>
							<li><a href="#" target="_blank"> <a
									class="glyphicon glyphicon-ok"
									href="/PROJECTTEAMD/AccountController?action=AccountCreation">
										Create Account</a></a></li>
							<li><a href="#"> <a class="glyphicon glyphicon-flag"
									href="/PROJECTTEAMD/AccountController?action=viewAccount">
										View Account</a>
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div class="col-md-3">
				<div class="container">

					<div class="main-login main-center">
						<h3>Account Creation</h3>
						
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<form action="/PROJECTTEAMD/LoginController" style="float: right">
					<input type="submit" name="action" class="btn btn-danger"
						value="Logout">
				</form>
			</div>

		</div>

</div>




	<div class="menu">
		<button class="showSingle" target="1">Deposit</button>
		<button class="showSingle" target="2">Transfer</button>
		<button class="showSingle" target="3">Withdraw</button>
	</div>

	<section class="cnt">
	<div id="div1" class="targetDiv">
		<form>
			<table>
				<tr>
					<td>Enter Amount</td>
					<td><input type="text" name="hi" value="Deposit"></td>
				<tr align=center>
					<td colspan="2"><input type="submit" name="ok"
						value="Transfer"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="div2" class="targetDiv">
		<form>
			<table>
				<tr>
					<td>select AccountID for Transfer</td>
					<td><select name="toaccountid">
							<option value=""></option>
					</select></td>
				</tr>
				<tr>
					<td>select customer Name for Transfer</td>
					<td><select name="tocustomer">
							<option value=""></option>
					</select></td>
				</tr>
				<tr>
					<td>Enter Amount : <input type="text" name="hi" value="">
					</td>
				</tr>
				<tr align=center>
					<td colspan="2"><input type="submit" name="ok"
						value="Transfer"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="div3" class="targetDiv">

		<form>

			<table>
				<tr>
					<td>Enter Amount</td>
					<td><input type="text" name="hi" value="Deposit"></td>
				<tr align=center>
					<td colspan="2"><input type="submit" name="ok"
						value="Transfer"></td>
				</tr>
			</table>
		</form>
	</div>

	</section>
	
	
	
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

	<footer id="footer">
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<a target="_blank" href="https://www.google.com/" title="Google">Copyright &copy; 2017 TATA BANK All Rights Reserved.</a>
			</div>
			<!-- <div class="col-sm-8">
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
	
	<script>
		jQuery('.targetDiv').hide();
		jQuery('.showSingle').click(function() {
			jQuery('.targetDiv').hide();
			jQuery('#div' + $(this).attr('target')).show();
		});
	</script>
</body>
</html>