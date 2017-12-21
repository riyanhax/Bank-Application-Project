<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="../IMAGES/icon.jpg" type="" />
<title>Error Page</title>
</head>
<body>
<center>
<%@ page isErrorPage="true" %>
<% String message=(String)request.getAttribute("message");%>

        <img  src="<%=request.getContextPath() %>/IMAGES/something went wrong.png" style="width:100%;height:400px">
 		<a href="/PROJECTTEAMD/LoginController?action=Logout">Click here to login again</a>
  </center>


</body>
</html>