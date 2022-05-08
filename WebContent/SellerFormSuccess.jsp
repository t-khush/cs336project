<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successfully Placed on Auction</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="LoginSuccess.jsp"> BuyMe </a> </strong></h1></div>
<center><body>	
<br></br>
<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get parameters from the HTML form at the index.jsp
			String username = (String)request.getSession().getAttribute("username");
			String category = (String)request.getParameter("category");
			String itemName = request.getParameter("item_name");
			String itemDesc = request.getParameter("item_desc");
			String initBid = request.getParameter("init_bid");
			String bidInc = request.getParameter("bid_inc");
			String durAuction = request.getParameter("dur_auction");
			String reservePrice = request.getParameter("res_price");
			 
			//Make an insert statement for the Sells table: 
			String insert = "INSERT INTO items(name, type, description, username, starting_bid, bid_increment, current_price, sell_by_date, reserve_price)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, itemName);
			ps.setString(2, category);
			ps.setString(3, itemDesc);
			ps.setString(4, username);
			ps.setString(5, initBid);
			ps.setString(6, bidInc);
			ps.setString(7, initBid);
			ps.setString(8, durAuction);
			ps.setString(9, reservePrice);
			ps.executeUpdate();
			out.print("Item set for auction!");
			
					
			// We need to find the item_id of the last item 
			String findItemIdQuery = "SELECT item_id FROM items WHERE name = '"+itemName+"' AND sell_by_date ='" + durAuction+"'"; 
			ResultSet findItemIdSet = stmt.executeQuery(findItemIdQuery); 
			findItemIdSet.next(); 
			String recentlyPostedItemId = (findItemIdSet.getString(1));
			
			// Send alert to users who are all interested in this item 
			String listOfUsersInterested = "SELECT username FROM user_interests WHERE type = '"+category+"'"; 
			ResultSet usersInterestedSet = stmt.executeQuery(listOfUsersInterested);
			
			while(usersInterestedSet.next()){
				String currentUsername = usersInterestedSet.getString(1); 
				String alertMessage = "A " + category+" you're interested in named " + itemName+" was just posted!"; 
				String alertTableInsertion = "INSERT INTO alerts(item_id, message, username) VALUES (?, ?, ?)"; 
				
				PreparedStatement alertPreparedStatement = con.prepareStatement(alertTableInsertion); 
				
				alertPreparedStatement.setString(1, recentlyPostedItemId); 
				alertPreparedStatement.setString(2, alertMessage); 
				alertPreparedStatement.setString(3, currentUsername); 
				System.out.println(alertPreparedStatement.toString()); 
				
				alertPreparedStatement.execute(); 
			}
; 			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
%>
<br></br>
<form action="AuctionList.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:200px" value="Go to Auction List">
	</form>
</body></center>
</html>