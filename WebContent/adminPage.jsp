<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator</title>
</head>
<body>

	<%
		if ((session.getAttribute("user") == null)) {
	%>
	You are not logged in
	<br />
	<a href="index.jsp">Please Login</a>
	<%
		} else {
	%>
	Welcome
	<%=session.getAttribute("user")%>
	<a href='logout.jsp'>Log out</a>
	<%
		}
	%>
	<br/>
	
	
	<br/>
	<a href='logout.jsp'>Add, edit and delete information for a customer representative</a>
	
	<br/>
	<a href='logout.jsp'>Obtain sales reports per month</a>
	
	<br/>
	<a href='logout.jsp'>Produce a list of reservations:</a>
	
	<br/>
	<a href='logout.jsp'>Produce a listing of revenue per:</a>
	
	<br/>
	<a href='logout.jsp'>Best customer</a>
	
	<br/>
	<a href='logout.jsp'>Best 5 most active transit lines</a>
	
	
	
	



</body>
</html>