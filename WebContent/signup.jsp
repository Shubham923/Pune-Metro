	<!DOCTYPE html>
	<html>
	<head>
		<title>Sign Up | Pune Metro</title>
		<link rel="stylesheet" type="text/css" href="style-signup_1.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="https://fonts.googleapis.com/css?family=Fira+Sans" rel="stylesheet">

	</head>
	<body>
	<%
	ServletContext context=getServletContext();
	if((Boolean)context.getAttribute("regFail"))
	{
		context.setAttribute("regFail",false);
		
	
	%>
	<script>
	alert('Email address or Contact already exist..!!');
	</script>
	<%
	
	}%>
	
	
	
						<script>
		function num(input){
			var regex=/[^0-9]/gi;
			input.value=input.value.replace(regex,"");
		}
					
		function val(){
	var text=document.forms["frm"]["email"].value;
	
	var atpos=text.indexOf("@");
	var dotpos=text.lastIndexOf(".");
	
	if(atpos < 1 || dotpos < atpos+2 || dotpos+2 > text.length){
		alert("Please enter valid email..!!");
		return false;
		
	}
	if((frm.password.value).length<8)
		{
		alert("Password should be minimum 8 characters");
		return false;
		}
	
	if((frm.dob.value).length<8)
	{
	alert("INVALID DATE FORMAT");
	return false;
	}
	
	if((frm.contact.value).length<10)
		{
			alert("Phone number should be 10 digits minimum");
			return false;
		}
}
</script>
		<header>
		
		<nav>
			<div class="row clearfix"> 
				<img src="Logo.png" class="logo">
				<ul class="main-nav animated slideInDown" id="check" >
					<li><a href="index.jsp">Home</a></li>
					<li><a href="userloginnew.jsp">Login</a></li>
					
				</ul>
				<a href="#" class="icon" onclick="slideshow()"><i class="fa fa-bars"></i></a>
			</div>
			</nav>

			<div class="box">
		<h2>Sign Up</h2>
			<form action="RegisterUser" method="get" name="frm">				
				<div class="inputbox">
					<input type="text" name="name" id="name" required="">
					<label>Name</label>
				</div>
				<div class="inputbox">
					<input type="date" name="dob" id="dob" required="" max="2012-01-31" onchange="func()" style="opacity:0;">
					<label>Date of Birth</label>
				</div>

				<div class="inputbox">
					<input type="text" name="contact" id="mobile" required="" onkeyup="num(this)">
					<label>Mobile</label>
				</div>

				<div class="inputbox">
					<input type="text" name="email" id="email" required="">
					<label>Email</label>
				</div>
					<div class="inputbox">
					<input type="password" name="password" id="password" required="">
					<label>Set Password</label>
				</div>
				<div class="form-group">
                            <label>Select User Type</label>
                                <select class="form-control" id="exampleFormControlSelect1" name="usertype">
                          <option value=1>1.  Smart Card</option>
						  <option value=2>2.  Pass </option>
							                          
                                                        </select>
                            
                          </div>
				
				<p align ="center">
			
			<input type="Submit" id="Signup" value="Sign Up" onclick="return val();"></a>
			</form>	
			<br>
		</div>

		</header>
		<script>
		function func()
		{
			document.getElementById('dob').style.opacity='1';	
		}
		</script>
				
	</body>
	</html>
