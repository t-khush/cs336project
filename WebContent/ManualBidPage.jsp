<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Bid</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover {color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="LoginSuccess.jsp"> BuyMe </a> </strong></h1></div>
<center><body>	

<p style="font-size:20px">
<strong> Manual Bid on <%out.println(request.getSession().getAttribute("selectedItemName"
+ request.getSession().getAttribute("itemNum").toString())
+"\n with current bid being $"+request.getSession().getAttribute("currBid")); %> 
</strong></p>

<form action="ManualBidPageJava.jsp">
<input type="man_bid" id="man_bid" name="man_bid" placeholder="Place a Bid (without $ sign)" style="height: 20px; width: 230px">
<br></br>
<input type="submit" value="Place Manual Bid">
</form>
</body></center>
</html>