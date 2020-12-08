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
		String employee_ssn = request.getParameter("employee_ssn");
		String employee_first = request.getParameter("employee_first");
		String employee_last = request.getParameter("employee_last");
		String employee_username = request.getParameter("employee_username");
		String employee_password = request.getParameter("employee_password");
		boolean isManager = Boolean.parseBoolean(request.getParameter("isManager"));

		//Make an insert statement for the Sells table:
		String update = "UPDATE EMPLOYEES "
		+ "SET employee_ssn = ?, employee_first = ?, employee_last = ?, employee_password = ?,  isManager = ? WHERE employee_username = ?";
		
		PreparedStatement ps = con.prepareStatement(update);

		ps.setString(1, employee_ssn);
		ps.setString(2, employee_first);
		ps.setString(3, employee_last);
		ps.setString(4, employee_password);
		ps.setBoolean(5, isManager);
		ps.setString(6, employee_username);
		
		//System.out.println(ps);
		
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("update succeeded");
		response.sendRedirect("adminAddEditDeleteRepresentative.jsp");

	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	%>

</body>
</html>