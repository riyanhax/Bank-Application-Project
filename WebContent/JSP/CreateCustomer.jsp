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
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<title>Executive: Add Customer</title>
<% int timeout = session.getMaxInactiveInterval();
       response.setHeader("Refresh", timeout + "; URL = /PROJECTTEAMD/JSP/Login.jsp");%>
</head>

<body ng-app="myApp" ng-controller="myController">
<%if(session.getAttribute("username")==null)
	{
	response.sendRedirect(request.getContextPath()+"/JSP/Login.jsp");
	}%>
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

	<div class="row">
		<div class="col-xs-12">
			<div class="btn pull-right">
				<b><span ng-bind="ddMMMMyyyy"></span> -
					{{currentTime | date:'HH:mm:ss'}}</b>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row profile">
			<div class="col-sm-2">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="/PROJECTTEAMD/IMAGES/BSE.jpg" class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">Bank Executive</div>
						
					</div>

					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active">
							<a class="glyphicon glyphicon-user" href="/PROJECTTEAMD/CustomerController?action=customerCreation"> Create Customer</a>
							</li>
							<li>
							<a class="glyphicon glyphicon-book" href="/PROJECTTEAMD/CustomerController?action=viewCustomer"> View Customer</a></li>
							<li>
							<a class="glyphicon glyphicon-ok" href="/PROJECTTEAMD/AccountController?action=AccountCreation"> Create Account</a></li>
							<li>
							<a class="glyphicon glyphicon-zoom-in" href="/PROJECTTEAMD/AccountController?action=viewAccount"> View Account</a>
							</li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			
			<div class="col-sm-10">
				
						
					<div class="main-login main-center">
						<h3>Customer Creation</h3>
						
						<form class="form-horizontal" name="createCustomerForm" action="/PROJECTTEAMD/CustomerController" method="post" novalidate>
	
							<div class="form-group">
								<center>	<%String message=(String)request.getAttribute("message") ;
							if(message!=null){
							%>	<h4 style="color:red"><%=message %></h4>
							<%} %></center>
								<div class="form-group">
									<label class="control-label col-sm-4">SSN ID</label>
									<div class="col-sm-8">
										<input type="text" ng-model="ssnId" name="ssnId" ng-pattern="/^[0-9]{9}$/" required> 
										<span style="color: red" ng-show="createCustomerForm.ssnId.$touched && createCustomerForm.ssnId.$invalid">
											<span ng-show="createCustomerForm.ssnId.$error.required">Please enter the SSN ID</span> 
											<span ng-show="createCustomerForm.ssnId.$error.pattern">Please enter a 9 digit SSN ID</span>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">CUSTOMER NAME</label>
									<div class="col-sm-8">
										<input type="text" ng-model="custName" name="custName"
											required> <span style="color: red"
											ng-show="createCustomerForm.custName.$touched && createCustomerForm.custName.$invalid">Please
											enter the name</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">AGE</label>
									<div class="col-sm-8">
										<input type="number" ng-model="age" name="age"
											ng-pattern="/^[0-9]{2,3}$/" required> <span
											style="color: red"
											ng-show="createCustomerForm.age.$touched && createCustomerForm.age.$invalid">
											<span ng-show="createCustomerForm.age.$error.required">Please
												enter the age</span> <span
											ng-show="createCustomerForm.age.$error.pattern">Please
												enter the valid age</span>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">ADDRESS LINE 1</label>
									<div class="col-sm-8">
										<input type="text" ng-model="addressLine1" name="addressLine1"
											required> <span style="color: red"
											ng-show="createCustomerForm.addressLine1.$touched && createCustomerForm.addressLine1.$invalid">Please
											fill the address line 1</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">ADDRESS LINE 2</label>
									<div class="col-sm-8">
										<input type="text" ng-model="addressLine2" name="addressLine2"
											required> <span style="color: red"
											ng-show="createCustomerForm.addressLine2.$touched && createCustomerForm.addressLine2.$invalid">Please
											fill the address line 2</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">CITY</label>
									<div class="col-sm-8">
										<input type="text" ng-model="city" name="city" required>
										<span style="color: red"
											ng-show="createCustomerForm.city.$touched && createCustomerForm.city.$invalid">Please
											enter the city</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4">STATE</label>
									<div class="col-sm-8">
										<input type="text" ng-model="state" name="state" required>
										<span style="color: red"
											ng-show="createCustomerForm.state.$touched && createCustomerForm.state.$invalid">Please
											enter the state</span>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="submit" name="action" value="AddCustomer" class="btn btn-success" ng-disabled="createCustomerForm.$invalid">
										<input type="reset" name="reset" class="btn btn-warning"
											value="Clear">
									</div>
								</div>

							</div>
						</form>
					</div>
			
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