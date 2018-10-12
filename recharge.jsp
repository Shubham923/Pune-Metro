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
        <li><a href="#"><span class="glyphicon glyphicon-log-out" title="Log Out"></span></a></li>
      </ul>
    </div>
  </div>

  <ul class="admin-menu">
    <li> <a href="profile.jsp"> My Account </a></li>
    <li> <a href="pass.jsp"> Issue a New Pass </a></li>
    
    <li> <a href="ex-smartcard.jsp"> My Smartcard</a></li>
    <li><a href="index.html">Pune Metro Home</a></li>
  </ul>
</menu>

<!--
<menu id="admin" class="dynamicMenu">
  <div>
    <h2> Admin </h2>
  </div>

  <ul class="admin-menu">
    <li> <a href="#"> Admin Options </a></li>
    <li> <a href="#"> Admin Options </a></li>
    <li> <a href="#"> Admin Options </a></li>
  </ul>
</menu>

<menu id="techpub" class="dynamicMenu">
  <div>
    <h2> Tech Pubs </h2>
  </div>

  <ul class="admin-menu">
    <li> <a href="#"> Tech Pub Options </a></li>
    <li> <a href="#"> Tech Pub Options </a></li>
    <li> <a href="#"> Tech Pub Options </a></li>
  </ul>
</menu>

<menu id="inspector" class="dynamicMenu">
  <div>
    <h2> Inspection Tool </h2>
  </div>

  <ul class="admin-menu">
    <li> <a href="#"> Do this </a></li>
    <li> <a href="#"> Engine Something </a></li>
    <li> <a href="#"> Check this out </a></li>
  </ul>
</menu>

<menu id="tools" class="dynamicMenu">
  <div>
    <h2> Tools </h2>
  </div>

  <ul class="admin-menu">
    <li> <a href="#"> Order Tool </a></li>
    <li> <a href="#"> Report Broken Tool </a></li>
    <li> <a href="#"> Find Needed Tool </a></li>
  </ul>
</menu>

<menu id="help" class="dynamicMenu">
  <div>
    <h2> Inspection Tool </h2>
  </div>

  <ul class="admin-menu">
    <li> <a href="#"> Application Documentation </a></li>
    <li> <a href="#"> Using Interface </a></li>
    <li> <a href="#"> Modifying  </a></li>
  </ul>
</menu>

-->

<main>
  <section>
    <b><h2>Recharge My Smartcard </h2></b>

    <p>
      
<!--
        <div class="form-group ">
    <label for="formGroupExampleInput">Enter Amount (In INR) ::</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="">
  </div>
-->
<BR>
<form  action="Recharge" method="get">
<div class="form-group row">
    <label for="amount" class="col-sm-2 col-form-label">Enter Amount</label>
    <div class="col-sm-10">
      <input type="text" id="Amt" name="Amt" placeholder="INR 0.00">
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