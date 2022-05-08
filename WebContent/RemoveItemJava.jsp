<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Remove Item</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="CustomerRepHomePage.jsp"> BuyMe </a> </strong></h1></div>
<center><body>	
<br></br>
		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get parameters from the HTML form at the Register.jsp
			String itemid = (String)request.getSession().getAttribute("itemid");
			String itemName = (String)request.getSession().getAttribute("itemName");
			
			String delete1 = "delete from alerts where item_id = ?";
			PreparedStatement ps1 = con.prepareStatement(delete1);
			ps1.setString(1, itemid);
			ps1.executeUpdate();
			
			String delete3 = "delete from bid_history where item_id = ?";
			PreparedStatement ps3 = con.prepareStatement(delete3);
			ps3.setString(1, itemid);
			ps3.executeUpdate();
			
			String delete4 = "delete from automatic_bid where item_id = ?";
			PreparedStatement ps4 = con.prepareStatement(delete4);
			ps4.setString(1, itemid);
			ps4.executeUpdate();
			
			String delete2 = "delete from items where item_id = ?";
			PreparedStatement ps2 = con.prepareStatement(delete2);
			ps2.setString(1, itemid);
			ps2.executeUpdate();
			
			
			
				
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			
			out.println("Removed " + itemName);
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
	%>
	<br></br>
	<form action="AuctionList.jsp">
		<input type="submit" value="View Items">
	</form>
</body></center>
</html>