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
<title>BuyMe: Filter</title>
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
<form action="FilterAuctionList.jsp">
<select name = 'category'>
<option value='' disabled='disabled' selected='selected'>Select a category</option>
	<option value="allItems" name = 'allItems'>All Items</option>
	<option value='phone' name = 'phone'>Phone</option>
	<option value='tablet' name = 'tablet'>Tablet</option>
	<option value='laptop' name = 'laptop'>Laptop</option>
</select>
<br><br>
<input type='filter_min_price' id='filter_min_price' name='filter_min_price' placeholder='Minimum Price (without $ sign) - optional' style='height: 20px; width: 275px'>
<input type='filter_max_price' id='filter_max_price' name='filter_max_price' placeholder='Maximum Price (without $ sign) - optional' style='height: 20px; width: 275px'>
<br><br>
	<input type="submit" style="font-size:15px;height:30px;width:75px" value="Filter">
</form>

</body></center>
</html>