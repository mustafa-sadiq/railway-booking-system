<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>editRepresentative.jsp</title>
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
			String employee_ssn;
			String employee_first;
			String employee_last;
			String employee_username;
			String employee_password;
			boolean isManager;
			String yeschecked = "";
			String nochecked = "";
			
			try {
				
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();		

				//Create a SQL statement
				Statement stmt = con.createStatement();
				//Get the selected radio button from the index.jsp
				String entity = request.getParameter("user");
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				String str = "SELECT * FROM EMPLOYEES WHERE employee_username='" + entity + "'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				result.next();
				employee_ssn = result.getString("employee_ssn");
				employee_first = result.getString("employee_first");
				employee_last = result.getString("employee_last");
				employee_username = result.getString("employee_username");
				employee_password = result.getString("employee_password");
				isManager = result.getBoolean("isManager");
				
				session.setAttribute("employee_ssn", employee_ssn);
				session.setAttribute("employee_first", employee_first);
				session.setAttribute("employee_last", employee_last);
				session.setAttribute("employee_username", employee_username);
				session.setAttribute("employee_password", employee_password);
				session.setAttribute("isManager", isManager);
				if (isManager){
					yeschecked="checked";
				} else nochecked="checked";
				
				
			} catch (Exception e) {
				out.print(e);
			}
	%>
	<a href="adminAddEditDeleteRepresentative.jsp">Back</a>
	<%
		out.println("Edit representative " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />

	<br>
	<form method="get" action="updateRepresentative.jsp">
		<table>
			<tr>
				<td>SSN</td>
				<td><input type="text" name="employee_ssn" value = "<%= session.getAttribute("employee_ssn") %>"></td>
			</tr>
			<tr>
				<td>First name</td>
				<td><input type="text" name="employee_first" value = "<%= session.getAttribute("employee_first") %>"></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><input type="text" name="employee_last" value = "<%= session.getAttribute("employee_last") %>"></td>
			</tr>
			<tr>
				<td>User name</td>
				<td><input type="text" name="employee_username" value = "<%= session.getAttribute("employee_username") %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="employee_password" value = "<%= session.getAttribute("employee_password") %>"></td>
			</tr>			
			<tr>
				<td>Manager?</td>
				<td><input type="radio" name="isManager" value="TRUE" <%=yeschecked%>>Yes
					<input type="radio" name="isManager" value="FALSE" <%=nochecked%>>No</td>
			</tr>
		</table>
		<input type="submit" value="Update">
	</form>
	<br>

	<%
		}
	%>



</body>
</html>