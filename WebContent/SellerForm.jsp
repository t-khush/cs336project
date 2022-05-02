<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Sell</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover {color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="LoginSuccess.jsp"> BuyMe </a> </strong></h1></div>
<center><body>	
<p style="font-size:20px"><strong> Sell an Item</strong></p>
<form action="SellerFormSuccess.jsp">
<select name = "category">
    <option value="" disabled="disabled" selected="selected">Select a category</option>
    <option value="phone" name = "phone">Phone</option>
    <option value="tablet" name = "tablet">Tablet</option>
    <option value="laptop" name = "laptop">Laptop</option>
</select>
<br><br>
<input type="item_name" id="item_name" name="item_name" placeholder="Item Name">
<p>
   <textarea name="item_desc" id="item_desc" style="height: 100px; width: 250px;" placeholder="Item Description (max. 300 characters)"></textarea>
</p>
<input type="init_bid" id="init_bid" name="init_bid" placeholder="Starting Bid Price (without $ sign)" style="height: 20px; width: 230px">
<input type="bid_inc" id="bid_inc" name="bid_inc" placeholder="Bid Increment Amount (without $ sign)" style="height: 20px; width: 230px">
<input type="res_price" id="res_price" name="res_price" placeholder="Reserve Price (without $ sign)" style="height: 20px; width: 230px">
<br><br>
Auction End Date & Time: <input type="datetime-local" id="dur_auction" name="dur_auction"/>
<br></br>
<input type="submit" style="font-size:15px;height:30px;width:200px" value="Place Item on Auction">
</form>
</body></center>
</html>