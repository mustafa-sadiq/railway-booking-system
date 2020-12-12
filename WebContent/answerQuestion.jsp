<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>editRepresentative.jsp</title>
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
			String message_id;
			String question;
			String username;
			String answer;
			String employee_username;

			
			try {
				
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();		

				//Create a SQL statement
				Statement stmt = con.createStatement();
				//Get the selected radio button from the index.jsp
				String entity = request.getParameter("user");
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				String str = "SELECT * FROM FORUM WHERE message_id='" + entity + "'";
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(str);
				result.next();
				message_id = result.getString("message_id");
				question = result.getString("question");
				username = result.getString("username");
				answer = result.getString("answer");
				employee_username = result.getString("employee_username");

				session.setAttribute("message_id", message_id);
				session.setAttribute("question", question);
				session.setAttribute("username", username);
				session.setAttribute("answer", answer);
				session.setAttribute("employee_username", user);

				
				
			} catch (Exception e) {
				out.print(e);
			}
	%>
	<a href="representativeQuestionsPage.jsp">Back</a>
	<%
		out.println("Answer question " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />

	<br>
	<form method="get" action="updateAnswer.jsp">
		<table>
			<tr>
				<td>question number</td>
				<td><input type="text" name="message_id" value = "<%= session.getAttribute("message_id") %>"></td>
			</tr>
			<tr>
				<td>question</td>
				<td><input type="text" name="question" value = "<%= session.getAttribute("question") %>"></td>
			</tr>
			<tr>
				<td>user name</td>
				<td><input type="text" name="username" value = "<%= session.getAttribute("username") %>"></td>
			</tr>
			<tr>
				<td>answer</td>
				<td><input type="text" name="answer" value = "<%= session.getAttribute("answer") %>"></td>
			</tr>
			<tr>
				<td>User name</td>
				<td><input type="text" name="employee_username" value = "<%= session.getAttribute("employee_username") %>" readonly="readonly"></td>
			</tr>
		</table>
		<input type="submit" value="Update">
	</form>
	<br>

	<%
		}
	%>



</body>
</html>