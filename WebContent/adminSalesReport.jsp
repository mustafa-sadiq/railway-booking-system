<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales report by month</title>
</head>
<body>

	<a href="adminPage.jsp">Back</a> Find sales report by month
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />

	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT DISTINCT month(reservation_date), year(reservation_date) FROM RESERVATION";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>



	<form method="get" action="adminSalesReport.jsp">
		<select name="item">
			<%
				while (result.next()) {
			%>
			<option><%=result.getString(1) + "/" + result.getString(2)%></option>
			<%
				}
			%>
		</select> <input type="submit" value="Get sales report">
	</form>



	<%
		if (request.getParameter("item") != null) {
		String[] values = request.getParameter("item").split("\\/");
	%>
	<br />
	<%
		out.println("Total revenue for month " + values[0] + "/" + values[1] + ": ");
	String statement = "SELECT sum(reservation_fare) FROM RESERVATION WHERE month(reservation_date)='" + values[0]
			+ "' and year(reservation_date)='" + values[1] + "'";
	result = stmt.executeQuery(statement);
	result.next();
	out.print(result.getString(1));

	}

	} catch (Exception e) {
	out.print(e);
	}
	%>


</body>
</html>