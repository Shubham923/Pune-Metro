<%@page import="java.sql.*"%>

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

<script language="JavaScript">
    function showInput() {
        document.getElementById('display').innerHTML = 
                    document.getElementById("Destination").value;
    }
  </script>
</head>
<body>

<h2><center>SWIPECARD</center></h2>

<div class="container">
    
    <form action="SmartCard" method="get">
   
    <div class="row">
		<label>Card ID </label>
		<input type="text" name="card" id="card" required="">
		
	</div>
     <div class="row">
      <div class="col-25">
        <label for="Source">Source</label>
      </div>
      <div class="col-75">
        <select id="Source" name="Source">
        
     
        
        <script type="text/javascript">

		function alertName()
		{
			alert("OOPS !!Not Enough Balance Available!!");
		}
</script>
<script type="text/javascript">
	window.onload=alertName;

</script>
        
        <%
        
        String query="select st_id,name from Metro_Station";
    	String url="jdbc:mysql://localhost:3306/Metro";
    	String username="root";
    	String pass="root";
    	String source_st="";
    	Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url, username, pass);
		PreparedStatement st=con.prepareStatement(query);
		
		ResultSet rs=st.executeQuery();
        while(rs.next())
        {
        	
        	 //source_st=rs.getString("name");
        %>
        
        
          <option value="<%= rs.getInt(1)%>"><%=rs.getString(2) %></option>
          
          
          
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
         String query1="select *from Metro_Station";

        PreparedStatement st1=con.prepareStatement(query1);
		
		ResultSet rs1=st1.executeQuery();
        while(rs1.next())
        {
        %>
        
        
          <option value="<%=rs1.getInt(1)%>"><%=rs1.getString(2) %></option>
          
          
          
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

