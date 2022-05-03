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
<title>BuyMe: Interested</title>
</head>
<style>
		h1 {margin-top: 0px; font-size:30px;}
		a:link { color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover {color: black; text-decoration: underline;}
		
	</style>
	<div class="h1"><h1><a href="LoginSuccess.jsp"> BuyMe </a></h1></div>
<center><body>	
<h1 style="font-size:25px"><strong> Set an Alert</strong></h1>
<h3 style="font-size:18px"><strong> What items are you interested in?</strong></h3>
<form action="InterestedPageJava.jsp">
	<table>
	<tr>    
		<td><input type="checkbox" id="phone" name="typeOfDevice" value="phone"></td><td><label> Phones</label></td>
	</tr>

	<tr>
		<td><input type="checkbox" id="laptop" name="typeOfDevice" value="laptop"></td><td><label> Laptops</label></td>
	</tr>

	<tr>
		<td> <input type="checkbox" id="tablet" name="typeOfDevice" value="tablet"></td><td><label> Tablets</label></td>
	</tr>
	</table>
	<br>
  <input type="submit" style="font-size:15px;height:30px;width:100px" value="Set Alert">
</form>

</body></center>
</html>r