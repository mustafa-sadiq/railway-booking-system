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
	<a href='adminAddEditDeleteRepresentative.jsp'>Add, edit and delete information for a customer representative</a>
	
	<br/>
	<a href='adminSalesReport.jsp'>Obtain sales reports per month</a>
	
	<br/>
	<a href='adminReservationsByTransit.jsp'>Produce a list of reservations by transit line</a>
	
	<br/>
	<a href='adminReservationsByCustomer.jsp'>Produce a list of reservations by customer</a>
	
	<br/>
	<a href='adminProduceRevenueTransit.jsp'>Produce a listing of revenue per transit</a>
	
	<br/>
	<a href='adminProduceRevenueCustomer.jsp'>Produce a listing of revenue per customer</a>
	
	<br/>
	<a href='adminBestCustomer.jsp'>Find best customer</a>
	
	<br/>
	<a href='adminMostActiveTransit.jsp'>Find best 5 most active transit lines</a>
	
	
	
	



</body>
</html>