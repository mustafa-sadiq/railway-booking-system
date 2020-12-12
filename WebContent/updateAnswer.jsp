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
		String message_id=request.getParameter("message_id");
		String question = request.getParameter("question");
		String username = request.getParameter("username");
		String answer = request.getParameter("answer");
		String employee_username = request.getParameter("employee_username");


		//Make an insert statement for the Sells table:
		String update = "UPDATE FORUM "
		+ "SET question = ?, username = ?, answer = ?, employee_username = ? WHERE message_id=?";
		
		PreparedStatement ps = con.prepareStatement(update);

		ps.setString(1, question);
		ps.setString(2, username);
		ps.setString(3, answer);
		ps.setString(4, employee_username);
		ps.setString(5, message_id);
		
		//System.out.println(ps);
		
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("update succeeded");
		response.sendRedirect("representativeQuestionsPage.jsp");

	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	%>

</body>
</html>