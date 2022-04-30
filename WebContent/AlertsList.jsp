<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import = "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe: Alert List</title>
</head>
<style>
		h1 {margin-top: 0px; font-size:30px;}
		a:link { color: black; text-decoration: none;}
		a:visited {color: black; text-decoration: none;}
		a:hover {color: black; text-decoration: underline;}
		table {border-collapse: collapse; width: 60%}
		td { border: 1px solid #dddddd; text-align: center; padding: 11px;}
		tr:nth-child(even) { background-color: #dddddd;}
	</style>
	<div class="h1"><h1><a href="LoginSuccess.jsp"> BuyMe </a></h1></div>
<center><body>	
<h1 style="font-size:25px"><strong> Alert List</strong></h1>
<br></br>
		<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//ResultSetMetaData metaData = result.getMetaData();
			String user = request.getSession().getAttribute("username").toString();
			String query = "select * from alerts where username = '" + user + "' order by alert_id desc";
	        ResultSet result = stmt.executeQuery(query);
	        
	        out.println("<form action='Alert.jsp'>");
	        out.println("<table>");
	        
    		int size= 0;  
    		if (!result.next()) {  
    		  out.println("<h3 style='font-size:25px'><strong> No Alerts yet!</strong></h3>");
    		}
    		else {
    			out.println("<tr>");
    	        out.println("<td><strong><u><big>Alerts</big></u></strong></td>");
        		out.println("</tr>");
        		int i = 1;
        		result.beforeFirst();
    	        while(result.next()) {
    	        	String message = result.getString(3);
	        		String preview = "";
	        		if (message.length() > 15) {
	        			preview = message.substring(0,10) + "...";
	        		}
	        		else {
	        			preview = message;
	        		}
    	        	if (i % 2 != 0) {
    	        		out.println("<tr>");
    	        		out.println("<td><a style='font-size:18px' href='Alert.jsp?num2="+ i + "'>" + preview + "</a></td>");
    		        	request.getSession().setAttribute("selectedAlertID"+i, result.getString(1));
    		        	request.getSession().setAttribute("selectedAlertItemID"+i, result.getString(2));
    			        request.getSession().setAttribute("selectedAlertMessage"+i, message);
    			        
    	        		out.println("</tr>");
    	        	}
    	        	else {
    	        		out.println("<tr>");
    	        		out.println("<td><a style='font-size:18px' href='Alert.jsp?num2="+ i + "'>" + preview + "</a></td>");
    		        	request.getSession().setAttribute("selectedAlertID"+i, result.getString(1));
    		        	request.getSession().setAttribute("selectedAlertItemID"+i, result.getString(2));
    			        request.getSession().setAttribute("selectedAlertMessage"+i, message);
    	        		out.println("</tr>");
    	        	}
    	        	i++;
    	        }
    	        out.println("<table>");
    	        out.println("</form>");
    		}
	        
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("insert failed");
		}
	%>
	<form action="LoginSuccess.jsp">
		<input type=hidden style="font-size:15px;height:30px;width:200px" value="Go back to main page">
	</form>
	<br><br>
	<form action="LoginSuccess.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:200px" value="Go back to main page">
	</form>

<br><br>

<br></br>
</body></center>
</html>