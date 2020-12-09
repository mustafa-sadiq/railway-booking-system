<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create new account</title>
</head>
<body>

<% out.println("Enter new account information"); %>

<br>
	<form method="get" action="checkNewAccount.jsp">
		<table>
			<tr>    
				<td>username</td><td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>password</td><td><input type="text" name="password"></td>
			</tr>
			<tr>    
				<td>first name</td><td><input type="text" name="cust_first"></td>
			</tr>
			<tr>
				<td>last name</td><td><input type="text" name="cust_last"></td>
			</tr>
			<tr>    
				<td>email</td><td><input type="text" name="email"></td>
			</tr>
			
			
		</table>
		<input type="submit" value="Create">
	</form>
<br>
<a href='index.jsp'>Have an account?</a>

</body>
</html>