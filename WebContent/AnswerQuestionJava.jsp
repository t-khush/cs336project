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
			
			String username = (String)request.getSession().getAttribute("username");

			
			String num = (String)request.getSession().getAttribute("questionNum");
			String reply = request.getParameter("answer_question");
			String query = "select customer_rep_id from customer_reps where customer_rep_name = '" + username + "'";
			ResultSet customerRepIDResult = stmt.executeQuery(query);
			customerRepIDResult.next();
			String customerRepID = customerRepIDResult.getString(1);
			String questionID = (String)request.getSession().getAttribute("selectedQuestionID"+num);
			System.out.println(reply);
			System.out.println();
			System.out.println(customerRepID);
			System.out.println();
			System.out.println(questionID);
			
			String insert = "INSERT INTO replys(reply, customer_rep_id, question_id)"
					+ "VALUES (?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, reply);
			ps.setString(2, customerRepID);
			ps.setString(3, questionID);
			ps.executeUpdate();
			
			/*
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
			}*/
			out.print("Answer Submitted!");
				
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
	%>
	<br></br>
	<form action="QuestionsPage.jsp">
		<input type="submit" value="Go back to Questions">
	</form>
</body></center>
</html>