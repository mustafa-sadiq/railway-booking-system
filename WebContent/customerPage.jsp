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
	<a href='logout.jsp'>search for train schedules by origin,
		destination, date of travel</a>

	<br />
	<a href='logout.jsp'>view current and past reservations with their details</a>

	<br />
	<a href='logout.jsp'>customers browse questions and answers</a>

	<br />
	<a href='logout.jsp'>customers search questions by keywords</a>

	<br />
	<a href='logout.jsp'>customers send a question to the customer service</a>



</body>
</html>