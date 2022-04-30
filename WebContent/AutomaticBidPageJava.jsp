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
		String autoBid = request.getParameter("auto_bid");
		String autoBidInc = request.getParameter("auto_bid_inc");
		String currBid = request.getSession().getAttribute("currBid").toString();
		String bidInc = request.getSession().getAttribute("bidInc").toString();
		String itemNum = (String)request.getSession().getAttribute("itemNum");
		String itemName = request.getSession().getAttribute("selectedItemName" + itemNum).toString();
		String itemID = request.getSession().getAttribute("selectedItemID" + itemNum).toString();
		String bidder = request.getSession().getAttribute("username").toString();

		
		if(Float.parseFloat(autoBidInc) < Float.parseFloat(bidInc)){
			out.println("Cannot make your bid increment lower than the set bid increment amount.");
			out.println("<a href='AutomaticBidPage.jsp'>");
			out.println("<br><br><input type='button' value='Back'/>");
			out.println("</a>");
		}
		
		else{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			String bidHistoryUpdate = "INSERT INTO automatic_bid (item_id, bidder, maximum_bid, bid_increment) VALUES (?, ?, ?, ?)";
			PreparedStatement updatePs = con.prepareStatement(bidHistoryUpdate);
			updatePs.setString(1, itemID); 
			updatePs.setString(2, bidder); 
			updatePs.setString(3, autoBid);
			updatePs.setString(4, autoBidInc);
			updatePs.executeUpdate();
			out.println("Your automatic bid has been saved. Return to item listing");
			out.println("<a href='BuyPage.jsp?num=" + request.getSession().getAttribute("itemNum").toString() + "'>");
			out.println("<br><br><input type='button' value='Back to Item'/>");
			out.println("</a>");
			
			con.close(); 
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Exception thrown");
	}
%>
</body></center>
</html>