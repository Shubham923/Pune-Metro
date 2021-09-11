<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="registration.UserRegDao"%>
    <%@page import="querySet.QuerySet"%>
      <%@page import="java.sql.*"%>
    
  
<html>
<head><title>User Profile | Pune Metro</title></head>

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
  <%


  if(session.getAttribute("user")==null)
      response.sendRedirect("index.jsp");

  %>
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
  <style>
division.{
    border: 1px solid gray;
    padding: 8px;
    
}

hero.{
    text-align: center;
    text-transform: uppercase;
    color: #4CAF50;
    
}

p1.{
    text-indent: 50px;
    text-align: justify;
    letter-spacing: 3px;
}
div#submitForm input {
  background: url("delete4.png") no-repeat scroll 0 0 transparent; 
  font-size:0px;
  cursor: pointer;
  height: 50px;
  padding-bottom: 2px;
  width: 100px;
  margin-left:200 px;
    background-size: 100px 50px;}

</style>
</header>

<%
	UserRegDao user=(UserRegDao)session.getAttribute("user");
	ServletContext context=getServletContext();					//for announce
	context.setAttribute("maint", false);
	context.setAttribute("revpdf", false);

	%>

<menu id="user" class="dynamicMenu">
  <!-- User Stuffs -->
  <div class="user-profile">
    <div class="profile-pic">
      <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNy4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB3aWR0aD0iNDAwcHgiIGhlaWdodD0iNDAwcHgiIHZpZXdCb3g9IjAgMCA0MDAgNDAwIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA0MDAgNDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxnPg0KCTxjaXJjbGUgZmlsbD0iI0ZGRkZGRiIgY3g9IjIwMC4zNTkiIGN5PSIxMzAuNjkxIiByPSI4Ny45NjIiLz4NCgk8cGF0aCBmaWxsPSIjRkZGRkZGIiBkPSJNMzQxLjc4OSw0NDguNjUyYzAuNTY5LTYuOTMxLDAuODcyLTEzLjk2OSwwLjg3Mi0yMS4xMDNjMC0xMDUuNDQ3LTYzLjg3MS0xOTAuOTI5LTE0Mi42NjEtMTkwLjkyOQ0KCQlTNTcuMzM5LDMyMi4xMDIsNTcuMzM5LDQyNy41NDljMCw2LjA5NSwwLjIyMywxMi4xMTksMC42NCwxOC4wNjdDMTUyLjE1OCw0NjAuMDY2LDI0Ny43MzMsNDYxLjA4MSwzNDEuNzg5LDQ0OC42NTJ6Ii8+DQo8L2c+DQo8L3N2Zz4NCg==" alt="username here" />
    </div>

    <div class="user-info">
      <div class="username">
        <p><%=user.getName() %>  </p>
      </div>
      <ul class="profile-menu">
        <li><a href="#"><span class="glyphicon glyphicon-question-sign" title="Help"></span></a></li>
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out" title="Log Out"></span></a></li>
      </ul>
    </div>
  </div>

  <ul class="admin-menu">
    <li> <a href="admin.jsp">Admin Home </a></li>
    <li> <a href="stats.jsp">Statistics  </a></li>
    <li> <a href="fileUpload.jsp">Generate PDF </a></li>
    <li> <a href="chkuser.jsp">User Info  </a></li>
    <li><a href="maintanance.jsp">Maintanace</a></li>
    <li><a href="index.jsp">Pune Metro Home</a></li>
  </ul>
</menu>
<main>
	
	
  <section>
   <h1>Welcome, <%=user.getName()%>.</h1> 
	
	
       
<form>
<br>
                <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value= <%=user.getName()%>>
    </div>
  </div>

  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Address</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value="NA">
    </div>
  </div>

  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Contact</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value=<%=user.getMobileNo()%>>
    </div>
  </div>
  
   <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value= <%=user.getEmailId()%>>
    </div>
  </div>

  <br>
  <br>
 </form>

  </section>
    <p><b>User feedback / Comments</b></p>
  
  
  <%
  QuerySet qs=new QuerySet();
  ResultSet rs=qs.ReceiveQueryMessage();
    		while(rs.next())
    		{
  				System.out.print(rs.getString("msg"));
  %>
  <section>
  
  <form action="Reply" method="post">
<br>
                <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value= <%=rs.getString("name")%>>
    </div>
  </div>



  
   <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input  type="text" readonly class="form-control" name="email" placeholder="Write Something" id="staticEmail" value= <%=rs.getString("email")%> />
    </div>
  </div>

  
	<div class="division">
<p class="p1"><%=rs.getString("name")%> : "<%=rs.getString("msg")%>".</p>
<br>
</div>
<% if(rs.getString("reply")!=null){ %>
<p class="p1">Admin : "<%=rs.getString("reply")%>".</p>
<%} %>
<label>Reply:</label>
  <br>
  	
      <div class="col-sm-10" >
      <input type="text" name="reply" class="form-control" id="staticEmail"  >
    </div>
    <br>
    <br>
  <input type="submit" class="btn btn-info btn-lg" value="Send" style="margin-left:-1px">	
   </form>
 
    <form name="frm2" action="DeleteMsg" method="post">   
    <input type="hidden" 	 name="hdnbt12"  value="<%=rs.getInt("msgId") %>"/>
    <div id="submitForm" style="align-left:100px;">
	<input class="btn btn-info btn-lg" type="submit" name="bt" value="<%=rs.getInt("msgId") %>" " style="margin-left:0.0%; baackground-image:url(''Logo.png')"/> 
	</div>
	<p style="color:red">(*DELETE CONVERSATION)</p>
	
	
	</form>

  
  </section>
  <%
  }%>
</main>



<footer>
  <div class="container">
    <p> &copy; All Rights Reserved. Design and Maintained by : Pune Metro Corporation </p>
  </div>
</footer>
</body>
</html>