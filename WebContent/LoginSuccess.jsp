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
	<div class="h1"><h1 style="font-size:30px"><strong> <a href="LoginSuccess.jsp"> BuyMe </a> </strong></h1></div>
<center><body>
	<br>
	<%
	try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String username = (String)request.getSession().getAttribute("username");
		out.print("Welcome to BuyMe, " + username + "!");
        
		
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
	<br><br><br>
	<form action="AuctionList.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:200px" value="Buy">
	</form> 
	<br>
	or      
	<br><br>
	<form action="SellerForm.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:200px" value="Sell">
	</form>
	<br><br><br><br>
	<form action="AlertsList.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:200px" value="Alerts">
	</form>
	<br><br>
		<form action="QuestionsPage.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:200px" value="Questions">
	</form>
	<br></br><br></br><br></br><br></br>
	<form action="Home.jsp">
		<input type="submit" style="font-size:15px;height:30px;width:200px" value="Logout">
	</form>

</body></center>
</html>