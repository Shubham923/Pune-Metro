
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Schedule | Pune Metro</title>
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME CSS -->
<link href="assets/fonts/font-awesome.min.css" rel="stylesheet" />
     <!-- FLEXSLIDER CSS -->
<link href="assets/css/flexslider.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="assets/css/style.css" rel="stylesheet" />    
  <!-- Google	Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
</head>
<body >
   
 <div class="navbar navbar-inverse navbar-fixed-top " id="menu">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img class="logo-custom" src="Logo.png" alt=""  /></a>
            </div>
            <div class="navbar-collapse collapse move-me">
                <ul class="nav navbar-nav navbar-right">
                  <li> <a href="#schedule-sec">SKIP TO MAIN CONTENT</a></li>
                    <li ><a href="#home">HOME</a></li>
                
                     <li><a href="userloginnew.jsp">LOGIN</a></li>
                     <li><a href="signup.jsp">SIGNUP</a></li>
                     <li><a href="#contact-sec">CONTACT</a></li>
                     
                </ul>
            </div>
           
        </div>
    </div>
      <!--NAVBAR SECTION END-->
       <div class="home-sec" id="home" >
           <div class="overlay">
 <div class="container">
           <div class="row text-center " >
           
               <div class="col-lg-12  col-md-12 col-sm-12">
               
                <div class="flexslider set-flexi" id="main-section" >
                    <ul class="slides move-me">
                        <!-- Slider 01 -->
                        <li>
                              <h3>Schedule</h3>
                           <h1>THE UNIQUE METHOD</h1>
                            <a  href="index.jsp" class="btn btn-default btn-lg" >
                                METRO HOME 
                            </a>
                             <a  href="fare.jsp" class="btn btn-success btn-lg" >
                                GET FARE
                            </a>
                        </li>
                        <!-- End Slider 01 -->
                        
                        <!-- Slider 02 -->
                        <li>
                            <h3>Schedule </h3>
                           <h1>UNMATCHED APPROACH</h1>
                             <a  href="index.jsp" class="btn btn-default btn-lg" >
                                METRO HOME 
                            </a>
                           
                             <a  href="fare.jsp" class="btn btn-success btn-lg" >
                                GET FARE
                            </a>
                        </li>
                        <!-- End Slider 02 -->
                        
                        <!-- Slider 03 -->
                        <li>
                            <h3>Schedule</h3>
                           <h1>AWESOME MANAGEMENT PANEL</h1>
                             <a  href="index.jsp" class="btn btn-default btn-lg" >
                                METRO HOME 
                            </a>
                             <a  href="fare.jsp" class="btn btn-success btn-lg" >
                                GET FARE
                            </a>
                        </li>
                        <!-- End Slider 03 -->
                    </ul>
                </div>
                   
     
              
              
            </div>
                
               </div>
                </div>
           </div>
           
       </div>
       <!--HOME SECTION END-->   
    <div  class="tag-line" >
         <div class="container">
           <div class="row  text-center" >
           
               <div class="col-lg-12  col-md-12 col-sm-12">
               
        <h2 data-scroll-reveal="enter from the bottom after 0.1s" ><i class="fa fa-circle-o-notch"></i> WELCOME TO THE PUNE METRO | SCHEDULE <i class="fa fa-circle-o-notch"></i> </h2>
                   </div>
               </div>
             </div>
        
    </div>
    <!--HOME SECTION TAG LINE END-->   
         <div id="schedule-sec" class="container set-pad" >
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line">SCHEDULE OF METRO</h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s" >    
                     <h4>Metros are scheduled with a frequency of 10 min.</h4>
                     <h4>Following table gives  daily starting time for all stations.</h4>
     <%
        
        String query="select name,start_up,start_down from schedule,Metro_Station where Metro_Station.st_id=schedule.st_id and lineno=1";
    	String url="jdbc:mysql://localhost:3306/Metro";
    	String username="root";
    	String pass="root";
    	Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url, username, pass);
		PreparedStatement st=con.prepareStatement(query);
		
		ResultSet rs=st.executeQuery();%>
				 <br>
 <h3 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line">Line 1</h3>
		<table align="center">
				<tr><th>Station Name</th>			<th>To Swargate</th>						<th>To PCMC</th><tr>
			
 		
		<%while(rs.next())
        {
        	
        %>
        
          
          		<tr>
				<td><%=rs.getString(1)%></td>      <td><%=rs.getTime(2)+" AM"%></td>		<td><%=rs.getTime(3)+" AM"%></td>
          		</tr>
          
          <%
          
        }
          %>
		          </table><br><br>
		
	     <%
        
         query="select name,start_up,start_down from schedule,Metro_Station where Metro_Station.st_id=schedule.st_id and lineno=2";
    	 st=con.prepareStatement(query);
		 rs=st.executeQuery();%>
		 <br>
	 <h3 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line">Line 2</h3>
		<table align="center">
				
				<tr><th>Station Name</th>			<th>To Ramwadi</th>						<th>To Vanaz</th><tr>
			
 		
		<%while(rs.next())
        {
        	
        %>
        
          
          		<tr>
				<td><%=rs.getString(1)%></td>      <td><%=rs.getTime(2)+" AM"%></td>		<td><%=rs.getTime(3)+" AM"%></td>
          		</tr>
          
          <%
          
        }
          %>
		          </table>
		<br><br>
                     <!--WRITE YOUR CODE HERE -->


                     </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->

                 
               </div>
             </div>
   <!-- FEATURES SECTION END-->

      <!-- COURSES SECTION END-->
    <div id="contact-sec"   >
           <div class="overlay">
 <div class="container set-pad">
      <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.1s" class="header-line" >CONTACT US  </h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s">
                      We are always ready to solve your queries. Feel free to ask us about any problem regarding Pune Metro Rail Project.
                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->
           <div class="row set-row-pad"  data-scroll-reveal="enter from the bottom after 0.5s" >
           
               
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control "  required="required" placeholder="Your Name" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control " required="required"  placeholder="Your Email" />
                        </div>
                        <div class="form-group">
                            <textarea name="message" required="required" class="form-control" style="min-height: 150px;" placeholder="Message"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-info btn-block btn-lg">SUBMIT REQUEST</button>
                        </div>

                    </form>
                </div>

                   
     
              
              
                
               </div>
                </div>
          </div> 
       </div>
     <div class="container">
             <div class="row set-row-pad"  >
    <div class="col-lg-4 col-md-4 col-sm-4   col-lg-offset-1 col-md-offset-1 col-sm-offset-1 " data-scroll-reveal="enter from the bottom after 0.4s">

                    <h2 ><strong>Our Location </strong></h2>
        <hr />
                    <div ">
                        <h4>The Orion Building, First Floor,<br> Opposite Don Bosco Youth Centre,<br>Near Saint Meeras's Girls Highschool, Koregaon Park, Pune.</h4>
                        <h4>Maharashtra, India.</h4>
                        <h4><strong>Call:</strong>  +91-020-26051074 </h4>
                        <h4><strong>Email: </strong>info@punemetro.com</h4>
                    </div>


                </div>
                 <div class="col-lg-4 col-md-4 col-sm-4   col-lg-offset-1 col-md-offset-1 col-sm-offset-1" data-scroll-reveal="enter from the bottom after 0.4s">

                    <h2 ><strong>Social Conectivity </strong></h2>
        <hr />
                    <div >
                        <a href="#">  <img src="assets/img/Social/facebook.png" alt="" /> </a>
                     <a href="#"> <img src="assets/img/Social/google-plus.png" alt="" /></a>
                     <a href="#"> <img src="assets/img/Social/twitter.png" alt="" /></a>
                    </div>
                    </div>


                </div>
                 </div>
     <!-- CONTACT SECTION END-->
    <div id="footer">
          &copy 2018 punemetro.com | All Rights Reserved |  <a href="http://binarytheme.com" style="color: #fff" target="_blank">Design by : punemetro.com</a>
    </div>
     <!-- FOOTER SECTION END-->
   
    <!--  Jquery Core Script -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!--  Core Bootstrap Script -->
    <script src="assets/js/bootstrap.js"></script>
    <!--  Flexslider Scripts --> 
         <script src="assets/js/jquery.flexslider.js"></script>
     <!--  Scrolling Reveal Script -->
    <script src="assets/js/scrollReveal.js"></script>
    <!--  Scroll Scripts --> 
    <script src="assets/js/jquery.easing.min.js"></script>
    <!--  Custom Scripts --> 
         <script src="assets/js/custom.js"></script>
<!--route

<div class="route" id="route-sec">

  <p>This is route Section</p>

</div>

-->

</body>
</html>
