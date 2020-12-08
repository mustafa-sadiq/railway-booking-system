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
		String userid = request.getParameter("username");
	String pwd = request.getParameter("password");

	if (userid == "" || pwd == "") {
		out.println("Username or password cannot be empty <a href='index.jsp'>try again</a>");
	} else if (userid.equals("admin") || pwd.equals("admin")) {
		session.setAttribute("user", userid);
		response.sendRedirect("adminPage.jsp");
	} else {

		//Get the database connection

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		Statement st = con.createStatement();
		ResultSet rs;
		rs = st.executeQuery("select * from CUSTOMERS where cust_username='" + userid + "' and cust_password='" + pwd + "'");
		if (rs.next()) {
			session.setAttribute("user", userid); // the username will be stored in the session
			out.println("welcome " + userid);
			out.println("<a href='logout.jsp'>Log out</a>");
			response.sendRedirect("customerPage.jsp");
		} else {
			rs = st.executeQuery("select * from EMPLOYEES where employee_username='" + userid + "' and employee_password='" + pwd + "'");
			if (rs.next()) {
				session.setAttribute("user", userid); // the username will be stored in the session
				out.println("welcome " + userid);
				out.println("<a href='logout.jsp'>Log out</a>");
				response.sendRedirect("customerRepresentativePage.jsp");
			} else {
				out.println("Invalid credentials <a href='index.jsp'>try again</a>");
			}
			
		}

	}
	%>


</body>
</html>