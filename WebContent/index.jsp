<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login page</title>
	</head>
<body>


<% out.println("Enter your account information"); %> <!-- output the same thing, but using 
                                      jsp programming -->

<br>
	<form method="get" action="checkLoginDetails.jsp">
		<table>
			<tr>    
				<td>username</td><td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>password</td><td><input type="text" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
<br>
<a href='newAccount.jsp'>Create new account</a>




</body>
</html>