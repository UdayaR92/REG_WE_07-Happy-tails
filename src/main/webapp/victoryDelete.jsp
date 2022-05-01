<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
input[type=text], select {
  width: 90%;
  font-size:20px;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=date], select {
  width: 90%;
  font-size:20px;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=number], select {
  width: 90%;
  font-size:20px;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=submit] {
  width: 90%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size:30px;
  width:300px;
  height:50px;
}



input[type=submit]:hover {
  background-color: red;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  margin-left:20cm;
  width:300px;
  height:50px;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}
.button1:hover {
  background-color: #cc0000;
  color: white;
}


</style>	
 
<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="victoryCss/victory.css">
	<link rel="stylesheet" type="text/css" href="victoryCss/styles.css">
	<link rel="stylesheet" type="text/css" href="victoryCss/header.css">
		<script src = "victoryJs/victory.js"></script>
	
	
 
 <title> Delete victory log </title>
 
 <header>	
 
		<hr>

<ul class="one" position=fixed;>

<li><lable style="font-size:30px;">HAPPY TAILS</lable></li>
<li><a href="#">HOME</a></li>
<li><a href="#">MEMBERS</a></li>
<li><a href="#">PETS</a></li>
<li><a href="victoryViewAll.jsp">VICTORY LOGS</a></li>
<li><a href="#">STOCKS</a></li>
<li><a href="#">ABOUT US</a></li>

</ul>
		
 	
 </head>
  <hr>
<body>

	<%

try {
	String vlid = request.getParameter("vlid");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/happytailsdb","root","");
	String sql="Select * from victory where vlid="+vlid;
	Statement st=con.createStatement();
	ResultSet resultSet=st.executeQuery(sql);
	while(resultSet.next()){

%>
		<div align=center id ="bor" style="background-image: url(victoryImages/allvictory.jpg);background-repeat: no-repeat;">
	<form action="victoryDelete" id = "insertkobo" method = "post" >
	<h1>DELETE VICTORY LOG</h1><br/>
	<input type="hidden" name="vlid" value="<%=resultSet.getString("vlid") %>">
	
	<!-- user inputs -->

	Victory Log ID        : <br><input type = "text" name ="vlid" id ="fname" value="<%=resultSet.getString("vlid") %>"  readonly><br><br>
	Coordinator Name      : <br><input type = "text" name ="cname" id ="fname" value="<%=resultSet.getString("cname") %>"readonly><br><br>
	Program Type          :<br><input type = "text" name ="program" id ="fname" value="<%=resultSet.getString("program") %>"readonly><br><br>
	City Name                 : <br><input type = "text" name ="city" id ="fname" value="<%=resultSet.getString("city") %>"readonly><br><br>
	Location              :<br><input type = "text" name ="location" id ="fname" value="<%=resultSet.getString("location") %>"readonly><br><br>
	Conducted Date                  : <br> <input type = "Date" name ="date" id ="fname" value="<%=resultSet.getString("date") %>"readonly><br><br>
	Budget (Rs.)            :<br> <input type = "text" name ="budget" id ="fname" value="<%=resultSet.getString("budget") %>"readonly><br><br>
	<input type = "checkbox" id = "chkbx" onclick = "enablesubmitbtn()"  > Are you sure to delete this record? <br>
	<input  type = "submit"  name = "submit" id="sub"  value = "Delete"  onclick ="alert('Successfully Deleted!')" Disabled>

		
	</form>
	
	<br>
	<a href="victoryViewAll.jsp"><button  class="button button1"><b>Cancel</b></button></a>
	<br><br><br>	
	</div>
<%
}


}catch(Exception e)
{
e.printStackTrace();
}
%>

</body>
 <hr>
</html>