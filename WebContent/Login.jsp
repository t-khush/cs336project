<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe: Login</title>
	</head>
	
	<style>
		h1 {margin-top: 0px;}
		a:link, a:visited {color: black; text-decoration: none;}
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="Home.jsp"> BuyMe </a> </strong></h1></div>
	
	<center><body>
		<h3 style="font-size:25px"><strong> Login </strong></h3>
		<form method="get" action="LoginJava.jsp">
			<table>
				<tr>    
					<td>Username: </td><td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password: </td><td><input type="password" name="password"></td>
				</tr>
			</table>
			<br>
			<input type="submit" style="font-size:15px;height:30px;width:100px" value="Login">
		</form>

	
</body></center>
</html>