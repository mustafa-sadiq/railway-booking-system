<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ask a new question</title>
</head>
<body>

<%
		String user = (String) session.getAttribute("user");

	if (user == null) {
		out.println("You are not logged in");
	%>
	<br />
	<a href="index.jsp">Please Login</a>
	<%
		} else {
			%>
			<a href="customerQuestionsPage.jsp">Back</a>
			<%
	out.println("Please ask a question " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />
	<br>
	<form method="post" action="newQuestion.jsp">
	<table>
	<tr>    
	<td>Question</td><td><input type="text" name="question"></td>
	</tr>
	</table>
	<input type="submit" value="Add me!">
	</form>
<br>
	
	<%
	
	

	}
	%>




</body>
</html>