<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Questions</title>
</head>
<body>

	<%
	ServletContext sc = getServletContext();
	RequestDispatcher rd = sc.getRequestDispatcher("/representativeQuestionsPage.jsp");

	rd.forward(request,response);
		//response.sendRedirect("customerQuestionsPage.jsp");
	%>

</body>
</html>