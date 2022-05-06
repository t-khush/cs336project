<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Questions</title>
</head>
<style>
		h1 {margin-top: 0px; font-size:30px;}
		a:link { color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover {color: black; text-decoration: underline;}
		table {border-collapse: collapse; width: 80%}
		td { border: 1px solid #dddddd; text-align: center; padding: 11px;}
	</style>
	<div class="h1"><h1><a href="LoginSuccess.jsp"> BuyMe </a></h1></div>
<center><body>	
	<%
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	Statement stmt1 = con.createStatement();
	
	String num = (String)request.getParameter("num");
	String question = (String)request.getSession().getAttribute("selectedQuestion"+num);
	String questionID = (String)request.getSession().getAttribute("selectedQuestionID"+num);
	String username = (String)request.getSession().getAttribute("username");
	String checkIfUserIsCustomerRepQuery = "select * from customer_reps where customer_rep_name = '" + username + "'";
	ResultSet checkIfUserIsCustomerRepResults = stmt.executeQuery(checkIfUserIsCustomerRepQuery);
	boolean isUserCustomerRep = checkIfUserIsCustomerRepResults.next();
	
	out.println("<tr>");
    out.println("<td><h1><big>" + question + "</big></h1></td>");
	out.println("</tr>");
	out.println("<br>");
	out.println("<br>");
	out.println("<td><h2><big>Answers</big></h2></td>");
	out.println("<br>");
	
	if (isUserCustomerRep) {
		out.println("<form style='text:align=center' action='AnswerQuestion.jsp'>");
		out.println("<input type='submit' style='font-size:15px;height:30px;width:200px' value='Answer Question'>");
		out.println("</form>");
		out.println("<br>");
	}
	
	String query = "select reply, customer_rep_name from replys, customer_reps where question_id = " + questionID; 
	ResultSet result = stmt.executeQuery(query);
	out.println("<table>");
	int size= 0;  
	if (!result.next()) {  
	  out.println("<h3 style='font-size:25px'><strong> No Answers Yet!</strong></h3>");
	}
	else {
		int i = 1;
		result.beforeFirst();
        while(result.next()) {
        	if (i % 2 != 0) {
        		out.println("<tr>");
        		out.println("<td><a style='font-size:18px' href='BuyPage.jsp?num="+ i + "'><strong>"+ result.getString(2) + " replied: </strong>" + result.getString(1) + "</a></td>");
        		out.println("</tr>");
        	}
        	else {
        		out.println("<tr>");
        		out.println("<td><a style='font-size:18px' href='BuyPage.jsp?num="+ i + "'><strong>"+ result.getString(2) + "replied: </strong>" + result.getString(1) + "</a></td>");
        		out.println("</tr>");
        	}
        	i++;
        }
        out.println("<table>");
	}
	con.close();
	%>
</body>
</html>