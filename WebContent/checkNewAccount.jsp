<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creating new account</title>
</head>
<body>

	<%
		String userid = request.getParameter("username");
	String pwd = request.getParameter("password");

	if (userid == "" || pwd == "") {
		out.println("Username or password cannot be empty <a href='newAccount.jsp'>try again</a>");
	} else {
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp

			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "INSERT INTO CUSTOMERS(cust_username, cust_password)" + "VALUES (?, ?)";
			PreparedStatement ps = con.prepareStatement(str);
			//Run the query against the database.

			ps.setString(1, userid);
			ps.setString(2, pwd);
			ps.executeUpdate();

			out.println("Account created succesfully. You may now ");
	%>
	<a href="index.jsp">login</a>

	<%
		//close the connection.
	db.closeConnection(con);

	} catch (SQLException e) {
	if (e.getErrorCode() == 1062) {
		out.print("Username already taken");
	%>
	<a href="index.jsp">try again</a>

	<%
		}

	} catch (Exception e) {
	out.print(e);
	}

	}
	%>

</body>
</html>