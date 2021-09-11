<%@page import="smartcard.smartcard"%>
<%@page import="registration.UserRegDao"%>
<%@page import="java.sql.*"%>


<html>
<head><title>User Information Results | Pune Metro</title></head>

<link href="profile-style.css" rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
    <li> <a href="fileUpload.jsp">Generate PDF Report </a></li>
    <li> <a href="chkuser.jsp">User Info </a></li>
        <li><a href="maintanance.jsp">Maintanace</a></li>
    
    <li><a href="index.jsp">Pune Metro Home</a></li>
  </ul>
</menu>


<main>
  <section>
    

    
      



<br>
<%
	
	int userid=0;
	String email=request.getParameter("email");
	System.out.println(email);
	int cardid=0,balance;
	String url="jdbc:mysql://localhost:3306/Metro";
	String uname="root";
	String pass="root";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(url, uname, pass);
	String query="select * from user where email=?";
	
	PreparedStatement st=con.prepareStatement(query);
	st.setString(1,email);
	ResultSet rs=st.executeQuery();
	while(rs.next())
	{
		userid=rs.getInt(1);
		
%>
	<b><h2>User Info for <%=email%></h2></b>
	<br></br>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">User ID</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value=<%=rs.getInt(1)%>>
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value=<%=rs.getString(2)%>>
    </div>
  </div>

  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Contact</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value=<%=rs.getLong(4)%>>
    </div>
  </div>
  
   <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value= <%=rs.getString(3)%>>
    </div>
  </div>
<%

	}
	int cid=0;
	query="select * from Smart_card where usrid="+userid;
    st=con.prepareStatement(query);
	rs=st.executeQuery();
	while(rs.next())
	{

		cid=rs.getInt(1);
%>
<div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Card ID</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value=<%=rs.getInt(1)%>>
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Balance</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value=<%=rs.getInt(2)%>>
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Last Transaction Date</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value=<%=rs.getString(3)%>>
    </div>
  </div>

  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Last Smartcard Recharge Date</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control" id="staticEmail" value=<%=rs.getString(4)%>>
    </div>
  </div>
  

<%

	}
%>
   </tbody>

</table>


<br>
<br>
<p><i>Note: All dates are in YYYY-MM-DD format.</i></p>

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