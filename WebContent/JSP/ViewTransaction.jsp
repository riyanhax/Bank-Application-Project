<%@page import="com.bean.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="../IMAGES/icon.jpg" type="" />
<!-- For pdf styling -->

<style>
@media print {
	#pdf-button {
		display: none;
	}
}
table{
  border:1px solid black;
}
td{
  padding: 10px;
 
}​
</style>

<!-- To generate pdf -->
<script src="https://docraptor.com/docraptor-1.0.0.js"></script>
<script>
	var downloadPDF = function() {
		DocRaptor.createAndDownloadDoc("YOUR_API_KEY_HERE", {
			test : true, // test documents are free, but watermarked
			type : "pdf",
			document_content : document.getElementById('content').innerHTML, // use this page's HTML
		// document_content: "<h1>Hello world!</h1>",               // or supply HTML directly
		// document_url: "http://example.com/your-page",            // or use a URL
		// javascript: true,                                        // enable JavaScript processing
		// prince_options: {
		//   media: "screen",                                       // use screen styles instead of print styles
		// }
		})
	}
</script>
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

<title>Cashier: View Transaction</title>

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
	
	<div class="container">
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<div class="profile-userpic">
						<img src="/PROJECTTEAMD/IMAGES/BSE.jpg" class="img-responsive"
							alt="">
					</div>
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">Bank Cashier</div>
						
					</div>
					<div class="profile-usermenu">
							<ul class="nav">
							<li class="active"> 
							<a class="glyphicon glyphicon-home" href="/PROJECTTEAMD/CashierController?action=transaction"> View Transactions</a>
							</a></li>

						</ul>
					</div>
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"> 
							<a class="glyphicon glyphicon-home" href="/PROJECTTEAMD/CashierController?action=cashierhome"> Cashier Home</a>
							</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-8">
			
					<div class="main-login main-center">
						<h3 style="text-align: center;">View Transactions</h3>
					</div>
					<div id="content">
					
					<table style="overflow: scroll;">
					
						<% ArrayList<Transaction> transactionList=(ArrayList<Transaction>)request.getAttribute("transactionList");
if(transactionList.size()!=0){
%>

						<table id="vctable" border="2" class="table-sm" style="border-collapse: collapse;">
							<tr>
								<td style="width: 20%">TRANSACTION DATE</td>
								<td style="width: 20%">TRANSACTION DESCRIPTION</td>
								<td style="width: 20%">BALANCE</td>
								<td style="width: 20%">STATUS</td>
								<td style="width: 20%">ACCOUNT ID</td>

							</tr>
							<%for(Transaction transaction:transactionList){ %>
							<tr>
								<td style="width: 20%"><%= transaction.getTransactionDate() %></td>
								<td style="width: 20%"><%=transaction.getTransactionDescription() %></td>
								<td style="width: 20%"><%=transaction.getBalance() %></td>
								<td style="width: 20%"><%=transaction.getStatus() %></td>
								<td style="width: 20%"><%=transaction.getAccountId() %></td>


							</tr>
							<%} %>
						</table>
						<%}else { %>
<p>No records found</p>
<%} %>

					
					</table>
					</div>
					<div id="editor"></div>
					<input id="cmd" class="btn btn-danger" id="pdf-button"
						type="button" value="Download PDF" onclick="downloadPDF()">

			</div>


		</div>
</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
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

		<footer id="footer" class="midnight-blue">
		<div class="container">
			<div class="row">
				<div class="col-sm-12" style="text-align: center;">
				<a target="_blank" href="https://www.google.com/" title="Google"> &copy; 2017  TATA BANK  All Rights Reserved</a>
				</div>
			</div>
		</div>
		</footer>
		<!--/#footer-->	
		
</body>
</html>