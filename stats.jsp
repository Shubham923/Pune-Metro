<%@page import="smartcard.smartcard"%>
<%@page import="registration.UserRegDao"%>
<%@page import="java.sql.*"%>


<html>
<head><title>Recharge Online | Pune Metro</title></head>

<link href="profile-style.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<!------ Include the above in your HEAD tag ---------->

<!--
User Profile Sidebar by @keenthemes
A component of Metronic Theme - #1 Selling Bootstrap 3 Admin Theme in Themeforest: http://j.mp/metronictheme
Licensed under MIT
-->
<!-- Overlay for fixed sidebar -->
<script type="text/javascript" src="projs.js"></script>

<body>
<header class="fixed-header" role="banner">
  <div class="container-fluid">

    <!-- Site Title  -->
    <div class="site-title col-xs-3">
      <h1>PUNE METRO </h1>
    </div>

    <!-- Site Navigation -->
    <div class="top-components col-xs-3 pull-right">

     <!-- <form>
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
          <div class="input-group-btn">
            <button class="btn btn-default btn-primary" type="submit"><span class="glyphicon glyphicon-search"></span></button>
          </div>
        </div>
      </form> -->
    </div>
  </div>
</header>

<!--
<nav id="sideNav">
  <ul>
    <li> <a href="#" title="Admin / Identification Component"><span class="glyphicon glyphicon-cog" aria-hidden="true" data-menu="admin"></span> </a> </li>
    <li> <a href="#" title="TechPub Component"><span class="glyphicon glyphicon-briefcase" aria-hidden="true" data-menu="techpub"></span> </a> </li>
    <li> <a href="#" title="Inspector Component"><span class="glyphicon glyphicon-eye-close" aria-hidden="true" data-menu="inspector"></span> </a> </li>
    <li> <a href="#" title="Tools Component"><span class="glyphicon glyphicon-wrench" aria-hidden="true" data-menu="tools"></span> </a> </li>

    <li> <a href="#" title="Help"><span class="glyphicon glyphicon-question-sign" aria-hidden="true" data-menu="help"></span> </a> </li>

    <li> <a href="#" title="User Component"><span class="glyphicon glyphicon-user" aria-hidden="true" data-menu="user"></span> </a> </li>
  </ul>
</nav>


-->

<menu id="user" class="dynamicMenu">
  <!-- User Stuffs -->
  <div class="user-profile">
    <div class="profile-pic">
      <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNy4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB3aWR0aD0iNDAwcHgiIGhlaWdodD0iNDAwcHgiIHZpZXdCb3g9IjAgMCA0MDAgNDAwIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA0MDAgNDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxnPg0KCTxjaXJjbGUgZmlsbD0iI0ZGRkZGRiIgY3g9IjIwMC4zNTkiIGN5PSIxMzAuNjkxIiByPSI4Ny45NjIiLz4NCgk8cGF0aCBmaWxsPSIjRkZGRkZGIiBkPSJNMzQxLjc4OSw0NDguNjUyYzAuNTY5LTYuOTMxLDAuODcyLTEzLjk2OSwwLjg3Mi0yMS4xMDNjMC0xMDUuNDQ3LTYzLjg3MS0xOTAuOTI5LTE0Mi42NjEtMTkwLjkyOQ0KCQlTNTcuMzM5LDMyMi4xMDIsNTcuMzM5LDQyNy41NDljMCw2LjA5NSwwLjIyMywxMi4xMTksMC42NCwxOC4wNjdDMTUyLjE1OCw0NjAuMDY2LDI0Ny43MzMsNDYxLjA4MSwzNDEuNzg5LDQ0OC42NTJ6Ii8+DQo8L2c+DQo8L3N2Zz4NCg==" alt="username here" />
    </div>

    <div class="user-info">
      <div class="username">
        <p> Username </p>
      </div>
      <ul class="profile-menu">
        <li><a href="#"><span class="glyphicon glyphicon-question-sign" title="Help"></span></a></li>
        <li><a href="settings.html"><span class="glyphicon glyphicon-cog" title="Settings"></span></a></li>
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" title="Log Out"></span></a></li>
      </ul>
    </div>
  </div>

  <ul class="admin-menu">
     <li> <a href="admin.jsp">Admin Home </a></li>
    <li> <a href="stats.jsp">Statistics  </a></li>
    <li> <a href="fileUpload.jsp">Generate PDF </a></li>
    <li> <a href="chkuser.jsp">User Info  </a></li>
    <li><a href="index.html">Pune Metro Home</a></li>
  </ul>
</menu>


<main>
  <section>
    

    
      



<br>
<%
	
	int cardid=0,balance;
	String url="jdbc:mysql://localhost:3306/Metro";
	String uname="root";
	String pass="root";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(url, uname, pass);
	%>
      <h2>Transaction History</h2>
      <br>
      <table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">Station_id</th>
      <th scope="col">Station Name</th>
      <th scope="col">Tickets Sold</th>
      <th scope="col">Revenue Generated</th>
    </tr>
  </thead>
  <tbody>

    <%   
  
  	String query="select stats.st_id,name,tkt_cnt,revenue from stats,Metro_Station where stats.st_id=Metro_Station.st_id";
   
	PreparedStatement st=con.prepareStatement(query);
	ResultSet rs=st.executeQuery(query);

	while(rs.next())
	{	
		%>
    <tr>
      <th scope="row"><%=rs.getInt(1) %></th>
	   <td><%=rs.getString(2) %></td>
      <td><%=rs.getInt(3) %></td>
      <td><%=rs.getInt(4) %></td>
    </tr>   
    <%
   	
	}
    %>
 
   </tbody>

</table>


  <br>

                        
 

    

  </section>
</main>



<footer>
  <div class="container">
    <p> &copy; All Rights Reserved. Design and Maintained by : Pune Metro Coorporation </p>
  </div>
</footer>
</body>
</html>