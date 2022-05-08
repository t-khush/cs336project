<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Edit Account</title>
</head>
<style>
		h1 {margin-top: 0px;}
		a:link {color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover{color: black; text-decoration: underline;}
	</style>
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="CustomerRepHomeJava.jsp"> BuyMe </a> </strong></h1></div>
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
			String oldUser = (String)request.getSession().getAttribute("user");
			String oldPass = (String)request.getSession().getAttribute("pass");
			
			String newUser = request.getParameter("edit_username");
			String newPass = request.getParameter("edit_password");
			String newConfirmPass = request.getParameter("edit_confirm_password");
			
			if (oldUser.equals(newUser)) {
    			String insert = "update user set password = ? where username = ?";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setString(1, newPass);
				ps.setString(2, newUser);
				ps.executeUpdate();
				out.print("Account Edited!");
    		}
			else {
				if (!newPass.equals(newConfirmPass)) {
					out.println("Passwords don't match");
				}
				else {
					String query = "select * from user where username = \"" + newUser + "\"";
			        ResultSet result = stmt.executeQuery(query);
			        boolean inDb = result.first();
			        if(inDb) {
			    		out.print("Username is already taken. Please try a different username.");
			        }
			        else if (!inDb){
			        	if(newUser.trim().equals("") || newPass.trim().equals("")){
			        		out.print("Cannot have a blank username or password");
			        	}
			        	else { 
			        		String insert = "update user set username = ?, password = ? where username = ?";
							PreparedStatement ps = con.prepareStatement(insert);
							ps.setString(1, newUser);
							ps.setString(2, newPass);
							ps.setString(3, oldUser);
							ps.executeUpdate();
			        		
							
			        	out.print("Account Edited!");
			        	}
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
	<form action="AccountList.jsp">
		<input type="submit" value="View Accounts">
	</form>
</body></center>
</html>