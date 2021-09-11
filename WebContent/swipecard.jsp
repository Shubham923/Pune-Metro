<%@page import="java.sql.*"%>
<%@page import="querySet.QuerySet"%>
<%@page import="registration.UserRegDao"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}
input[type=text] {
    padding: 0;
    height: 30px;
    position: relative;
    left: 0;
    outline: none;
    border: 1px solid #cdcdcd;
    border-color: rgba(0,0,0,.15);
    background-color: white;
    font-size: 16px;
}
.advancedSearchTextbox {
    width: 526px;
    margin-right: -4px;
}
input[type=text], select, textarea {
    width: 30%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 30px;
    margin-left: 33%;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}

.col-25 {
    float: left;
    width: 25%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;

}



/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }

}
    #rc {
    border-radius: 25px;
    background:url(paper.jpg);
    padding: 20px; 
    width: 200px;
    height: 100px;  
    margin-left:550px;  
}
</style>

</head>
<body>

<h2><center>SWIPECARD</center></h2>

<div class="container">
      <%
      UserRegDao user=(UserRegDao)session.getAttribute("user");
        QuerySet qs=new QuerySet();
        String check=qs.IsWorking();
        System.out.print(check);
        if(check!=null)
        {
        %>
        	
        		<label style="align-right:500px;color:red;"><%=check%></label>
        
        <%} %>
    <form action="SmartCard" method="get">
   
    <div class="row">
		<label>Card ID </label>
		<input type="text" name="card" id="card" required="" value="<%=qs.gerCardid(user.getUsrid()) %>">
		
	</div>
     <div class="row">
      <div class="col-25">
        <label for="Source">Source</label>
      </div>
      <div class="col-75">
        <select id="Source" name="Source">

      
        <%
  

		ResultSet rs=qs.GetWorkingStations();
        while(rs.next())
        {
        	
        	 //source_st=rs.getString("name");
        %>
        
        
          <option value="<%= rs.getInt(2)%>"><%=rs.getString(1) %></option>
          
          
          
          <%
          
        }
          %>
        </select>
      </div>
    </div>  <div class="row">
      <div class="col-25">
        <label for="Source">Destination</label>
      </div>
      <div class="col-75">
        <select id="Destination" name="Destination">
        
        
        <%
     
		ResultSet rs1=qs.GetWorkingStations();
        while(rs1.next())
        {
        %>
        
        
          <option value="<%=rs1.getInt(2)%>"><%=rs1.getString(1) %></option>
          
          
          
          <%
        }
          %>
        </select>
      </div>
    <div class="row">
      <input type="submit" value="Submit">
    </div>
  </form>
</div>

</body>
</html>

