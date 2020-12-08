<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new representative</title>
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
	<a href="adminAddEditDeleteRepresentative.jsp">Back</a>
	<%
		out.println("Add a new representative " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />

	<br>
	<form method="get" action="addRepresentative.jsp">
		<table>
			<tr>
				<td>SSN</td>
				<td><input type="text" name="employee_ssn"></td>
			</tr>
			<tr>
				<td>First name</td>
				<td><input type="text" name="employee_first"></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><input type="text" name="employee_last"></td>
			</tr>
			<tr>
				<td>User name</td>
				<td><input type="text" name="employee_username"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="employee_password"></td>
			</tr>
			<tr>
				<td>Manager?</td>
				<td><input type="radio" name="isManager" value="TRUE">Yes
					<input type="radio" name="isManager" value="FALSE">No</td>
			</tr>
		</table>
		<input type="submit" value="Add">
	</form>
	<br>

	<%
		}
	%>

</body>
</html>