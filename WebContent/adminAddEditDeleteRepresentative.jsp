<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add/Edit/Delete Customer Representative</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
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
	<a href="adminPage.jsp">Back</a>
	<%
		out.println("Add/Edit/Delete Customer Representative " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />
	<br/>

	<a href='addNewRepresentative.jsp'>Add a new representative</a>
	<br/>
	<br/>
	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String entity = request.getParameter("command");
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String str = "SELECT * FROM EMPLOYEES";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>
	<table>
		<tr>
			<td>employee_ssn</td>
			<td>employee_first</td>
			<td>employee_last</td>
			<td>employee_username</td>
			<td>employee_password</td>
			<td>isManager</td>
		</tr>
		<%
			//parse out the results
		while (result.next()) {
		%>
		<tr>
			<td><%=result.getString("employee_ssn")%></td>
			<td><%=result.getString("employee_first")%></td>
			<td><%=result.getString("employee_last")%></td>
			<td><%=result.getString("employee_username")%></td>
			<td><%=result.getString("employee_password")%></td>
			<td><%=result.getString("isManager")%></td>
			<td>
				<form action="deleteRepresentative.jsp" method="post">
					<input type="submit" name="delete_user" value="Delete" /> <input
						type="hidden" name="user" value="<%=result.getString(4)%>" />
				</form>
			</td>
			<td>
				<form action="editRepresentative.jsp" method="post">
					<input type="submit" name="edit_user" value="Edit" /> <input
						type="hidden" name="user" value="<%=result.getString(4)%>" />
				</form>
			</td>

		</tr>


		<%
			}
		//close the connection.
		db.closeConnection(con);
		%>
	</table>


	<%
		} catch (Exception e) {
	out.print(e);
	}

	}
	%>

</body>
</html>