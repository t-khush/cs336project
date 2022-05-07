<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Sales Reports</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="AdminDashboard.jsp"> BuyMe </a> </strong></h1></div>
<center><body>
<br>
<h3 style="font-size:26px"><strong> Generate Sales Reports for: </strong></h1>
<br><br><br>
<form action="TotalEarnings.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Total Earnings">
</form> 
<br>
<br>
<form action="EarningsPerItem.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Earnings per Item">
</form>
<br>
<form action="EarningsPerItemType.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Earnings per Item Type">
</form>
<br>
<form action="EarningsPerEndUser.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Earnings per End-User">
</form>
<br><br>
<form action="BestSellingItems.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Best-Selling Items">
</form>
<br><br>
	<form action="BestBuyers.jsp">
	<input type="submit" style="font-size:15px;height:30px;width:200px" value="Best Buyers">
</form>
</body></center>
</html>