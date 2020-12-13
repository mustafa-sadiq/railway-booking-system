<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Schedule</title>
</head>
<body>

	<%		
		try {
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("user");
			String[] entity2= entity.split(",");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "DELETE FROM STOPS WHERE scheduled='" + entity2[0] + "' AND stop_num='"+ entity2[1] + "'";
			//Run the query against the database.
			PreparedStatement ps = con.prepareStatement(str);
			ps.executeUpdate();
			response.sendRedirect("representativeEditDeleteSchedule.jsp");
			
		} catch (Exception e) {
			out.print(e);
		}
	
	%>



</body>
</html>