<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="registration.UserRegDao"%>
    <%@page import="querySet.QuerySet"%>
      <%@page import="java.sql.*"%>
    

<html>
<head><title>Settings | Pune Metro</title></head>

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

<script>
function myFunc() {
    confirm("Press Ok to Perform this Action");
}
</script>

<body>
  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("user")==null)
      response.sendRedirect("index.jsp");

  %>
<%

ServletContext context=getServletContext();
		if((Boolean)context.getAttribute("userType"))
		{
			context.setAttribute("userType", false);
%>
		<script>
		alert("Your changes will be reflected soon..!!");
		</script>

<%} %>

<%

		if((Boolean)context.getAttribute("changePass"))
		{
			context.setAttribute("changePass", false);
%>
		<script>
		alert("Oops Password didn't Match.Please Try");		
		</script>

<%} %>

<header class="fixed-header" role="banner">
  <div class="container-fluid">

    <!-- Site Title  -->
    <div class="site-title col-xs-3">
      <h1> PUNE METRO </h1>
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
<% 	UserRegDao user=(UserRegDao)session.getAttribute("user");%>

    <div class="user-info">
      <div class="username">
        <p> <%=user.getName() %> </p>
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
	<%if (user.getUserType()==1 ){%>
    <li> <a href="recharge.jsp"> Recharge Online </a></li>
    <li> <a href="ex-smartcard.jsp"> My Smartcard</a></li>
    	 <li><a href="swipecard.jsp">Swipe Card</a></li>
    
    <%}
	else if (user.getUserType()==2){
	%>
    <li> <a href="pass.jsp"> My Pass</a></li>    
	<%} %>
    <li><a href="index.jsp">Pune Metro Home</a></li>
  </ul>
</menu>

<main>
  <section>
    <h2>My Account Settings </h2>
<br>
    <p>

          <form action="changePass" method="post">
<!--
        <div class="form-group ">
    <label for="formGroupExampleInput">Enter Amount (In INR) ::</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="">
  </div>
-->
<div class="form-group row">
    <label for="amount" class="col-sm-3 col-form-label">Enter New Password</label>
    <div class="col-sm-15">
      <input type="Password" id="formGroupExampleInput" name="pass1" placeholder=""  required="">
    </div>
  </div>

<div class="form-group row">
    <label for="amount" class="col-sm-3 col-form-label">Enter Password Again</label>
    <div class="col-sm-15">
      <input type="Password" id="formGroupExampleInput" name="pass2" placeholder="" required="">
    </div>
  </div>

 
	<input type="submit" value="Change Settings" class="btn btn-info btn-lg" onclick="myFunc()"/>



  <br>
  <br>
       <h2>Remove My Account Permanently </h2>
         
                    </form>

   
	<form action="deactivate" >
		<input type="submit" value="Deactivate My Account" class="btn btn-info btn-lg " onclick="myFunc()"/>
	
	</form>
	<%
	
	QuerySet qs=new QuerySet();
    	
	
	user.setUsertype(qs.getUserType(user));
    		
    		
    session.setAttribute("user", user);

	
	
	String type="",type1="";
	if(user.getUserType()==1)
	{
		type="SMART CARD HOLDER ";
    	type1="PASS HOLDER";

	}
    else
    {
    	type="PASS HOLDER";
		type1="SMART CARD HOLDER ";
    }

	%>
	<br>
	<h2>You Are Currently  <%=type %>  ,Would You Like To Be a <%=type1 %> ?</h2>
  <form action="changeUserType" method="post" >
		<input type="submit" value="Change" class="btn btn-info btn-lg" onclick="myFunc()"/>
	
</form>
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