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
			int scheduled;
			int start_station;
			int stop_station;
			int stop_num;
			Time stop_departure;
			Time stop_arrival;
			try {
				
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();		

				//Create a SQL statement
				Statement stmt = con.createStatement();
				//Get the selected radio button from the index.jsp
				String entity = request.getParameter("user");
				String[] entity2= entity.split(",");
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				String str = "SELECT * FROM STOPS WHERE scheduled='" + entity2[0] + "' AND stop_num='"+ entity2[1] + "'";				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				result.next();
				scheduled = result.getInt("scheduled");
				start_station = result.getInt("start_station");
				stop_station = result.getInt("stop_station");
				stop_num = result.getInt("stop_num");
				stop_departure = result.getTime("stop_departure");
				stop_arrival = result.getTime("stop_arrival");
				
				session.setAttribute("scheduled", scheduled);
				session.setAttribute("start_station", start_station);
				session.setAttribute("stop_station", stop_station);
				session.setAttribute("stop_num", stop_num);
				session.setAttribute("stop_departure", stop_departure);
				session.setAttribute("stop_arrival", stop_arrival);
				
			} catch (Exception e) {
				out.print(e);
			}
	%>
	<a href="representativeEditDeleteSchedule.jsp">Back</a>
	<%
		out.println("Edit schedule " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />

	<br>
	<form method="get" action="updateSchedule.jsp">
		<table>
			<tr>
				<td>transit line name</td>
				<td><input type="text" name="scheduled" value = "<%= session.getAttribute("scheduled") %>"readonly="readonly"></td>
			</tr>
			<tr>
				<td>Departure Station</td>
				<td><input type="text" name="start_station" value = "<%= session.getAttribute("start_station") %>"readonly="readonly"></td>
			</tr>
			<tr>
				<td>Arrival Station</td>
				<td><input type="text" name="stop_station" value = "<%= session.getAttribute("stop_station") %>"readonly="readonly"></td>
			</tr>
			<tr>
				<td>Stop Number</td>
				<td><input type="text" name="stop_num" value = "<%= session.getAttribute("stop_num") %>"readonly="readonly"></td>
			</tr>
			<tr>
				<td>Departure Time</td>
				<td><input type="text" name="stop_departure" value = "<%= session.getAttribute("stop_departure") %>"></td>
			</tr>			
			<tr>
				<td>Arrival Time</td>
				<td><input type="text" name="stop_arrival" value = "<%= session.getAttribute("stop_arrival") %>"></td>
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