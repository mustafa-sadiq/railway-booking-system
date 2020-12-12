<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminProduceRevenueCustomer.jsp</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<a href="adminPage.jsp">Back</a> adminProduceRevenueCustomer
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />

	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT c.cust_username, sum(reservation_fare) FROM CUSTOMERS c left join RESERVATION as r on c.cust_username=r.cust_username group by cust_username";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>

	<table>
		<tr>
			<td>cust_username</td>
			<td>revenue</td>

		</tr>
		<%
			//parse out the results
		while (result.next()) {
		%>
		<tr>
			<td><%=result.getString("cust_username")%></td>
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