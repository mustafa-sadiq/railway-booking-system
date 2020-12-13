<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation cancelled</title>
</head>
<body>
<%
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();
Statement stmt = con.createStatement();

String resNum = request.getParameter("res_num");
String delete_query = ("delete from RESERVATION where reservation_num ="+resNum+";");
PreparedStatement ps = con.prepareStatement(delete_query);
ps.executeUpdate();
out.print("Cancellation successful!");
con.close();
%>
<a href ='customerPage.jsp'>Back to home</a>
</body>
</html>