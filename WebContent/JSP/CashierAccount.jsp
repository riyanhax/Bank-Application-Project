<%@page import="com.bean.Account"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.3/angular.min.js"></script>
<script type="text/javascript" src="/PROJECTTEAMD/JS/ng-controller.js"></script>
<link rel="stylesheet" href="/PROJECTTEAMD/CSS/Team_D.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Cashier Account</title>

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
				<li><form action="/PROJECTTEAMD/LoginController" style="float: right">
						<input type="submit" name="action" class="btn btn-danger" value="Logout">
					</form></li>
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
						<div class="profile-usertitle-name">Bank Cashier</div>
						
					</div>
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a class="glyphicon glyphicon-home" href="/PROJECTTEAMD/CashierController?action=transaction"> View Transactions</a>
							</li>

						</ul>
					</div>
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"> <a
									class="glyphicon glyphicon-home"
									href="/PROJECTTEAMD/CashierController?action=cashierhome">
										Cashier Home</a>
							</a></li>

						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<div class="col-md-8">
				
					<div class="main-login main-center">
						<h3 style="text-align: center;">View Account Information</h3>



						<form action="/PROJECTTEAMD/CashierController">
							<%Account accounts=(Account)request.getAttribute("accounts");
		ArrayList<Account> accountList=(ArrayList<Account>) request.getAttribute("accountslist");
		ArrayList<Long> accountIdList=new ArrayList<Long>();
		ArrayList<String> customerNameList=new ArrayList<String>();
		for(Account account:accountList){
			if(accounts.getAccountId()!=account.getAccountId()){
			accountIdList.add(account.getAccountId());
			customerNameList.add(account.getCustName());
			}
		} 
if(accounts.getAccountId()!=0 ){
	%>
							<table id="vctable">
								<tr>
									<td>ACCOUNT ID</td>
									<td><input type="text" name="accountid"
										value="<%=accounts.getAccountId() %>" readonly></td>
								</tr>
								<tr>
									<td>CUSTOMER NAME</td>
									<td><input type="text" name="name"
										value="<%=accounts.getCustName() %>" readonly></td>
								</tr>
									<tr>
									<td>ACCOUNT TYPE</td>
									<td><input type="text" name="customerid"
										value="<%=accounts.getAccountType()%>" readonly></td>
								</tr>
								<tr>
									<td>CUSTOMER ID</td>
									<td><input type="text" name="customerid"
										value="<%=accounts.getCustomerId() %>" readonly></td>
								</tr>
								<tr>
									<td>BALANCE</td>
									<td><input type="text" name="balance"
										value="<%=accounts.getBalance() %>" readonly></td>
								</tr>
							</table>
							<%}else{ %>

							<h1>No records found</h1>

							<%} %>

						</form>
						<div class="menu">
							<button type="button" class="showSingle btn btn-success"
								target="1">Deposit</button>
							<button type="button" class="showSingle btn btn-info" target="2">Transfer</button>
							<button type="button" class="showSingle btn btn-warning"
								target="3">Withdraw</button>
						</div>

						<section class="cnt">
						<div id="div1" class="targetDiv">
							<%//deposit button  %>
							<form action="/PROJECTTEAMD/CashierController" name="deposit">
								<table>
									<tr>
										<td>ENTER AMOUNT</td>
										<td><input type="number" name="depositAmount" required> <input
											type="hidden" name="AccountId"
											value="<%=accounts.getAccountId() %>" ></td>
									<tr align=center>
										<td colspan="2"><input type="submit" name="ok"
											value="DEPOSIT" class="btn btn-primary"> <input
											type="hidden" name="action" value="depositAmount"></td>

									</tr>
								</table>
							</form>
						</div>
						<%//transfer button  %>
						<div id="div2" class="targetDiv">
							<%
		
		if(accountList!=null  && accountIdList!=null && customerNameList!=null){ %>
							<form action="/PROJECTTEAMD/CashierController" name="transfer" onsubmit="return checkTransferBalance1() "
								>
								<table>
									<tr>
										<td>SELECT ACCOUNT ID FOR TRANSFER</td>
										<td><select name="toaccountid" style="color: black;"
											id="accountIdForChange" onclick=changeFunction()>
												<%for(Long accountIdTemp:accountIdList) {%>
												<option value="<%=accountIdTemp%>"><%=accountIdTemp%></option>
												<%} %>
										</select> <input type="hidden" name="fromaccountId"
											value="<%=accounts.getAccountId() %>"></td>
									</tr>
									<tr>
										<td>SELECT CUSTOMER NAME FOR TRANSFER</td>
										<td><input type="text" name="tocustomer"
											id="customerNameForChange" value=<%=customerNameList.get(0) %>></td>
									</tr>
									<tr>
										<td>ENTER AMOUNT  <input type="number" name="amount"
											id="transferAmount" value="" required> <input type="hidden"
											name="transferBalance" id="transferBalance"
											value="<%=accounts.getBalance()%>">
										</td>

									</tr>
									<tr align=center>
										<td colspan="2"><input type="submit"
											class="btn btn-primary" name="ok" value="TRANSFER"> <input
											type="hidden" name="action" value="TransferAmount"></td>
									</tr>
								</table>
								<script>
							function changeFunction() {
							var x = document.getElementById("accountIdForChange").selectedIndex;
								var jsArray = [];
								<%for (String name:customerNameList) {%>
									jsArray.push("<%=name%>");
								<%}%>
									document
												.getElementById("customerNameForChange").value = jsArray[x];
									}
								</script>
							</form>
							<%} %>

						</div>
						<div id="div3" class="targetDiv">
							<%//withdraw button  %>
							<form action="/PROJECTTEAMD/CashierController" name="withdraw" onsubmit="return checkWithDrawBalance1()	">						

								<table>
									<tr>
										<td>ENTER AMOUNT</td>
										<td><input type="text" name="withdrawAmount"
											id="withdrawAmount" required> <input type="hidden"
											name="AccountId" value="<%=accounts.getAccountId() %>">
											<input type="hidden" name="withdrawBalance"
											id="withdrawBalance" value="<%=accounts.getBalance() %>"></td>
									</tr>
									<tr align=center>
										<td colspan="2"><input type="submit"
											class="btn btn-primary" name="ok" value="WITHDRAW"> <input
											type="hidden" name="action" value="withdrawAmount"></td>
									</tr>
								</table>
							</form>

							<script>
								jQuery('.targetDiv').hide();
								jQuery('.showSingle').click(
										function() {
											jQuery('.targetDiv').hide();
											jQuery(
													'#div'
															+ $(this).attr(
																	'target'))
													.show();
										});

								function checkWithDrawBalance1() {

									var withdrawAmount = document
											.getElementById("withdrawAmount").value;
									var withdrawBalance = document
											.getElementById("withdrawBalance").value;
									if (withdrawAmount > <%=accounts.getBalance() %>) {
										alert('please enter amount less than '
												+ withdrawBalance);
										return false;
									}
									return true;
								}
								function checkTransferBalance1() {

									var transferAmount = document
											.getElementById("transferAmount").value;
									var transferBalance = document
											.getElementById("transferBalance").value;
									if (transferAmount > <%=accounts.getBalance() %>) {
										alert('please enter amount less than '
												+ transferBalance);
										return false;
									}
									return true;

								}
							</script>

						</div>
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

	<footer id="footer">
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<a target="_blank" href="https://www.google.com/" title="Google">Copyright
					&copy; 2017 TATA BANK All Rights Reserved.</a>
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

</body>
</html>