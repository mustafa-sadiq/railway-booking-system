<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>representativeSchedulesGivenStation.jsp</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>

	<a href="customerRepresentativePage.jsp">Back</a> produce a list of train schedules for
	a given station (as origin/destination)
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />

	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT station_name FROM STATIONS";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>



	<form method="get" action="representativeSchedulesGivenStation.jsp">
		<select name="item">
			<%
				while (result.next()) {
				if (result.getString("station_name").equals(request.getParameter("item"))) {
			%>
			<option selected><%=result.getString("station_name")%></option>
			<%
				} else {
			%>
			<option><%=result.getString("station_name")%></option>
			<%
				}

			}
			%>
		</select> <input type="submit" value="Get schdeules">
	</form>



	<%
		if (request.getParameter("item") != null) {
	%>
	<br />
	<%
		String statement = "SELECT * FROM STOPS WHERE start_station=(select station_id from STATIONS where station_name='"
			+ request.getParameter("item") + "') or stop_station=(select station_id from STATIONS where station_name='"
			+ request.getParameter("item") + "')";
	result = stmt.executeQuery(statement);
	%>
	<table>
		<tr>
			<td>scheduled</td>
			<td>start_station</td>
			<td>stop_station</td>
			<td>stop_num</td>
			<td>stop_departure</td>
			<td>stop_arrival</td>

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