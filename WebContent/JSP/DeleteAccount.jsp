<%@page import="com.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="shortcut icon" href="../IMAGES/icon.jpg" type="" />
<!-- Bootstrap -->
<link href="/PROJECTTEAMD/CSS/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/PROJECTTEAMD/CSS/font-awesome.min.css">
<link href="/PROJECTTEAMD/CSS/animate.min.css" rel="stylesheet">
<link href="/PROJECTTEAMD/CSS/prettyPhoto.css" rel="stylesheet">
<link href="/PROJECTTEAMD/CSS/main.css" rel="stylesheet">
<link href="/PROJECTTEAMD/CSS/responsive.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.3/angular.min.js"></script>
<script type="text/javascript" src="/PROJECTTEAMD/JS/ng-controller.js"></script>
<link rel="stylesheet" href="/PROJECTTEAMD/CSS/Team_D.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Executive: Delete Account</title>
<% int timeout = session.getMaxInactiveInterval();
       response.setHeader("Refresh", timeout + "; URL = /PROJECTTEAMD/JSP/Login.jsp");%>
</head>
<body ng-app="myApp" ng-controller="myController">

<%if(session.getAttribute("username")==null)
	{
	response.sendRedirect(request.getContextPath()+"/JSP/Login.jsp");
	}%>
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
					<input type="button" name="action" class="btn btn-danger"
						value="Logout">
				</form>
				</li>
			</ul>
		</div>
	</div>
	<!--/.container--> </nav> <!--/nav--> </header>

	<div class="row">
		<div class="col-xs-12">
			<div class="btn pull-right">
				<b><span ng-bind="ddMMMMyyyy"></span> 
					{{currentTime | date:'HH:mm:ss'}}</b>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row profile">
			<div class="col-md-2">
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


						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div class="col-md-8">
				
					<div class="main-login main-center">
						<h3 style="text-align: center;">Delete Account</h3>

					</div>


					<%Account account=(Account)request.getAttribute("account"); %>
					<table id="vctable">
						<tr>
							<th>ACCOUNT ID</th>
							<td><%=account.getAccountId() %></td>
						</tr>
						<tr>
							<th>CUSTOMER ID</th>
							<td><%=account.getCustomerId() %></td>
						</tr>
						<tr>
							<th>ACCOUNT TYPE</th>
							<td><%= account.getAccountType()%></td>
						</tr>
						<tr>
							<th>ACCOUNT BALANCE</th>
							<td><%= account.getBalance()%></td>
						</tr>
						<tr>
							<th>LAST UPDATED</th>
							<td><%=account.getLastUpdated() %></td>
						</tr>
					</table>
					<form action="/PROJECTTEAMD/AccountController" method="post">
						<center>
							<h1>Do you want to delete this account ?</h1>
							<input type="submit" class="btn btn-success" name="action"
								value="Delete"> <input type="submit"
								class="btn btn-warning" name="action" value="Cancel">
						</center>
					</form>

			</div>
		</div>
</div>
		
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