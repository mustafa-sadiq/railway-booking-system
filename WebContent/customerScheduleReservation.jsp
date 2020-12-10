<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Schedule</title>
</head>
<body>

<br>
	<form method = "get" action ="handleScheduleReservation.jsp">
		<td>Date: </td><td><input type = "date" value="YYYY-MM-DD" name="today_date"></td>
		<td> Origin: </td><select name="origin" size=1>
			<option value="100">Tomato</option>
			<option value="101">Onion</option>
			<option value="102">Potato</option>
		</select>
		<td> Destination: </td><select name="destination" size=1>
			<option value="100">Tomato</option>
			<option value="101">Onion</option>
			<option value="102">Potato</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
</br>

</body>
</html>