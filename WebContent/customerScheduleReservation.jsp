<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Schedule</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
</head>


<body>
	<a href="customerPage.jsp">Back</a>

<br>
	<form method = "get" action ="handleScheduleReservation.jsp">
		<td>Date: </td><td><input type = "date" value="YYYY-MM-DD" name="today_date"></td>
		<td> Origin: </td><select name="origin" size=1>
			<option value="100">Tomato</option>
			<option value="101">Onion</option>
			<option value="102">Potato</option>
		</select>
		<td> Destination: </td><select name="destination" size=1>
			<option value="100">Tomato</option>
			<option value="101">Onion</option>
			<option value="102">Potato</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
</br>
	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
			      ResultSet.CONCUR_UPDATABLE);
		//Get the selected radio button from the index.jsp
		String entity = request.getParameter("command");
		String keyword = request.getParameter("keyword");
		String stations;
		String str;
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		if (keyword == null) {
			str = "SELECT * FROM STOPS";
			stations = "SELECT * FROM STATIONS";		
		} else {
			str = "SELECT * FROM STATION WHERE question LIKE '" + "%" + keyword + "%' or answer LIKE '" + "%" + keyword + "%'";
		}

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>
	<table>
	<thead>
		<tr>
			<th>transit name</th>
			<th>departures from</th>
			<th>arrives at</th>
			<th>departure time</th>
			<th>arrival time</th>

		</tr>
		</thead>
		<%
			//parse out the results
		while (result.next()) {
		%>
		<tr>
		
			<td><%=result.getString("scheduled")%></td>
			<td><%=result.getString("start_station")%></td>
			<td><%=result.getString("stop_station")%></td>
			<td><%=result.getString("stop_departure")%></td>
			<td><%=result.getString("stop_arrival")%></td>
			
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

	%>
</body>
</html>