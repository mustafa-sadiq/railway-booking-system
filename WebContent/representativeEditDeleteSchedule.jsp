<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminAddEditDeleteRepresentative.jsp</title>
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
	<a href="customerRepresentativePage.jsp">Back</a>
	<%
		out.println("edit/delete schedules " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />

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
		String str = "SELECT * FROM STOPS";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>
	<table>
		<tr>
			<td>Transit Line</td>
			<td>Departure Station</td>
			<td>Arrival Station</td>
			<td>Stop Number</td>
			<td>Departure Time</td>
			<td>Arrival Time</td>
		</tr>
		<%
			//parse out the results
		while (result.next()) {
		%>
		<tr>
			<td><%=result.getString("scheduled")%></td>
			<td><%=result.getString("start_station")%></td>
			<td><%=result.getString("stop_station")%></td>
			<td><%=result.getString("stop_num")%></td>
			<td><%=result.getString("stop_departure")%></td>
			<td><%=result.getString("stop_arrival")%></td>
			<td>
				<form action="deleteSchedule.jsp" method="post">
					<input type="submit" name="delete_Schedule" value="Delete" /> <input
						type="hidden" name="user" value="<%=result.getString(1) + "," + result.getString(4)%>"/>

				</form>
			</td>
			<td>
				<form action="editSchedule.jsp" method="post">
					<input type="submit" name="edit_Schedule" value="Edit" /> <input
						type="hidden" name="user" value="<%=result.getString(1) + "," + result.getString(4)%>"/>
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