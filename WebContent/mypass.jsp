
<%@page import="querySet.QuerySet"%>

<%@page import="smartcard.smartcard"%>
<%@page import="registration.UserRegDao"%>
<%@page import="java.sql.*"%>


<html>
<head><title>SmartCard  | Pune Metro</title>

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

 <meta charset="utf-8" />
    

<body>
<header class="fixed-header" role="banner">
  <div class="container-fluid">

    <!-- Site Title  -->
    <div class="site-title col-xs-3">
      <h1> PUNE METRO </h1>
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
        <li><a href="settings.jsp"><span class="glyphicon glyphicon-cog" title="Settings"></span></a></li>
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" title="Log Out"></span></a></li>
      </ul>
    </div>
  </div>

  <ul class="admin-menu">
    <li> <a href="profile.jsp"> My Account </a></li>
    <li> <a href="pass.jsp"> Issue a New Pass </a></li>
    <li> <a href="recharge.jsp"> Recharge Online </a></li>
    <li> <a href="#"> My Smartcard</a></li>
    <li> <a href="mypass.jsp"> My Pass</a></li>
    
    <li><a href="index.jsp">Pune Metro Home</a></li>
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
<% 	UserRegDao user=(UserRegDao)session.getAttribute("user");%>
<main>
  <section>
    <h2>WELCOME, <%=user.getName()%></h2>
<br>
<%

	int usrid=user.getUsrid();
	QuerySet qs=new QuerySet();
	ResultSet rs=qs.GetPassInfo(usrid);
	
	if(rs.next())
	{
		rs.previous();
	
		while(rs.next())
		{
%>
    <p>

<form>
     <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Pass ID</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value=<%=rs.getInt(1) %>></div>
  </div>

  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Issue Date</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value=<%=rs.getDate(2) %>>
    </div>
  </div>

  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Validity</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value=<%=rs.getDate(3)%>>
    </div>
  </div>
  
  
    <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Amount Paid</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value=<%=rs.getInt(5)%>>
    </div>
  </div>
  
  
    <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Pass Type</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value=<%=rs.getString(6)%> >
    </div>
  </div>
<% 

	}//while ends here
		
		
		}%>

  <br>
  <br>
                        


This interface is for existing Pass holders.<br>
click on my account for user account home page.
                    </form>

    </p>

    

  </section>
</main>



<footer>
  <div class="container">
    <p> &copy; All Rights Reserved. Design and Maintained by : Pune Metro Coorporation </p>
  </div>
</footer>
</body>
</html>
