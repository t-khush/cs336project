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
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> BuyMe </strong></h1></div>
	
	<center><body>
		<p style="font-size:20px"><strong> Login </strong></p>
		<br>
		<form method="get" action="LoginJava.jsp">
			<table>
				<tr>    
					<td>Username: </td><td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password: </td><td><input type="password" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="Login">
		</form>

	
</body></center>
</html>