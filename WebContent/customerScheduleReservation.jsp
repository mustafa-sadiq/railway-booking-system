<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Schedule</title>
</head>
<body>
<a href="customerPage.jsp">Back</a>
<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stmt = con.createStatement();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd"); 
LocalDateTime now = LocalDateTime.now(); 
String today = dtf.format(now);
String station_query = ("select station_id as sid, station_name as name from STATIONS");
String station_query2 = ("select station_id as sid, station_name as name from STATIONS");


%>
	<br>
	<form method = "get" action ="handleScheduleReservation.jsp">
		<td>Date: </td><td><input type = "date" value="YYYY-MM-DD" name="today_date" min=today></td>
		<td> Origin: </td><select name="origin" size=1>
<% 
		ResultSet result = stmt.executeQuery(station_query);
		while(result.next()){
			String name = result.getString("name");
			String sid = result.getString("sid");
			out.print("<option value=\""+sid+"\">"+name+"</option>");
		}
%>
		</select>
		<td> Destination: </td><select name="destination" size=1>
<% 
		ResultSet result2 = stmt.executeQuery(station_query2);
		while(result2.next()){
			String name2 = result2.getString("name");
			String sid2 = result2.getString("sid");
			out.print("<option value=\""+sid2+"\">"+name2+"</option>");
		}
		con.close();
%>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
</br>

</body>
</html>
