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
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:28px"><strong> <a href="LoginSuccess.jsp"> BuyMe </a> </strong></h1></div>
<center><body>	
<p style="font-size:20px"><strong> Sell an Item</strong></p>
<select>
    <option value="" disabled="disabled" selected="selected">Select a category</option>
    <option value="phone">Phone</option>
    <option value="tablet">Tablet</option>
    <option value="laptop">Laptop</option>
</select>
<br><br>
<input type="item_name" id="item_name" name="item_name" placeholder="Item Name">
<p>
   <textarea name="item_desc" id="item_desc" style="height: 100px; width: 250px;" placeholder="Item Description"></textarea>
</p>
<input type="init_bid" id="init_bid" name="init_bid" placeholder="Starting Bid Price">
<input type="bid_inc" id="bid_inc" name="bid_inc" placeholder="Bid Increment Amount">


		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			
				
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
	%>
	<br></br>
	<form action="SellerFormSuccess.jsp">
			<input type="submit" value="Place Item on Auction">
	</form>
</body></center>
</html>