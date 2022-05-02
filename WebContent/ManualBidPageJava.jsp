<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Bid Status</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link, a:visited {color: black; text-decoration: none;}
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:28px"><strong> <a href="LoginSuccess.jsp"> BuyMe </a> </strong></h1></div>
<center><body>	
<br></br>
<%
	try {

		//Get parameters from the HTML form at the index.jsp
		String manBid = request.getParameter("man_bid");
		String currBid = request.getSession().getAttribute("currBid").toString();
		String bidInc = request.getSession().getAttribute("bidInc").toString();		
		String itemNum = (String)request.getSession().getAttribute("itemNum");
		String itemName = request.getSession().getAttribute("selectedItemName" + itemNum).toString();
		String itemID = request.getSession().getAttribute("selectedItemID" + itemNum).toString();
		String seller = request.getSession().getAttribute("seller").toString();
		String buyer = request.getSession().getAttribute("username").toString();
		
		if(Float.parseFloat(manBid) < Float.parseFloat(currBid)){
			out.println("Cannot place a bid lower than the current highest bid.");
			out.println("<a href='ManualBidPage.jsp'>");
			out.println("<br><br><input type='button' value='Back'/>");
			out.println("</a>");
		}
		else if(Float.parseFloat(manBid) - Float.parseFloat(currBid) < Float.parseFloat(bidInc)){
			out.println("Cannot place a bid lower than the bid increment amount.");
			out.println("<a href='ManualBidPage.jsp'>");
			out.println("<br><br><input type='button' value='Back'/>");
			out.println("</a>");
		}
		else if(Float.parseFloat(manBid) - Float.parseFloat(currBid) >= Float.parseFloat(bidInc)) {
			
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			//Get parameters from the HTML form at the index.jsp
			
			//Make an insert statement for the Sells table: 
			String updateBid = "update items set current_price = ? where item_id = ?";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(updateBid);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, manBid);
			ps.setString(2, itemID);
			ps.executeUpdate();
			out.println("Your bid of $" + manBid + " was successfully placed for " + itemName + "!");
			out.println("<a href='BuyPage.jsp?num=" + request.getSession().getAttribute("itemNum").toString() + "'>");
			out.println("<br><br><input type='button' value='Back to Item'/>");
			out.println("</a>");
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			
			String bidHistoryUpdate = "INSERT INTO bid_history (item_id, current_bid, bidder) VALUES (?, ?, ?)";
			PreparedStatement updatePs = con.prepareStatement(bidHistoryUpdate);
			updatePs.setString(1, itemID);
			updatePs.setString(2, manBid);
			updatePs.setString(3, buyer);
			updatePs.executeUpdate();
			
			// Check if there's an automatic bid on the item we're looking at
			String checkForAutomaticbid = "SELECT maximum_bid, bidder FROM automatic_bid WHERE item_id = " + itemID; 
			ResultSet automaticBidCheck = stmt.executeQuery(checkForAutomaticbid); 
			if(automaticBidCheck.next()){
				// At this point we know there'a an automatic bid on the same item a user is manually bidding on. 
				// Check if manual bid exceeds the upper limit of automatic bid 
				if(Float.parseFloat(manBid) > Float.parseFloat(automaticBidCheck.getString(1))){
					String alertMsg = "A user bid higher than your maximum bid cap on the item " + itemName; 
					String alertForAutoBidder = "INSERT IGNORE INTO alerts(item_id, message, username) VALUES (?, ?, ?)";
					PreparedStatement preparedStatement = con.prepareStatement(alertForAutoBidder); 
					preparedStatement.setString(1, itemID); 
					preparedStatement.setString(2, alertMsg); 
					preparedStatement.setString(3, automaticBidCheck.getString(2)); 
					preparedStatement.executeUpdate(); 

				}
			}
			con.close();
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Exception thrown");
	}
%>
</body></center>
</html>