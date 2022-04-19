<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Register</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="Home.jsp"> BuyMe </a> </strong></h1></div>
<center><body>	
<br></br>
		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get parameters from the HTML form at the Register.jsp
			String user = request.getParameter("new_username");
			String pass = request.getParameter("new_password");
			String confirmPass = request.getParameter("confirm_new_password");
			if (!pass.equals(confirmPass)) {
				out.println("Passwords don't match");
			}
			else {
				String query = "select * from user where username = \"" + user + "\"";
		        ResultSet result = stmt.executeQuery(query);
		        boolean inDb = result.first();
		        if(inDb) {
		    		out.print("Username is already taken. Please try a different username.");
		        }
		        else if (!inDb){
		        	if(user.trim().equals("") || pass.trim().equals("")){
		        		out.print("Cannot have a blank username or password");
		        	}
		        	else {
		        	//Make an insert statement for the Sells table: 
					String insert = "INSERT INTO user(username, password)"
							+ "VALUES (?, ?)";
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement ps = con.prepareStatement(insert);

					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					ps.setString(1, user);
					ps.setString(2, pass);
					ps.executeUpdate();
		        	out.print("Sign up succeeded!");
		        	}
		        }
			}
			
				
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
	%>
	<br></br>
	<form action="Home.jsp">
		<input type="submit" value="Go back to main page">
	</form>
</body></center>
</html>