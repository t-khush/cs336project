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
<title>BuyMe: User's Auction List</title>
</head>
<style>
		h1 {margin-top: 0px; font-size:30px;}
		a:link { color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover {color: black; text-decoration: underline;}
		table {border-collapse: collapse; width: 60%}
		td { border: 1px solid #dddddd; text-align: center; padding: 11px;}
		tr:nth-child(even) { background-color: #dddddd;}
	</style>
	<div class="h1"><h1><a href="LoginSuccess.jsp"> BuyMe </a></h1></div>
<center><body>	
<br></br>
<br>
		<%
		try {
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String boughtOrSold = (String)request.getParameter("type_of_user");
			String user = (String)request.getParameter("searched_user");
			
			out.println("<h1 style='font-size:25px'><strong>" + user + "'s Items </strong></h1>");
			out.println("<br>");
			out.println("<form action='AuctionList.jsp'>");
			out.println("<input type='submit' style='font-size:15px;height:30px;width:125px' value='Reset'>");
			out.println("</form>");
			out.println("<br>");

			String verify = "select * from user where username = '" + user + "'";
			ResultSet verifyResult = stmt.executeQuery(verify);
	        boolean inDb = verifyResult.first();
	       
	        if(inDb) {
	        	//ResultSetMetaData metaData = result.getMetaData();
		        long millis=System.currentTimeMillis();
		        java.sql.Timestamp time = new java.sql.Timestamp(millis); 
	         	String currentTimeStamp = time.toString();
	         	
	         	String update = "UPDATE items SET bought = true WHERE ? >= sell_by_date";
			
	         	PreparedStatement ps = con.prepareStatement(update);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, currentTimeStamp);
				ps.executeUpdate();
				
				
				
				String query = "";
				if (boughtOrSold.equals("bid")) {
					query = "select items.name, bid_history.item_id, bid_history.bidder from bid_history, items where items.item_id = bid_history.item_id and bid_history.bidder = '" + user + "' group by bid_history.item_id";
				}
				else {
					query = "select name, item_id from items where username = '" + user + "'" ;
				}
				
		        ResultSet result = stmt.executeQuery(query);
	    
		        out.println("<form action='BuyPage.jsp'>");
		        out.println("<table>");
		        
	    		int size= 0;  
	    		if (!result.next()) {  
	    		  out.println("<h3 style='font-size:25px'><strong> No Items!</strong></h3>");
	    		}
	    		else {
	    			out.println("<tr>");
	    	        out.println("<td><strong><u><big>Items</big></u></strong></td>");
	        		out.println("</tr>");
	        		int i = 1;
	        		result.beforeFirst();
	    	        while(result.next()) {
	    	        	if (i % 2 != 0) {
	    	        		out.println("<tr>");
	    	        		out.println("<td><a style='font-size:18px' href='BuyPage.jsp?num="+ i + "'>" + result.getString(1) + "</a></td>");
	    		        	request.getSession().setAttribute("selectedItemID"+i, result.getString(2));
	    			        request.getSession().setAttribute("selectedItemName"+i, result.getString(1));
	    	        		out.println("</tr>");
	    	        	}
	    	        	else {
	    	        		out.println("<tr>");
	    	        		out.println("<td><a style='font-size:18px' href='BuyPage.jsp?num="+ i + "'>" + result.getString(1) + "</a></td>");
	    		        	request.getSession().setAttribute("selectedItemID"+i, result.getString(2));
	    			        request.getSession().setAttribute("selectedItemName"+i, result.getString(1));
	    	        		out.println("</tr>");
	    	        	}
	    	        	i++;
	    	        }
	    	        out.println("<table>");
	    	        out.println("</form>");
	    		}
		        
	        }
	        else{
	        	//out.print("Sign in failed. The username or password you entered is not correct.");
	        	out.println("The user you tried to search for does not exist.");
	        }
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("fail");
		}
	%>
	<form action="LoginSuccess.jsp">
		<input type=hidden style="font-size:15px;height:30px;width:200px" value="Go back to main page">
	</form>
	<br><br>
	<form action="LoginSuccess.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:200px" value="Go back to main page">
	</form>

<br><br>

<br></br>
</body></center>
</html>