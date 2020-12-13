<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer representative page</title>
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
	<br />


	<br />
	<a href='logout.jsp'>edit and delete information for train
		schedules</a>
		
	<br />
	<a href='representativeQuestionsPage.jsp'>Reply to customer questions</a>

	<br />
	<a href='representativeSchedulesGivenStation.jsp'>produce a list of train schedules for a given
		station (as origin/destination)</a>

	<br />
	<a href='representativeReservationList.jsp'>produce a list of all customers who have
		reservations on a given transit line and date</a>



</body>
</html>