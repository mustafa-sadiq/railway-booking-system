<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminBestCustomer.jsp</title>
</head>
<body>
	<a href="adminPage.jsp">Back</a> adminBestCustomer
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />

	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT cust_username, sum(reservation_fare) FROM RESERVATION GROUP BY cust_username ORDER BY sum(reservation_fare) DESC limit 1";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		result.next();
		
		out.println("Best customer is: " + result.getString(1) + " with a total revenue of " + result.getString(2));

	} catch (Exception e) {
		out.print(e);
	}
	%>

</body>
</html>