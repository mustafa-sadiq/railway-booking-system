<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation</title>
</head>
<body>
<% 
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

float fare = Float.parseFloat((String)request.getParameter("fare"));
String date = request.getParameter("reserv_date");
String username = (String)session.getAttribute("user");
int origin = Integer.parseInt((String)request.getParameter("origin_id"));
int dest = Integer.parseInt((String)request.getParameter("dest_id"));
int sid = Integer.parseInt((String)request.getParameter("schedule_id"));
int trip_type = Integer.parseInt((String)request.getParameter("trip_type"));
float discount = Integer.parseInt((String)request.getParameter("discount"));
float calculated_fare = (1 -(discount/100)) * fare * trip_type;
boolean one_way;
if (trip_type == 1)
	one_way = true;
else
	one_way = false;
String insert = "INSERT INTO RESERVATION(reservation_fare, reservation_date, cust_username, origin, destination, scheduled, trip_type)"+
	"VALUES(?, ?, ?, ?, ?, ?, ?)";
PreparedStatement ps = con.prepareStatement(insert);
ps.setFloat(1, calculated_fare);
ps.setString(2, date);
ps.setString(3, username);
ps.setInt(4, origin);
ps.setInt(5, dest);
ps.setInt(6, sid);
ps.setBoolean(7, one_way);
ps.executeUpdate();
con.close();
out.print("Reservation successful!");
%>
<a href ='customerPage.jsp'>Back to home</a>
</body>
</html>