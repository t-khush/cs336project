<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
	<%@ page import="java.io.*,java.util.*,java.sql.*"%>
	<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>BuyMe: Register</title>
		</head>
		<h1 style="font-size:30px"><strong> BuyMe </strong></h1>
		<center><body>
			<p style="font-size:20px"><strong> Register </strong></p>
			<br>
			<form method="get" action="RegisterJava.jsp">
			<table>
				<tr>    
					<td>New Username: </td><td><input type="text" name="new_username"></td>
				</tr>
				<tr>
					<td>New Password: </td><td><input type="password" name="new_password"></td>
				</tr>
				<tr>
					<td>Confirm Password: </td><td><input type="password" name="confirm_new_password"></td>
				</tr>
			</table>
			<input type="submit" value="Register">
		</form>
	<br>
	</body></center>
	</html>