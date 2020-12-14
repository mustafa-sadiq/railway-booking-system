<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.util.Date, java.text.*, java.sql.*, java.time.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Reservations</title>
</head>
<body>
<a href='customerPage.jsp'>Back</a>
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
LocalDateTime now = LocalDateTime.now(); 
String today = dtf.format(now);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date d1 = sdf.parse(today);

String username = (String)session.getAttribute("user");
String reservation_query =("select rs.reservation_num as c1, rs.reservation_date as c2, sch.transit_name as c3, s1.station_name as c4, s2.station_name as c5, rs.trip_type as c6, rs.reservation_fare as c7"
+" from RESERVATION as rs"
+" join SCHEDULES as sch"
+" on sch.schedule_id = rs.scheduled"
+" join STATIONS as s1"
+" on s1.station_id = rs.origin"
+" join STATIONS as s2"
+" on s2.station_id = rs.destination"
+" where rs.cust_username =\""+username+ "\";");
ResultSet result = stmt.executeQuery(reservation_query);

out.print("<table>");

out.print("<tr>");

out.print("<td>");
out.print("Reservation #");
out.print("</td>");

out.print("<td>");
out.print("Date");
out.print("</td>");

out.print("<td>");
out.print("Transit name");
out.print("</td>");

out.print("<td>");
out.print("Origin");
out.print("</td>");

out.print("<td>");
out.print("Destination");
out.print("</td>");

out.print("<td>");
out.print("Trip type");
out.print("</td>");

out.print("<td>");
out.print("Cost");
out.print("</td>");

out.print("<td>");
out.print("Cancel?");
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
	String trip = result.getString("c6");
	String c6 ="";
	if (trip.equals("0"))
		c6 = "round-trip";
	else
		c6 = "one-way";
	out.print(c6);
	out.print("</td>");
	
	out.print("<td>");
	String c7 = result.getString("c7");
	out.print(c7);
	out.print("</td>");
	
	out.print("<td>");
	Date d2 = sdf.parse(c2);
	if(d1.compareTo(d2) < 0){
		out.print("<form method = \"get\" action = \"cancelReservation.jsp\" >");
		out.print("<input type = \"hidden\" value = \"" +c1+ "\" name =\"res_num\">");
		out.print("<input type = \"submit\" value = \"cancel\">"); 
	}
	else{
		out.print("Invalid");
	}
	out.print("</td>");
}
out.print("</table");
con.close();
%>

</body>
</html>
