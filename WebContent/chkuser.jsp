<%@page import="smartcard.smartcard"%>
<%@page import="registration.UserRegDao"%>
<%@page import="java.sql.*"%>


<html>
<head><title>Get User Information | Pune Metro</title></head>

<link href="profile-style.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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

    </div>
  </div>
</header>

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
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" title="Log Out"></span></a></li>
      </ul>
    </div>
  </div>

  <ul class="admin-menu">
     <li> <a href="admin.jsp">Administrator Home </a></li>
    <li> <a href="stats.jsp">Statistics  </a></li>
    <li> <a href="fileUpload.jsp">Generate PDF Report</a></li>
    <li> <a href="chkuser.jsp">User Info  </a></li>
        <li><a href="maintanance.jsp">Maintanace</a></li>
    
    <li><a href="index.html">Pune Metro Home</a></li>
  </ul>
</menu>


<main>
  <section>
    <b><h2>Get User Info </h2></b>

    <p>
      

<BR>
<form action="dispuser.jsp" method="get">
<div class="form-group row">
    <label for="amount" class="col-sm-2 col-form-label">Enter Email ID</label>
    <div class="col-sm-10">
      <input type="text" id="email" name="email" placeholder="abc@example.com">
    </div>
  </div>
   <input type="submit" class="btn btn-info btn-lg" value="Submit"/>
  
 
</form>



  <br>
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