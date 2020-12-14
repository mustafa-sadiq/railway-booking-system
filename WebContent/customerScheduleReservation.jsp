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
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd"); 
LocalDateTime now = LocalDateTime.now(); 
String today = dtf.format(now);
%>
<br>
	<form method = "get" action ="handleScheduleReservation.jsp">
		<td>Date: </td><td><input type = "date" value="YYYY-MM-DD" name="today_date" min=today></td>
		<td> Origin: </td><select name="origin" size=1>
			<option value="100">Union Stationo</option>
			<option value="101">Elizabeth Station</option>
			<option value="102">Roselle Station</option>
			<option value="103">Edison</option>
			<option value="104">New Bruns Station</option>
			<option value="105">Piscataway station</option>
		</select>
		<td> Destination: </td><select name="destination" size=1>
			<option value="100">Union Stationo</option>
			<option value="101">Elizabeth Station</option>
			<option value="102">Roselle Station</option>
			<option value="103">Edison</option>
			<option value="104">New Bruns Station</option>
			<option value="105">Piscataway station</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
</br>

</body>
</html>
