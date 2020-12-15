<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse schedules</title>
</head>
<body>
<a href="customerPage.jsp">Back</a>
<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String schedule_query = ("select schedule_id as sid, transit_name as tname from SCHEDULES;");
ResultSet result = stmt.executeQuery(schedule_query);
out.print("<form method = \"get\" action =\"browseSchedule.jsp\">");
out.print("<td> Transit: </td><select name=\"transit_id\" size=1>");
while(result.next()){
	String tname = result.getString("tname");
	String sid = result.getString("sid");
	out.print("<option value=\""+sid+"\">"+tname+"</option>");
}
out.print("</select>");
%>
<td> Sort by: </td><select name="sort_by" size=1>
			<option value="st.stop_arrival">Arrival</option>
			<option value="st.stop_departure">Departure</option>
			<option value="sch.fare">Fare</option>
		</select>&nbsp;<br> <input type="submit" value="filter">
</form>
<%
String transit = request.getParameter("transit_id");
String sort_by = request.getParameter("sort_by");
String stop_query = ("select sch.transit_name as c1, s1.station_name as c2, s2.station_name as c3, st.stop_departure as c4, st.stop_arrival as c5, sch.fare as c6"
+" from STOPS as st"
+" join SCHEDULES as sch"
+" on sch.schedule_id = st.scheduled"
+" join STATIONS as s1"
+" on s1.station_id = st.start_station"
+" join STATIONS as s2"
+" on s2.station_id = st.stop_station"
+" where st.scheduled = "+transit+
" order by "+sort_by+";");
ResultSet resultTwo = stmt.executeQuery(stop_query);
out.print ("<table>");
out.print("<tr>");
out.print("<td>");
out.print("Transit Name");
out.print("</td>");
out.print("<td>");
out.print("Origin");
out.print("</td>");
out.print("<td>");
out.print("Destination");
out.print("</td>");
out.print("<td>");
out.print("Arrival");
out.print("</td>");
out.print("<td>");
out.print("Departure");
out.print("</td>");
out.print("<td>");
out.print("Fare");
out.print("</td>");
while(resultTwo.next()){
	out.print("<tr>");
	
	out.print("<td>");
	String c1 = resultTwo.getString("c1");
	out.print(c1);
	out.print("</td>");
	
	out.print("<td>");
	String c2 = resultTwo.getString("c2");
	out.print(c2);
	out.print("</td>");
	
	out.print("<td>");
	String c3 = resultTwo.getString("c3");
	out.print(c3);
	out.print("</td>");
	
	out.print("<td>");
	String c4 = resultTwo.getString("c4");
	out.print(c4);
	out.print("</td>");
	
	out.print("<td>");
	String c5 = resultTwo.getString("c5");
	out.print(c5);
	out.print("</td>");
	out.print("<td>");
	String c6 = resultTwo.getString("c6");
	out.print(c6);
	out.print("</td>");

}
out.print("</table>");
con.close();
%>

</body>
</html>
