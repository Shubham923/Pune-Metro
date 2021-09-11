<%@ page import="querySet.QuerySet" %>
<%@ page import="registration.UserRegDao" %>
<%@ page import="java.sql.*" %>
<%
UserRegDao user=new UserRegDao();
boolean bool;
user=(UserRegDao)session.getAttribute("user");
QuerySet qs=new QuerySet();
bool=qs.checkPass(user, 1);

if(!bool)
{

%>
<html>
<head><title>Pass | Pune Metro</title></head>

<link href="profile-style.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<!------ Include the above in your HEAD tag ---------->


<!-- Overlay for fixed sidebar -->
<script type="text/javascript" src="projs.js"></script>

<body>

  <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

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
</header>
<menu id="user" class="dynamicMenu">
  <!-- User Stuffs -->
  <div class="user-profile">
    <div class="profile-pic">
      <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNy4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB3aWR0aD0iNDAwcHgiIGhlaWdodD0iNDAwcHgiIHZpZXdCb3g9IjAgMCA0MDAgNDAwIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA0MDAgNDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxnPg0KCTxjaXJjbGUgZmlsbD0iI0ZGRkZGRiIgY3g9IjIwMC4zNTkiIGN5PSIxMzAuNjkxIiByPSI4Ny45NjIiLz4NCgk8cGF0aCBmaWxsPSIjRkZGRkZGIiBkPSJNMzQxLjc4OSw0NDguNjUyYzAuNTY5LTYuOTMxLDAuODcyLTEzLjk2OSwwLjg3Mi0yMS4xMDNjMC0xMDUuNDQ3LTYzLjg3MS0xOTAuOTI5LTE0Mi42NjEtMTkwLjkyOQ0KCQlTNTcuMzM5LDMyMi4xMDIsNTcuMzM5LDQyNy41NDljMCw2LjA5NSwwLjIyMywxMi4xMTksMC42NCwxOC4wNjdDMTUyLjE1OCw0NjAuMDY2LDI0Ny43MzMsNDYxLjA4MSwzNDEuNzg5LDQ0OC42NTJ6Ii8+DQo8L2c+DQo8L3N2Zz4NCg==" alt="username here" />
    </div>
<% 	user=(UserRegDao)session.getAttribute("user");%>

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
	<%
	
	if (user.getUserType()==1 ){%>


    <li> <a href="recharge.jsp"> Recharge Online </a></li>
    <li> <a href="ex-smartcard.jsp"> My Smartcard</a></li>
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
    <h2></h2>

    <p>
    
    <!DOCTYPE html>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
    box-sizing: border-box;
}

.columns {
    float: left;
    width: 33.3%;
    padding: 8px;
}

.price {
    list-style-type: none;
    border: 1px solid #eee;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
}

.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.price .header {
    background-color: #111;
    color: white;
    font-size: 25px;
}

.price li {
    border-bottom: 1px solid #eee;
    padding: 10px;
    text-align: center;
}

.price .grey {
    background-color: #eee;
    font-size: 20px;
}

.button {
    background-color: 	#33afff;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
}

@media only screen and (max-width: 600px) {
    .columns {
        width: 100%;
    }
}
</style>



<h2 style="text-align:center">Pass Pricing Tables</h2>

<div class="columns">
  <ul class="price">
    <li class="header">Basic Pass</li>
    <li class="grey">Rs 300</li>
    <li>3 months</li>
    <li><img src="basic.png"style="width:230px;height:200px;"></li>
    <form name="frm" action="IssuePass" method="post">
    <li class="grey"> <input type="hidden" 	 name="hdnbt3"  value="3"/>
	<input class="button" type="button" name="bt" value="Buy" onclick="{this.value=document.frm.hdnbt3.value;document.frm.submit();}" /> 
	</form>
	 </ul></li>

</div>

<div class="columns">
  <ul class="price">
    <li class="header" >Gold</li>
    <li class="grey">Rs 600</li>
    <li>6 months</li>
    <li><img src="gold.jpeg" style="width:200px;height:200px;"></li>
    
    <form name="frm1" action="IssuePass" method="post">   
    <li class="grey"> <input type="hidden" 	 name="hdnbt6"  value="6"/>
	<input class="button" type="button" name="bt" value="Buy" onclick="{this.value=document.frm1.hdnbt6.value;document.frm1.submit();}" />  </ul></li>
  </form>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header">Premium</li>
    <li class="grey">Rs 800</li>
    <li>1 year</li>
    <li><img src="premium.jpeg"></li>
   
     <form name="frm2" action="IssuePass" method="post">   
    <li class="grey"> <input type="hidden" 	 name="hdnbt12"  value="12"/>
	<input class="button" type="button" name="bt" value="Buy" onclick="{this.value=document.frm2.hdnbt12.value;document.frm2.submit();}" />  </ul></li>
	</form>
  </ul>
</div>

    
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
<%}

else

{%>

<html>
<head><title>Pass  | Pune Metro</title>

<link href="profile-style.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<!------ Include the above in your HEAD tag ---------->

<!-- Overlay for fixed sidebar -->
<script type="text/javascript" src="projs.js"></script>

 <meta charset="utf-8" />
    

<body>

<%
		ServletContext context=getServletContext();
		boolean bool1=(boolean)context.getAttribute("pdf1");
		if(bool1)
		{
			context.setAttribute("pdf1", false);
		
%>


<script type="text/javascript">

	window.alert("Receipt Successfully Generated !!");
	
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
    </div>
  </div>
</header>
<menu id="user" class="dynamicMenu">
  <!-- User Stuffs -->
  <div class="user-profile">
    <div class="profile-pic">
      <img src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNy4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB3aWR0aD0iNDAwcHgiIGhlaWdodD0iNDAwcHgiIHZpZXdCb3g9IjAgMCA0MDAgNDAwIiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA0MDAgNDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxnPg0KCTxjaXJjbGUgZmlsbD0iI0ZGRkZGRiIgY3g9IjIwMC4zNTkiIGN5PSIxMzAuNjkxIiByPSI4Ny45NjIiLz4NCgk8cGF0aCBmaWxsPSIjRkZGRkZGIiBkPSJNMzQxLjc4OSw0NDguNjUyYzAuNTY5LTYuOTMxLDAuODcyLTEzLjk2OSwwLjg3Mi0yMS4xMDNjMC0xMDUuNDQ3LTYzLjg3MS0xOTAuOTI5LTE0Mi42NjEtMTkwLjkyOQ0KCQlTNTcuMzM5LDMyMi4xMDIsNTcuMzM5LDQyNy41NDljMCw2LjA5NSwwLjIyMywxMi4xMTksMC42NCwxOC4wNjdDMTUyLjE1OCw0NjAuMDY2LDI0Ny43MzMsNDYxLjA4MSwzNDEuNzg5LDQ0OC42NTJ6Ii8+DQo8L2c+DQo8L3N2Zz4NCg==" alt="username here" />
    </div>

<% 	user=(UserRegDao)session.getAttribute("user");%>


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
	<%
	
	if (user.getUserType()==1 ){%>


    <li> <a href="recharge.jsp"> Recharge Online </a></li>
    <li> <a href="ex-smartcard.jsp"> My Smartcard</a></li>
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
    <h2></h2>
    <b>Your Pass Details are as follows:</b>
  
   
<br>
<%

	int usrid=user.getUsrid();
	QuerySet qs1=new QuerySet();
	ResultSet rs=qs1.GetPassInfo(usrid);
	
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
  <br>
 </form>
  <form  action="passReceipt" method="post">

  <input type="submit" class="btn btn-info btn-lg" value="Generate Receipt"/>
</form>
  
<% 

	}//while ends here
		
		
		}%>

  <br>
  <br>
                        

                   

    </p>

    

  </section>
</main>
<p><i>Note: All dates are in YYYY-MM-DD format.</i></p>


<footer>
  <div class="container">
    <p> &copy; All Rights Reserved. Design and Maintained by : Pune Metro Coorporation </p>
  </div>
</footer>
</body>
</html>





<%} %>


