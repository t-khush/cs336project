<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Best Buyer</title>
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
<div class='h1'><h1><a href='AdminDashboard.jsp'> BuyMe </a></h1></div>
<center><body>
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();

			String query = "select buyer, sum(price) total_money_spent from bought_items group by buyer order by total_money_spent desc limit 10";
			ResultSet result = stmt.executeQuery(query);
			
			out.println("<h1 style='font-size:30px'><strong>Best Buyers (Top 10) </strong></h1>");
			out.println("<br><br>");
			if (!result.next()) {
				out.println("<h2 style='font-size:25px'><strong>No users bought anything!</strong></h1>");
			}
			else {
				out.println("<br>");
				// ITEM DETAILS
				out.println("<table>");
				out.println("<tr>");
		        out.println("<td><strong> Buyer </strong></td><td><strong> Total Money Spent </strong></td>");
		        out.println("</tr>");
	       		int i = 1;
	       		result.beforeFirst();
	   	        while(result.next()) {
	   	        	if (i % 2 != 0) {
	   	        		out.println("<tr>");
	   	        		out.println("<td><p> " + result.getString(1) + "</p></td><td><p>" + result.getString(2)+"</p></td>");
	   	        		out.println("</tr>");
	   	        	}
	   	        	else {
	   	        		out.println("<tr>");
	   	        		out.println("<td><p>" + result.getString(1) + "</p></td><td><p>" + result.getString(2)+"</p></td>");
	   	        		out.println("</tr>");
	   	        	}
	   	        	i++;
	   	        }
	   	        out.println("</table>");
	   	        out.println("</form>");
			}
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			
		}
%>

</body></center>
</html>