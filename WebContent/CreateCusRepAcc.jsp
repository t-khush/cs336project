<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Login Success</title>
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
<h1 style="font-size:25px"><strong> Create a Customer Representative Account </strong></h1>
<br>

<form action="CustomerRepRegisterJava.jsp">
			<table>
				<tr>    
					<td>Customer Representative Username: </td><td><input type="text" name="cus_rep_username"></td>
				</tr>
				<tr>
					<td>Customer Representative Password: </td><td><input type="password" name="cus_rep_password"></td>
				</tr>
				<tr>
					<td>Customer Representative Confirm Password: </td><td><input type="password" name="confirm_cus_rep_password"></td>
				</tr>
			</table>
			<br>
			<input type="submit" style="font-size:15px;height:30px;width:100px" value="Register">
		</form>

</body></center>
</html>