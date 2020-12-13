<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer page</title>
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
	<a href='browseSchedule.jsp?transit_name=none&sort_by=stop_arrival'>browse schedules and filter</a>

	<br />
	<a href='customerScheduleReservation.jsp'>search for train schedules by origin,
		destination, date of travel</a>

	<br />
	<a href='showReservation.jsp'>view current and past reservations with their details</a>

	
	<br />
	<a href='customerQuestionsPage.jsp'>Send a question to the customer service</a>



</body>
</html>