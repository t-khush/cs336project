<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: View Account</title>
</head>
<style>
		h1 {margin-top: 0px; font-size: 30px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover {color: black; text-decoration: underline;}
		table {border-collapse: collapse; width: 40%}
		td { border: 1px solid #dddddd; text-align: left; padding: 8spx; font-size: 18px;}
		tr:nth-child(even) { background-color: #dddddd;}
		.button-container form, .button-container form div { display: inline; }
		.button-container button { display: inline; vertical-align: middle;}
</style>
<div class='h1'><h1><a href='CustomerRepHomePage.jsp'> BuyMe </a></h1></div>
<center><body>
	<%
		try {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String num = request.getParameter("num");
			String user = (String)request.getSession().getAttribute("selectedUsername" + num);
			request.getSession().setAttribute("user", user);
			String pass = (String)request.getSession().getAttribute("selectedPassword"+num);
			request.getSession().setAttribute("pass", pass);

			//out.println("hello");
			
			out.println("<h1 style='font-size:30px'><strong> User </strong></h1>");
			out.println("<br>");
			out.println("<div class='button-container'>");
    		out.println("<form style='text:align=center' action='EditAccount.jsp'>");
            out.println("<input type='submit' style='font-size:15px;height:30px;width:150px' value='Edit Account'>");
            out.println("</form>");
            out.println("</div>");
            out.println("<br>");
			// ITEM DETAILS
			out.println("<table>");
			out.println("<tr>");
	        out.println("<td><strong> Username </strong></td><td><strong> Password </strong></td>");
	        out.println("</tr>");
	        out.println("<tr>");
       		out.println("<td><p> " + user + "</p></td><td><p>" + pass +"</p></td>");
       		out.println("</tr>");
   	   
   	        out.println("</table>");
   	        out.println("</form>");
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
			
		} catch (Exception ex) {
			out.print(ex);
			
		}
%>

</body></center>
</html>