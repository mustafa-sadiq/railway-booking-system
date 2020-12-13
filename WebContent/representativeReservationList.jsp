<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>representativeReservationList.jsp</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>


	<a href="customerRepresentativePage.jsp">Back</a> Produce a list of customers by
	transit line.
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />

	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT transit_name FROM SCHEDULES";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);

		
	%>



	<form method="get" action="representativeReservationList.jsp">
		<select name="item">
			<%
				while (result.next()) {
					if (result.getString("transit_name").equals(request.getParameter("item"))){
						%>
						<option selected><%=result.getString("transit_name")%></option>
						<%
					} else {
						%>
						<option><%=result.getString("transit_name")%></option>
						<%
					}
				}
			%>
		</select> <input type="submit" value="Get Customers">
	</form>



	<%
		if (request.getParameter("item") != null) {
	%>
	<br />
	<%
	String statement = "SELECT DISTINCT cust_username FROM RESERVATION,SCHEDULES WHERE scheduled=schedule_id and transit_name='"+
			request.getParameter("item") + "'";
	result = stmt.executeQuery(statement);
	%>
	<table>
		<tr>
			
			<td>cust_username</td>

		</tr>
		<%
			//parse out the results
		while (result.next()) {
		%>
		<tr>
			<td><%=result.getString("cust_username")%></td>
		</tr>


		<%
			}
		//close the connection.
		db.closeConnection(con);
		%>
	</table>


	<%
		}
	} catch (Exception e) {
	out.print(e);
	}
	%>

</body>
</html>