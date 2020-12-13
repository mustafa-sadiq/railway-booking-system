<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All stops</title>
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

String sid = request.getParameter("schedule_id");

String stops_query = ("select st.scheduled as c1, sch.transit_name as c2, s1.station_name as c3, s2.station_name as c4, st.stop_departure as c5, st.stop_arrival as c6"
+" from STOPS as st"
+" join SCHEDULES as sch"
+" on sch.schedule_id = st.scheduled"
+" join STATIONS as s1"
+" on s1.station_id = st.start_station"
+" join STATIONS as s2"
+" on s2.station_id = st.stop_station"
+" where st.scheduled = "+sid+";");
ResultSet result = stmt.executeQuery(stops_query);

out.print("<table>");

out.print("<tr>");

out.print("<td>");
out.print("transit ID");
out.print("</td>");

out.print("<td>");
out.print("transit name");
out.print("</td>");

out.print("<td>");
out.print("Start station");
out.print("</td>");

out.print("<td>");
out.print("Terminal station");
out.print("</td>");

out.print("<td>");
out.print("Departure time");
out.print("</td>");

out.print("<td>");
out.print("Arrival time");
out.print("</td>");
	
out.print("</tr>");

while(result.next()){
	out.print("<tr>");

	out.print("<td>");
	String c1 = result.getString("c1");
	out.print(c1);
	out.print("</td>");

	out.print("<td>");
	String c2 = result.getString("c2");
	out.print(c2);
	out.print("</td>");

	out.print("<td>");
	String c3 = result.getString("c3");
	out.print(c3);
	out.print("</td>");

	out.print("<td>");
	String c4 = result.getString("c4");
	out.print(c4);
	out.print("</td>");

	out.print("<td>");
	String c5 = result.getString("c5");
	out.print(c5);
	out.print("</td>");
	
	out.print("<td>");
	String c6 = result.getString("c6");
	out.print(c6);
	out.print("</td>");
	
	out.print("</tr>");
}
out.print("</table>");
con.close();
%>
</head>
<body>

</body>
</html>