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
	String fname = request.getParameter("cust_first");
	String lname = request.getParameter("cust_last");
	String email = request.getParameter("email");
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
			String employee = "SELECT * FROM EMPLOYEES WHERE employee_username='" + userid + "'";
			ResultSet result = stmt.executeQuery(employee);
			result.next();
			
			if (result.next() == false){
				throw new SQLException();
			}		
			
			String str = "INSERT INTO CUSTOMERS(cust_first,cust_last,cust_email,cust_username,cust_password)" + "VALUES (?, ?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(str);
			//Run the query against the database.

			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, email);
			ps.setString(4,userid);
			ps.setString(5,pwd);
			ps.executeUpdate();

			out.println("Account created succesfully. You may now login ");
	%>
	<a href="index.jsp">login</a>

	<%
		//close the connection.
	db.closeConnection(con);

	} catch (SQLException e) {
		out.print("Username already taken");
	%>
	<a href="index.jsp">try again</a>

	<%
	} catch (Exception e) {
	out.print(e);
	}

	}
	%>

</body>
</html>