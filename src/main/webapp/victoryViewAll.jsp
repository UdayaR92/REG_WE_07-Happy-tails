<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="victoryCss/victory.css">
	<link rel="stylesheet" type="text/css" href="victoryCss/styles.css">
	<link rel="stylesheet" type="text/css" href="victoryCss/header.css">
	
<style>
.button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  margin-left:20cm;

}

.button1 {
  background-color: white; 
  width:120px;
  height:45px;
  color: black; 
  border: 2px solid #4CAF50;
  font-size: 15px;
  font-style: bold;
}
.button1:hover {
  background-color: #0000e6;
  color: white;
}



</style>
 
 <title> VICTORY LOGS </title>
 
 
 
		

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
<div align=center id ="bor" style="background-image: url(victoryImages/victorydelete.jpg);background-repeat: no-repeat;">
<h1>VICTORY LOGS</h1>
	<BR>
		<form action="VictorySearch" name="frm" method="post">
		<table align="center">
			<tr>
			<td colspan=2 style="font-size:15pt;" align="center">
			<td><label for="fname"><b style="font-size:20px;">SEARCH VICTORY LOGS BY DATE :</b></label></td>
			<td><input type="date" name="date"  ></td>
			<td><input   type="submit" name="submit" value="Search" style= "background-color:#e60000; COLOR:WHITE;width:70px;height:25px"></td></tr>
			<br>
		</table>
	</form>
	
	<BR>

	
<table style = "background-color:white" border ="2"><br>

<tr style="background-color:#000099;color:white;font-size:20px;font-style: bold">
<th><b>Victory Log ID</b></th>
<th><b>Coordinator Name</b></th>
<th><b>Program Type</b></th>
<th><b>City Name</b></th>
<th><b>Location</b></th>
<th><b>Conducted Date</b></th>
<th><b>Budget(Rs.)</b></th>


<th>Update</th>
<th>Delete</th>

</tr>

<%

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/happytailsdb","root","");
	String sql="Select * from victory" ;
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);
	while(rs.next()){

%>
<tr style="background-color:#e6e6ff;color:black;font-size:19px;font-style: bold">
<td><%=rs.getString(1)%></td>
<td ><%=rs.getString(2)%></td>
<td ><%=rs.getString(3)%></td>
<td ><%=rs.getString(4)%></td>
<td ><%=rs.getString(5)%></td>
<td ><%=rs.getString(6)%></td>
<td ><%=rs.getString(7)%></td>



<td><a style= "background-color: blue; color:white"  href="victoryUpdate.jsp?vlid=<%=rs.getString("vlid")%>" >UPDATE</a></td>
<td><a style= "background-color: red; color:white" href="victoryDelete.jsp?vlid=<%=rs.getString("vlid")%>">DELETE</a></td>
</tr>
<%

}

}catch(Exception e)
{
e.printStackTrace();
}
%>

</table>
 <br>
	<a href="victoryInsert.jsp"><button  class="button button1"><b>Add Logs</b></button></a>	
		 <br><br>
<br>
	<form action="victoryPDF.jsp " method="post"  >	
		
    <b style="font-size:20px;">Generate Annual Report :</b><input type = "text" name ="Year" id ="Year" placeholder = "Year"   required>
         <br><br>   
          <input style= "background-color:#e60000; COLOR:WHITE;width:80px;height:30px" type="submit" value="Genarate" >  
  </form>
<br><br>
<b style="font-size:20px;">Generate All Victory Logs.Csv</b> <br><a href="VictoryReport"><button style= "background-color:#e60000; COLOR:WHITE;width:80px;height:30px" ><b>Print</b></button></a>
<br><br><br><br><br>


</div>

</body>
 <hr>
</html>