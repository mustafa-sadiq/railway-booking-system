<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		try {

		String user = (String) session.getAttribute("user");

		//Get the database connection
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Get parameters from the HTML form at the index.jsp
		String scheduled = request.getParameter("scheduled");
		String start_station = request.getParameter("start_station");
		String stop_station = request.getParameter("stop_station");
		String stop_num = request.getParameter("stop_num");
		String stop_departure = request.getParameter("stop_departure");
		String stop_arrival = request.getParameter("stop_arrival");
		//Make an insert statement for the Sells table:
		String update = "UPDATE STOPS "
		+ "SET start_station = ?, stop_station = ?, stop_departure = ?,  stop_arrival = ? WHERE scheduled = ? AND stop_num = ?";
		
		PreparedStatement ps = con.prepareStatement(update);

		ps.setString(1, start_station);
		ps.setString(2, stop_station);
		ps.setString(3, stop_departure);
		ps.setString(4, stop_arrival);
		ps.setString(5, scheduled);
		ps.setString(6, stop_num);
		
		//System.out.println(ps);
		
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("update succeeded");
		response.sendRedirect("representativeEditDeleteSchedule.jsp");

	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	%>

</body>
</html>