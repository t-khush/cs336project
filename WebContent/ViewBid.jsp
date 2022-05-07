<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Bid History</title>
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
	<%
		try {
			

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String username = (String)request.getSession().getAttribute("username");
			String checkIfUserIsCustomerRepQuery = "select * from customer_reps where customer_rep_name = '" + username + "'";
			ResultSet checkIfUserIsCustomerRepResults = stmt.executeQuery(checkIfUserIsCustomerRepQuery);
			if (checkIfUserIsCustomerRepResults.next()) {
				out.println("<div class='h1'><h1><a href='CustomerRepHomePage.jsp'> BuyMe </a></h1></div>");
			}
			else {
				out.println("<div class='h1'><h1><a href='LoginSuccess.jsp'> BuyMe </a></h1></div>");
			}
			out.println("<center><bid>");
			String num = request.getParameter("num");
			String bidder = (String)request.getSession().getAttribute("selectedBidder" + num);
			request.getSession().setAttribute("bidder", bidder);
			String bid = (String)request.getSession().getAttribute("selectedBidAmount"+num);
			request.getSession().setAttribute("bid", bid);
			String itemID = (String)request.getSession().getAttribute("itemid");
			request.getSession().setAttribute("itemid", itemID);
			//out.println("hello");
			
			out.println("<h1 style='font-size:30px'><strong> Bid </strong></h1>");
			
			checkIfUserIsCustomerRepResults.beforeFirst();
			if (checkIfUserIsCustomerRepResults.next()) {
				out.println("<form style='text:align=center' action='RemoveBidJava.jsp'>");
				out.println("<input type='submit' style='font-size:15px;height:30px;width:200px' value='Remove Bid'>");
				out.println("</form>");
			}
			
			out.println("<br>");
			// ITEM DETAILS
			out.println("<table>");
			out.println("<tr>");
	        out.println("<td><strong> Bidder </strong></td><td><strong> Bid </strong></td>");
	        out.println("</tr>");
	        out.println("<tr>");
       		out.println("<td><p> " + bidder + "</p></td><td><p>" + bid +"</p></td>");
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