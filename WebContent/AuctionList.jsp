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
<title>BuyMe: Auction List</title>
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
<h1 style="font-size:25px"><strong> Auction List</strong></h1>
<br></br>
<div class='button-container'>
<form style='text:align=center' action="FilterPage.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:75px" value="Filter">
</form>
<br>
<form style='text:align=center' action="FilterPageHightoLow.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Sort Price: High to Low">
</form>
<br>
<form style='text:align=center' action="FilterPageLowtoHigh.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Sort Price: Low to High">
</form>
<br>
<form style='text:align=center' action="SearchUsers.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Search Users">
</form>
</div>

<!-- 	            out.println("<div class='button-container'>");
	            out.println("<form style='text:align=center' action='ManualBidPage.jsp'>");
	            out.println("<input type='submit' style='font-size:15px;height:30px;width:150px' value='Place Manual Bid'>");
	            out.println("</form>");

	    		out.println("<form style='text:align=center' action='BidHistoryPage.jsp'>");
	            out.println("<input type='submit' style='font-size:15px;height:30px;width:150px' value='View Bid History'>");
	            out.println("</form>");
	            
	            // Place Automatic Bid Button
	            out.println("<form style='text:align=center' action='AutomaticBidPage.jsp'>");
	            out.println("<input type='submit' style='font-size:15px;height:30px;width:150px' value='Place Automatic Bid'>");
	            out.println("</form>");
	            out.println("</div>"); -->
<br>
		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//ResultSetMetaData metaData = result.getMetaData();
	        long millis=System.currentTimeMillis();
	        java.sql.Timestamp time = new java.sql.Timestamp(millis); 
         	String currentTimeStamp = time.toString();
         	
         	String update = "UPDATE items SET bought = true WHERE ? >= sell_by_date";
		
         	PreparedStatement ps = con.prepareStatement(update);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, currentTimeStamp);
			ps.executeUpdate();
			

			
			// Alerts 
			// Alert users who have successfully sold an item 
			
			String username = (String)request.getSession().getAttribute("username");
			String soldItemQuery = "SELECT item_id, name FROM items WHERE bought = TRUE AND username = '" + username + "'"; // Query for items sold by logged in user
			ResultSet soldItemResults = stmt.executeQuery(soldItemQuery);
			while(soldItemResults.next()){
				
				//Let's check if the item has a reserve price. If it does, let's check if the last bid price is OVER the reserve price. 
				String getReservePrice = "SELECT reserve_price FROM items WHERE item_id = "+soldItemResults.getString(1); 
			
				Statement stmt3 = con.createStatement(); 
				ResultSet getReservePriceResult = stmt3.executeQuery(getReservePrice); 
				if(getReservePriceResult.next() && getReservePriceResult.getString(1)!=null){
					float price = Float.parseFloat(getReservePriceResult.getString(1)); 
					String lastBidPriceQuery = "SELECT current_bid FROM bid_history WHERE item_id = " + soldItemResults.getString(1)+ " order by current_bid desc limit 1";
					ResultSet lastBidPriceResult = stmt3.executeQuery(lastBidPriceQuery); 
					if(lastBidPriceResult.next()){
						float lastBid = Float.parseFloat(lastBidPriceResult.getString(1)); 
						if(lastBid<price){
							continue; 
						}
					}
				}
				String itemSoldToSomeoneQuery = "SELECT bidder FROM bid_history WHERE item_id = " + soldItemResults.getString(1)+ " order by current_bid desc limit 1";
				ResultSet itemSoldResult = stmt3.executeQuery(itemSoldToSomeoneQuery); 
				if(itemSoldResult.next() && itemSoldResult.getString(1)!=null){
				String alertString = "Your item named " + soldItemResults.getString(2)+ " was sold."; 
					String alertInsertForSoldItem = "INSERT IGNORE INTO alerts(item_id, message, username) VALUES (?, ?, ?)";
					PreparedStatement soldItemAlert = con.prepareStatement(alertInsertForSoldItem);
					soldItemAlert.setString(1, soldItemResults.getString(1));
					soldItemAlert.setString(2, alertString); 
					soldItemAlert.setString(3, username); 
					soldItemAlert.executeUpdate();
				}
			}
			
			// Alert users who have successfully bought an item
			// Find all item ids, iterate through them and add alerts 
			String allBoughtItems = "SELECT item_id, name FROM items WHERE bought = TRUE"; 
			ResultSet allBoughtItemsResult = stmt.executeQuery(allBoughtItems);
			Statement stmt2 = con.createStatement();
			while(allBoughtItemsResult.next()){
				String boughtString = "You successfully bought " + allBoughtItemsResult.getString(2) + "."; 
				String findTheBuyer = "select bidder from bid_history where item_id = " + allBoughtItemsResult.getString(1)+ " order by current_bid desc limit 1"; 
				ResultSet buyerOfItem = stmt2.executeQuery(findTheBuyer);
				
				Statement stmt4 = con.createStatement(); 
				String getReservePrice2 = "SELECT reserve_price FROM items WHERE item_id = "+allBoughtItemsResult.getString(1); 
				ResultSet getReservePriceResult2 = stmt4.executeQuery(getReservePrice2); 
				if(getReservePriceResult2.next() && getReservePriceResult2.getString(1)!=null){
					float price = Float.parseFloat(getReservePriceResult2.getString(1)); 
					String lastBidPriceQuery = "SELECT current_bid FROM bid_history WHERE item_id = " + soldItemResults.getString(1)+ " order by current_bid desc limit 1";
					ResultSet lastBidPriceResult = stmt4.executeQuery(lastBidPriceQuery); 
					if(lastBidPriceResult.next()){
						float lastBid = Float.parseFloat(lastBidPriceResult.getString(1)); 
						if(lastBid<price){
							continue; 
						}
					}
				}
				
				if(buyerOfItem.next()){
					String boughtItemAlert = "INSERT IGNORE INTO alerts(item_id, message, username) VALUES (?, ?, ?)";
					PreparedStatement boughtItemAlertStatement = con.prepareStatement(boughtItemAlert);
					
					boughtItemAlertStatement.setString(1, allBoughtItemsResult.getString(1));
					boughtItemAlertStatement.setString(2, boughtString); 
					boughtItemAlertStatement.setString(3, buyerOfItem.getString(1)); 
					
					boughtItemAlertStatement.executeUpdate(); 
	
				}
				
			}
			
			// Alert users if a person bids on an item they're bidding on 
			String allUnboughtItems = "SELECT item_id, name FROM items WHERE bought is not TRUE"; 
			ResultSet allUnboughtItemsResult = stmt.executeQuery(allUnboughtItems);
			while(allUnboughtItemsResult.next()){
	
				// Check if another user bid on this item in bid_history 
				// and bid a higher price than the current price bid by the user logged in 
				String getUsersLastBid = "SELECT current_bid FROM bid_history WHERE bidder = '" + username + "' AND item_id = " + allUnboughtItemsResult.getString(1) + " order by current_bid desc limit 1"; 
				ResultSet getMyLastBid = stmt2.executeQuery(getUsersLastBid); 
				if(getMyLastBid.next()){
					float myLastBidFloat = Float.parseFloat(getMyLastBid.getString(1)); 
					// Now let's check if someone else bid higher than me 
					String getHigherBid = "SELECT current_bid FROM bid_history WHERE bidder != '" + username + "' AND current_bid > " + myLastBidFloat + " AND item_id = " + allUnboughtItemsResult.getString(1) + " order by current_bid desc limit 1";
					ResultSet checkForHigherBids = stmt2.executeQuery(getHigherBid); 
					if(checkForHigherBids.next()){
						String higherBidAlertMessage = "A user bid higher than you on " +  allUnboughtItemsResult.getString(2); 
						String higherBidAlert = "INSERT IGNORE INTO alerts(item_id, message, username) VALUES (?, ?, ?)";
						PreparedStatement higherBidAlertStatement = con.prepareStatement(higherBidAlert);
						
						higherBidAlertStatement.setString(1, allUnboughtItemsResult.getString(1));
						higherBidAlertStatement.setString(2, higherBidAlertMessage); 
						higherBidAlertStatement.setString(3, username); 
						
						higherBidAlertStatement.executeUpdate(); 

					}

				}
			}
			
			
			
			String query = "select name, item_id from items where bought is not true";
	        ResultSet result = stmt.executeQuery(query);
    
	        out.println("<form action='BuyPage.jsp'>");
	        out.println("<table>");
	        
    		int size= 0;  
    		if (!result.next()) {  
    		  out.println("<h3 style='font-size:25px'><strong> No Items for Auction Yet!</strong></h3>");
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
	        
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
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