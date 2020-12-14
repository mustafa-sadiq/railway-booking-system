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
		String statement = "select rs.scheduled as c1, s1.station_name as c2, s2.station_name as c3, rs.stop_num as c4, rs.stop_departure as c5, rs.stop_arrival as c6"
				+" from STOPS as rs"
				+" join STATIONS as s1"
				+" on s1.station_id = rs.start_station"
				+" join STATIONS as s2"
				+" on s2.station_id = rs.stop_station"
				+" where s1.station_name='" + request.getParameter("item") + "' or s2.station_name='" + request.getParameter("item") + "'";
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
			<td><%=result.getString("c1")%></td>
			<td><%=result.getString("c2")%></td>
			<td><%=result.getString("c3")%></td>
			<td><%=result.getString("c4")%></td>
			<td><%=result.getString("c5")%></td>
			<td><%=result.getString("c6")%></td>


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