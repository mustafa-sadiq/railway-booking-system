<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminMostActiveTransit.jsp</title>
</head>
<body>
	<a href="adminPage.jsp">Back</a> adminMostActiveFiveTransitLines
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />
	
	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT transit_name, count(scheduled) FROM SCHEDULES LEFT JOIN RESERVATION ON schedule_id=scheduled GROUP BY scheduled ORDER BY count(scheduled) DESC limit 5";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		int count = 1;
		
		while(result.next()) {
			out.println("#" + count + " transit line: " + result.getString(1) + " with a total reservations of " + result.getString(2));
			count++;
			%>
			<br/> 
			<% 
		}	
		

	} catch (Exception e) {
		out.print(e);
	}
	%>

</body>
</html>