<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer service</title>
<style type="text/css">
table, th, td {
	border: 1px solid black;
}
</style>
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
	<a href="customerRepresentativePage.jsp">Back</a>
	<%
		out.println("Welcome to Customer Service " + user);
	%>
	<a href='logout.jsp'>Log out</a>
	<br />
	<br />

	<br />
	<br />

	<form method="get" action="representativeFilterQuestions.jsp">
		Keyword: <input type="text" name="keyword"> <input
			type="submit" value="Filter">
	</form>
	<br />

	<%
		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String entity = request.getParameter("command");
		String keyword = request.getParameter("keyword");
		String str;
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		if (keyword == null) {
			str = "SELECT * FROM FORUM";
		} else {
			str = "SELECT * FROM FORUM WHERE question LIKE '" + "%" + keyword + "%' or answer LIKE '" + "%" + keyword + "%'";
		}
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
	%>
		<table>
			<tr>
			<td>question id</td>
				<td>Question</td>
				<td>Asked by</td>
				<td>Answer</td>
				<td>Answered by</td>
	
			</tr>
			<%
				//parse out the results
			while (result.next()) {
			%>
			<tr>
				<td><%=result.getString("message_id")%></td>
				<td><%=result.getString("question")%></td>
				<td><%=result.getString("username")%></td>
				<td><%=result.getString("answer")%></td>
				<td><%=result.getString("employee_username")%></td>
				<td>
					<form action="answerQuestion.jsp" method="post">
					<input type="submit" name="answer_question" value="answer" /> <input
						type="hidden" name="user" value="<%=result.getString(1)%>" />
				</form>
			</td>
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
