<%@page import="com.bean.Customer"%>
<%@page import="java.util.ArrayList"%>
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

<title>View Customer</title>
<% int timeout = session.getMaxInactiveInterval();
       response.setHeader("Refresh", timeout + "; URL = /PROJECTTEAMD/JSP/Login.jsp");%>
<script>
	function ssnIdChange() {
		var x = document.getElementById("ssnId").selectedIndex;
		document.getElementById("customerId").selectedIndex = x;
	}

	function customerIdChange() {
		var x = document.getElementById("customerId").selectedIndex;
		document.getElementById("ssnId").selectedIndex = x;
	}
</script>
<!-- Code for pagination -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

<script>
	$(document).ready(function() {
		$('#myTable').dataTable();

	});
</script>
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
						<input type="submit" name="action" class="btn btn-danger"
							value="Logout">
					</form>
				</li>
			</ul>
		</div>
	</div>
	</nav> </header>

	<div class="row">
		<div class="col-xs-12">
			<div class="btn pull-right">
				<b><span ng-bind="ddMMMMyyyy"></span> -
					{{currentTime | date:'HH:mm:ss'}}</b>
			</div>
		</div>
	</div>

		<div class="row profile">
			<div class="col-md-2">
				<div class="profile-sidebar">

					<div class="profile-userpic">
						<img src="/PROJECTTEAMD/IMAGES/BSE.jpg" class="img-responsive"
							alt="">
					</div>

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

				</div>
			</div>
			<div class="col-md-8">

					<div class="main-login main-center">
						<h5 style="text-align: center;">View Customer Details</h5>

					</div>
					<%
						String msg = (String) request.getAttribute("msg");
						ArrayList<Customer> customerList = (ArrayList<Customer>) request
								.getAttribute("customerList");

						ArrayList<Long> ssnIdList = (ArrayList<Long>) request
								.getAttribute("ssnIdList");
						ArrayList<Integer> customerIdList = (ArrayList<Integer>) request
								.getAttribute("customerIdList");
						Customer customerById = (Customer) request
								.getAttribute("customerById");
					%>

					<div class="nav">
						<form action="/PROJECTTEAMD/CustomerController" name="searchForm" method="post" onsubmit="return valid();">
						<h4 style="color:red;" id="message"></h4>
							
							<div class="row">
							<div class="col-sm-4 text-center">
							<label>SSN ID
							<select ng-model="ssnId" id="ssnId" name="ssnId"
										onchange=ssnIdChange() required>
											
											<%
												for (Long temp : ssnIdList) {
													
											%>
											<option value="<%=temp%>" selected>
												<%=temp%>
											</option>
											<%
												}
											%>
									</select>
							</label>
							
							</div>
							<div class="col-sm-6 text-right">
							<label>CUSTOMER ID
							<select ng-model="customerId" id="customerId"
										name="customerId" onchange=customerIdChange() >
										
										 <option value="" >
												
											</option>
											<%
												for (Integer temp : customerIdList) {
											%>
											<option value="<%=temp%>" selected>
												<%=temp%>
											</option>
											<%
												}
											%>
									</select>
							</label>
							
							</div>
							
							</div>
							
							<div class="row">
							<div class="col-sm-12 text-center">
							<input type="submit" name="action" value="searchById">
							</div>
							</div>
						
							<script>
									function valid()
									{
										var customerId=document.getElementById("customerId").value;
										if(customerId=="" || customerId.length==0)
											{
											document.getElementById("message").innerHTML="Please select the ID  to search";
											return false;
											}
										return true;
									}
									</script>
						</form>
						
					</div>
					<%
						if (msg != null) {
					%>
					<h2 style="color: green"><%=msg%></h2>
					<%
						}
					%>

					<div class="container">
						

						<%
							if (customerList != null && customerById == null) {
						%>
						<div class="allCustomer">
							<div class="table-responsive">

								<table  id="myTable" class="table display table" border='2'>

									<thead>
										<tr>
											<th>SSN ID</th>
											<th>CUSTOMER ID</th>
											<th>CUSTOMER NAME</th>
											<th>AGE</th>
											<th>ADDRESS</th>
											
											<th>OPTIONS</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (Customer customer : customerList) {
										%>
										<tr>
											<td><%=customer.getSsnId()%></td>
											<td><%=customer.getCustomerId()%></td>
											<td><%=customer.getCustomerName()%></td>
											<td><%=customer.getAge()%></td>
											<td><%=customer.getAddress()%></td>
											
											<td><a
												href="/PROJECTTEAMD/CustomerController?action=updatee&cid=<%=customer.getCustomerId()%>">
													<span class="glyphicon glyphicon-edit"></span>
											</a> &nbsp;&nbsp;&nbsp; <a
												href="/PROJECTTEAMD/CustomerController?action=delete&cid=<%=customer.getCustomerId()%>">
													<span class="glyphicon glyphicon-trash"></span>
											</a></td>

										</tr>

										<%
											}
										%>

									</tbody>
								</table>
								<%
									}
								%>
							</div>

							<!-- Search result display -->
							<%
								if (customerById != null) {
							%>
							<div class="customerIds">

								<table id="vctable" border="2" class="table table-responsive">
									<thead>
										<tr>
											<th>SSN ID</th>
											<th>CUSTOMER ID</th>
											<th>CUSTOMER NAME</th>
											<th>AGE</th>
											<th>ADDRESS</th>
											<th>MESSAGE</th>
											<th>OPTIONS</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=customerById.getSsnId()%></td>
											<td><%=customerById.getCustomerId()%></td>
											<td><%=customerById.getCustomerName()%></td>
											<td><%=customerById.getAge()%></td>
											<td><%=customerById.getAddress()%></td>
											<td><%=customerById.getMessage()%></td>
											<td><a
												href="/PROJECTTEAMD/CustomerController?action=updatee&cid=<%=customerById.getCustomerId()%>">
													<span class="glyphicon glyphicon-edit"></span>
											</a> &nbsp;&nbsp;&nbsp; <a
												href="/PROJECTTEAMD/CustomerController?action=delete&cid=<%=customerById.getCustomerId()%>">
													<span class="glyphicon glyphicon-trash"></span>
											</a></td>

										</tr>
									</tbody>
								</table>

							</div>
							<%
								}
							%>
						</div>

					</div>
			</div>
			</div>
<br>
<br>

<br>
<br>
<br>

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