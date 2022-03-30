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
						<td>New Username: </td><td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>New Password: </td><td><input type="password" name="password"></td>
					</tr>
				</table>
				<input type="submit" value="Sign Up">
			</table>
		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String user = request.getParameter("username");
			String pass = request.getParameter("password");
			

			//Make an insert statement for the Sells table:
			String insert = "INSERT INTO bars(name)"
					+ "VALUES (?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			//ps.setString(1, newBar);
			//ps.executeUpdate();
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
		%>
		
	</body></center>
	</html>