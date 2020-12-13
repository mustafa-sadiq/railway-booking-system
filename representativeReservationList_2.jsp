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
	 date
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />

	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		String str = "SELECT reservation_date FROM RESERVATION";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);

		
	%>



	<form method="get" action="representativeReservationList_2.jsp">
		<select name="item">
			<%
				while (result.next()) {
					if (result.getString("reservation_date").equals(request.getParameter("item"))){
						%>
						<option selected><%=result.getString("reservation_date")%></option>
						<%
					} else {
						%>
						<option><%=result.getString("reservation_date")%></option>
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
	String statement = "SELECT cust_username FROM RESERVATION,SCHEDULES WHERE scheduled=schedule_id and reservation_date='"+
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