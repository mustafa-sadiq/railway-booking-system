<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminProduceRevenueTransit.jsp</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<a href="adminPage.jsp">Back</a> adminProduceRevenueTransit
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />
	
	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT transit_name, sum(reservation_fare) FROM SCHEDULES left join RESERVATION on schedule_id=scheduled group by transit_name";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>
	
	<table>
		<tr>
			<td>transit_name</td>
			<td>revenue</td>

		</tr>
		<%
			//parse out the results
		while (result.next()) {
		%>
		<tr>
			<td><%=result.getString("transit_name")%></td>
			<td><%=result.getString("sum(reservation_fare)")%></td>
		</tr>


		<%
			}
		//close the connection.
		db.closeConnection(con);
		%>
	</table>


	
	<%
		
	} catch (Exception e) {
	out.print(e);
	}
	%>

</body>
</html>