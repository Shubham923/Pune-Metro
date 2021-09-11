	<!DOCTYPE html>
	<html>
	<head>
		<title>User Login | Pune Metro</title>
		<link rel="stylesheet" type="text/css" href="style-login_1.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Fira+Sans" rel="stylesheet">
		<script src="lg.js"></script>
	
	</head>
	<body>
	
	<% ServletContext context=getServletContext();
        if((Boolean)context.getAttribute("loginFailed"))
        {
        	
        	context.setAttribute("loginFailed", false);
        %>
        
        <script>
        alert("INVALID LOGIN CREDENTIALS!!");
        </script>
        <%} %>
	
	<%
	context.setAttribute("regFail",false);
	
	%>
		<header>
			<nav>
			<div class="row clearfix"> 
				<img src="logo2.png" class="logo">
				<ul class="main-nav animated slideInDown" id="check" >
					<li><a href="index.jsp">Home</li></a>
					
				</ul>
				<a href="#" class="icon" onclick="slideshow()"><i class="fa fa-bars"></i></a>
			</div>
			</nav>

			<div class="box">
		<h2>Login</h2>
			<form action="Login" method="post">				
				<div class="inputbox">
					<input type="text" name="email" id="username" required="">
					<label>Username</label>
				</div>
				<div class="inputbox">
					<input type="password" name="password" id="password" required="">
					<label>Password</label>
				</div>
				
				<p align="center"><input type="Submit" id="submit" name="submit" value="Login" onclick="validate()">	</p>

			</form>	
			<br>
			<p align ="center">
			Not yet registered? <br>
			<a href="signup.jsp">
			<input type="Submit" id="Signup" value="Sign Up"></a>
		</p>
		</div>

		</header>

		<script type="text/javascript">

			function slideshow(){
				var x = document.getElementById('check');
				if(x.style.display==="none"){
					x.style.display="block";
				}else{
					x.style.display="none";
				}
			}
		</script>
				
	</body>
	</html>


















<!--

	<!DOCTYPE html>
	<html>
	<head>
		<title>Login | Pune Metro</title>
		<link rel="stylesheet" type="text/css" href="style-login.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
		<link href="https://fonts.googleapis.com/css?family=Fira+Sans" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Fira+Sans" rel="stylesheet">
		<script src="lg.js"></script>

	</head>
	<body>
		<header>

			<nav>
			<div class="row clearfix"> 
				<img src="Logo.png" class="logo">
				<ul class="main-nav animated slideInDown" id="check" >
					<li><a href="index.html">Home</li></a>
				</ul>
				<a href="#" class="icon" onclick="slideshow()"><i class="fa fa-bars"></i></a>
			</div>
			</nav>

			<!--<div class="rowflix">

			<figure><img src="Logo.png" class="logo"></figure>
			<ul>
			  <li><a class="active" href="#">Contact</a></li>
			  <li><a href="userlogin.html">Login</a></li>
			  <li><a href="index.html">Home</a></li>

			</ul>
		</div>	


			<div class="box">
		<h2>Login</h2>
			<form>				
				<div class="inputbox">
					<input type="text" name="username" id="username" required="">
					<label>Username</label>
				</div>
				<div class="inputbox">
					<input type="password" name="password" id="password" required="">
					<label>Password</label>
				</div>
				
				<p align="center"><input type="Submit" id="submit" name="submit" value="Login" onclick="validate()">	</p>

			</form>	
			<br>
			<p align ="center">
			Not yet registered? <br>
			<a href="signup.html">
			<input type="Submit" id="Signup" value="Sign Up"></a>
		</p>
		</div>

		</header>
				
	</body>
	</html>
-->