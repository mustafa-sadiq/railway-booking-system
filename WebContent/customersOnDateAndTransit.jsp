<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show customers on date and transit</title>
</head>
<body>


<a href ='customerRepresentativePage.jsp'>Back to home</a>
<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stmt = con.createStatement();
String schedule_query = ("select schedule_id as sid, transit_name as tname from SCHEDULES;");
ResultSet result = stmt.executeQuery(schedule_query);
out.print("<form method = \"get\" action =\"customersOnDateAndTransit.jsp\">");
out.print("<td> Transit: </td><select name=\"transit_id\" size=1>");
while(result.next()){
	String tname = result.getString("tname");
	String sid = result.getString("sid");
	out.print("<option value=\""+sid+"\">"+tname+"</option>");
}
out.print("</select>");
out.print("<td><input type = \"date\" value=\"YYYY-MM-DD\" name=\"today_date\" min=today></td>");
out.print("</select>&nbsp;<br> <input type=\"submit\" value=\"show\">");
out.print("</form>");
String transit = request.getParameter("transit_id");
String date = request.getParameter("today_date");
String reservation_query = ("select c.cust_first as first, c.cust_last as last"+
" from RESERVATION r"+
" join CUSTOMERS c"+
" on c.cust_username = r.cust_username"+
" where r.scheduled = "+transit+
" and r.reservation_date = \""+date+"\";");

ResultSet resultTwo = stmt.executeQuery(reservation_query);
out.print("<table>");

out.print("<tr>");

out.print("<td>");
out.print("First Name");
out.print("</td>");

out.print("<td>");
out.print("Last Name");
out.print("</td>");

while(resultTwo.next()){
	out.print("<tr>");
	
	out.print("<td>");
	String c1 = resultTwo.getString("first");
	out.print(c1);
	out.print("</td>");
	
	out.print("<td>");
	String c2 = resultTwo.getString("last");
	out.print(c2);
	out.print("</td>");
}
out.print("</table>");
con.close();
%>
</body>
</html>
