<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Schedules</title>
</head>
<body>
<a href="customerScheduleReservation.jsp">Back</a>
<%
	List<String> list = new ArrayList<String>();
	String origin_id = request.getParameter("origin");
	String dest_id = request.getParameter("destination");
	String customer_date = request.getParameter("today_date");
	String temp_value = "YYYY-MM-DD";
	if(origin_id.equals(dest_id)) {
		out.println("Seems like you are looking for a round trip but have not provided the destination. Please provide distinct origin and destination and select round trip.\n <a href ='customerScheduleReservation.jsp'>try again</a>");
	}
	else if(customer_date.equals(temp_value)){
		out.println("Wrong date value. Please provide a valid date. <a href ='customerScheduleReservation.jsp'>try again</a>");
	}
	else {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
	
		Statement stmt = con.createStatement();
			
		String station_schedule_query = "select distinct s.schedule_id as sid, s.transit_name as name, s.train_id as tid, s.fare + s.fare*  abs(s1.stop_num - s2.stop_num) as fare from	SCHEDULES s, (select t1.scheduled, t1.stop_num from STOPS t1 where t1.start_station = "+origin_id+" ) as s1, ( select t2.scheduled, t2.stop_num from STOPS t2 where t2.stop_station =" +dest_id+" ) as s2 where s.schedule_id = s1.scheduled and	s1.scheduled = s2.scheduled;";
		ResultSet result = stmt.executeQuery(station_schedule_query);
		
		out.print("<table>");
		
		out.print("<tr>");
		
		out.print("<td>");
		out.print("transit ID");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Transit name");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Train ID");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Fare");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Trip type?");
		out.print("</td>");
		
		out.print("<td>");
		out.print(" ");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Discount?");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Reserve?");
		out.print("</td>");
			
		out.print("</tr>");
		
		while(result.next()){
			out.print("<tr>");
			
			out.print("<td>");
			String sid = result.getString("sid"); 
			out.print("<form method = \"get\" action = \"showAllStops.jsp\" >");
			out.print("<input type = \"hidden\" value = \"" +sid+ "\" name =\"schedule_id\">");
			out.print("<input type = \"submit\" value = "+sid+">"); 
			out.print("</form>");
			out.print("</td>");
			
			out.print("<td>");
			String name = result.getString("name");
			out.print(name);
			out.print("</td>");
				
			out.print("<td>");
			String tid = result.getString("tid");
			out.print(tid);
			out.print("</td>");
				
			out.print("<td>");
			float fare = Float.parseFloat(result.getString("fare"));
			out.print(fare);
			out.print("</td>");
			
			out.print("<td>");
			out.print("<form method = \"get\" action = \"handleReservation.jsp\" >" +
					"<select name = \"trip_type\" size = 1>" +
					"<option value=1>One way</option>" +
					"<option value=2>Two way</option>" +
				"</select>");
			out.print("<td>");
			
			out.print("<td>");
			out.print("<select name = \"discount\" size = 1>" +
					"<option value=0>None</option>" +
					"<option value=25>Children</option>" +
					"<option value=35>Senior</option>" +
 					"<option value=50>Disabled</option>" +
				"</select>");
			out.print("<td>");
			
			out.print("<input type = \"hidden\" value = \"" +origin_id+ "\" name =\"origin_id\">"+
			"<input type = \"hidden\" value = \"" +dest_id+ "\" name =\"dest_id\">"+
			"<input type = \"hidden\" value = \"" +sid+ "\" name =\"schedule_id\">"+
			"<input type = \"hidden\" value = \"" +customer_date+ "\" name =\"reserv_date\">"+
			"<input type = \"hidden\" value = \"" +fare+ "\" name =\"fare\">"+
			"<input type = \"submit\" value = \"submit\">");
			out.print("</td>");
			out.print("</form>");
			out.print("</tr>");
		}
		out.print("</table>");
		con.close();
	}	
%>
</body>
</html>
