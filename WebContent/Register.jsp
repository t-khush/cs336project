<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Register</title>
	</head>
	
	<center><body>

		<p style="font-size:30px"><strong> Register </strong></p>

		<br></br>
		
		<table>
				<tr>    
					<td>New Username: </td><td><input type="text" name="barvalia"></td>
				</tr>
				<tr>
					<td>New Password: </td><td><input type="password" name="beer"></td>
				</tr>
			</table>
			<input type="submit" value="Sign Up">
		</table>
	
</body></center>
</html>