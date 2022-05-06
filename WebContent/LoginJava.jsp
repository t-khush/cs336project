<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Status</title>
</head>
<center><body>	
<br></br>
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		request.getSession().setAttribute("username", username);
		String query = "select * from user where username = \"" + username + "\" and " + "password = \"" + password + "\"";
		
        ResultSet result = stmt.executeQuery(query);
        boolean inDb = result.first();
       
        if(inDb) {
        	request.getSession().setAttribute("userisCustomerRep", "false");
    		response.sendRedirect("LoginSuccess.jsp");
        }
        else{
        	// check if user is a customer rep
			Statement stmt2 = con.createStatement();
        	String customerRepQuery = "select * from customer_reps where customer_rep_name = '" + username + "'";
        	ResultSet customerRepQueryResult = stmt2.executeQuery(customerRepQuery);
        	if (result.first()) {
        		request.getSession().setAttribute("userisCustomerRep", "true");
        		response.sendRedirect("CustomerRepHomePage.jsp");
        	}
        	else {
        		response.sendRedirect("LoginFailed.jsp");
        	}
        	
        }
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("query failed");
	}
%>
</body></center>
</html>