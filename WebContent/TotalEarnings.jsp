<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Total Earnings</title>
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
			
			//out.println("hello");
			
			out.println("<h1 style='font-size:30px'><strong> Total Earnings </strong></h1>");
			
			String query = "select sum(price) from bought_items";
			ResultSet result = stmt.executeQuery(query);
			if (result.next() && result.getString(1) == null) {
				out.println("<h3 style='font-size:28px'><strong> $0 </strong></h3>");
			}
			else {
				out.println("<br>");
				out.println("<h3 style='font-size:28px'><strong>$" +  result.getString(1) + " </strong></h3>");
				// ITEM DETAILS
				//t forget to do it, otherwise you're keeping the resources of the server allocated.
				
			}
			
			con.close();
		} catch (Exception ex) {
			out.print(ex);
			
		}
%>

</body></center>
</html>