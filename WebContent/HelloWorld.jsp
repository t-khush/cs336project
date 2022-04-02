<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe</title>
	</head>
	
	<center><body>

		<p style="font-size:30px"><strong> BuyMe </strong></p>
		<!-- out.println("Hello! Welcome to BuyMe!"); output the same thing, but using 
	                                      jsp programming -->
							  
	
		 <!-- Show html form to i) display something, ii) choose an action via a 
		  | radio button -->
		<!-- forms are used to collect user input 
			The default method when submitting form data is GET.
			However, when GET is used, the submitted form data will be visible in the page address field-->
		
		
		
	
	<form action="Login.jsp">
		<input type="submit" style="font-size:15px;height:200px;width:200px" value="Login">
	</form>
	<br>
	<!-- 
	<br>
		<form method="get" action="sellsNewBeer.jsp">
			<table>
				<tr>    
					<td>Username: </td><td><input type="text" name="barvalia"></td>
				</tr>
				<tr>
					<td>Password: </td><td><input type="password" name="beer"></td>
				</tr>
			</table>
			<input type="submit" value="Login">
		</form>
	<br> -->
	or
	<br>
	<br>
	<form action="Register.jsp"><input type="submit" style="font-size:15px;height:200px;width:200px" value="Register"></form>
	<!--
	<br>
		<form method="post" action="newBarBeerPrice.jsp">
		<table>
		<tr>    
		<td>New Username: </td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>New Password: </td><td><input type="password" name="password"></td>
		</tr>
		</table>
		<input type="submit" value="Register">
		</form>
	<br> -->
	
	
	<!--  
	Or we can query the beers with price:
	<br>
		<form method="get" action="query.jsp">
			<select name="price" size=1>
				<option value="3.0">$3.0 and under</option>
				<option value="5.0">$5.0 and under</option>
				<option value="8.0">$8.0 and under</option>
			</select>&nbsp;<br> <input type="submit" value="submit">
		</form>
	<br>
	-->
</body></center>
</html>