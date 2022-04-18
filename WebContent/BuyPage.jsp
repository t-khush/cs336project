<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Buy</title>
</head>
<style>
		h1 {margin-top: 0px; font-size: 30px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover {color: black; text-decoration: underline;}
		table {border-collapse: collapse; width: 40%}
		td { border: 1px solid #dddddd; text-align: left; padding: 11px; font-size: 18px;}
		tr:nth-child(even) { background-color: #dddddd;}
</style>
	<div class="h1"><h1><strong> <a href="LoginSuccess.jsp"> BuyMe </a> </strong></h1></div>
<center><body>	
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get parameters from the HTML form at the index.jsp
			int num = Integer.parseInt(request.getParameter("num").toString());
			String itemname = (String)request.getSession().getAttribute("selectedItem"+num);
			String username = (String)request.getSession().getAttribute("username");
			
			String query = "select * from items where name = \"" + itemname + "\"";
			//out.println(query);
			ResultSet result = stmt.executeQuery(query);
			ResultSetMetaData resultMetaData = result.getMetaData();
			result.next();
			
			out.println("<h1 style='font-size:30px'><strong>" + itemname + "</strong></h1>");
			//out.println("<br>");
			out.println("<h3 style='font-size:22px'><strong> Current Price: $" + result.getString(8) + "</strong></h3>");
			
			out.println("<form action='BidPage.jsp'>");
			out.println("<input type='submit' style='font-size:15px;height:30px;width:100px' value='Place Bid'>");
			out.println("</form>");
			out.println("<br>");
			
			
			// ITEM DETAILS
			out.println("<table>");
			out.println("<tr>");
	        out.println("<td><strong> Item ID </strong></td><td><p>" + result.getString(1)+"</p></td>");
	        out.println("</tr>");
	        
	        out.println("<tr>");
	        out.println("<td><strong> Name </strong></td><td><p>" + result.getString(2)+"</p></td>");
	        out.println("</tr>");
	        
	        out.println("<tr>");
	        out.println("<td><strong> Category: </strong></td><td><p>" + result.getString(3)+"</p></td>");
	        out.println("</tr>");
	        
	        out.println("<tr>");
	        out.println("<td><strong> Description </strong</td><td><p>" + result.getString(4)+"</p></td>");
	        out.println("</tr>");
	        
	        out.println("<tr>");
	        out.println("<td><strong> Seller </strong></td><td><p>" + result.getString(5)+"</p></td>");
	        out.println("</tr>");
	        
	        out.println("<tr>");
	        out.println("<td><strong> Starting Bid <strong></td><td><p>$" + result.getString(6)+"</p></td>");
	        out.println("</tr>");
	        
	        out.println("<tr>");
	        out.println("<td><strong> Bid Increment </strong</td><td><p>$" + result.getString(7)+"</p></td>");
	        out.println("</tr>");
	        
	        out.println("<tr>");
	        out.println("<td><strong> Sell-By Date </strong></td><td><p>" + result.getString(9)+"</p></td>");
	        out.println("</tr>");
			/*
			for (int i = 1; i <= resultMetaData.getColumnCount(); i++) {
				out.println("<tr>");
				String columnName = resultMetaData.getColumnName(i);
				String columnValue = resultMetaData.getColumnName(i);
		        out.println("<td>"+ columnName +"</td><td><p>" + columnValue+"</p></td>");
		        out.println("</tr>");
			}
    		*/
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			
		}
%>

</body></center>
</html>