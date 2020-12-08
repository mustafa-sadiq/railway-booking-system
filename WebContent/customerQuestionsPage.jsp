<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer service</title>
</head>
<body>

	<%
		String user = (String) session.getAttribute("user");

	if (user == null) {
		out.println("You are not logged in");
	%>
	<br />
	<a href="index.jsp">Please Login</a>
	<%
		} else {
			%>
			<a href="customerPage.jsp">Back</a>
			<%
	out.println("Welcome to Customer Service " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />

	<a href='customerAskNewQuestion.jsp'>Ask a new question</a>
	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String entity = request.getParameter("command");
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String str = "SELECT * FROM FORUM WHERE username='" + user + "'";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>
	<table>
		<tr>
			<td>Question</td>
			<td>Answer</td>
		</tr>
		<%
			//parse out the results
		while (result.next()) {
		%>
		<tr>
			<td><%=result.getString("question")%></td>
			<td><%=result.getString("answer")%></td>
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

	}
	%>





</body>
</html>