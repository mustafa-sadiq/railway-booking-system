<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminReservationsByTransit.jsp</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>


	<a href="adminPage.jsp">Back</a> Produce a list of reservations by
	transit line
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />

	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT transit_name FROM SCHEDULES";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>



	<form method="get" action="adminReservationsByTransit.jsp">
		<select name="item">
			<%
				while (result.next()) {
			%>
			<option><%=result.getString("transit_name")%></option>
			<%
				}
			%>
		</select> <input type="submit" value="Get reservations">
	</form>



	<%
		if (request.getParameter("item") != null) {
	%>
	<br />
	<%
		String statement = "SELECT * FROM RESERVATION WHERE scheduled=(SELECT schedule_id FROM SCHEDULES WHERE transit_name='"
			+ request.getParameter("item") + "')";
	result = stmt.executeQuery(statement);
	%>
	<table>
		<tr>
			<td>reservation_num</td>
			<td>reservation_fare</td>
			<td>reservation_date</td>
			<td>cust_username</td>
			<td>origin</td>
			<td>destination</td>
			<td>scheduled</td>
			<td>trip_type</td>
			<td>employee</td>

		</tr>
		<%
			//parse out the results
		while (result.next()) {
		%>
		<tr>
			<td><%=result.getString("reservation_num")%></td>
			<td><%=result.getString("reservation_fare")%></td>
			<td><%=result.getString("reservation_date")%></td>
			<td><%=result.getString("cust_username")%></td>
			<td><%=result.getString("origin")%></td>
			<td><%=result.getString("destination")%></td>
			<td><%=result.getString("scheduled")%></td>
			<td><%=result.getString("trip_type")%></td>
			<td><%=result.getString("employee")%></td>
		</tr>


		<%
			}
		//close the connection.
		db.closeConnection(con);
		%>
	</table>


	<%
		}
	} catch (Exception e) {
	out.print(e);
	}
	%>

</body>
</html>