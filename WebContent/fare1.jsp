<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Fare | Pune Metro</title>
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME CSS -->
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />
     <!-- FLEXSLIDER CSS -->
<link href="assets/css/flexslider.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="fare-style.css" rel="stylesheet" />    
  <!-- Google	Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
                    <li ><a href="#home">HOME</a></li>
                      <li><a href="#features-sec">SKIP TO MAIN CONTENT</a></li>
                     <li><a href="#route-sec">ROUTES</a></li>
                     
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
                              <h3>Delivering Quality Service</h3>
                           <h1>THE UNIQUE METHOD</h1>
                            <a  href="schedule.jsp" class="btn btn-info btn-lg" >
                                GET SCHEDULE
                            </a>
                            <a  href="index.jsp" class="btn btn-info btn-lg" >
                                METRO HOME
                            </a>
                        </li>
                        <!-- End Slider 01 -->
                        
                        <!-- Slider 02 -->
                        <li>
                            <h3>Delivering Quality SERVICE</h3>
                           <h1>UNMATCHED APPROACH</h1>
                             <a  href="schedule.jsp" class="btn btn-info btn-lg" >
                                GET SCHEDULE
                            </a>
                            <a  href="index.jsp" class="btn btn-info btn-lg" >
                                METRO HOME
                            </a>
                             
                        </li>
                        <!-- End Slider 02 -->
                        
                        <!-- Slider 03 -->
                        <li>
                            <h3>Delivering Quality Satisfaction</h3>
                           <h1>AWESOME MANAGEMENT PANEL</h1>
                             <a  href="schedule.jsp" class="btn btn-info btn-lg" >
                                GET SCHEDULE
                            </a>
                            <a  href="index.jsp" class="btn btn-info btn-lg" >
                                METRO HOME
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
               
        <h2 data-scroll-reveal="enter from the bottom after 0.1s" ><i class="fa fa-circle-o-notch"></i> WELCOME TO THE PUNE METRO | FARE <i class="fa fa-circle-o-notch"></i> </h2>
                   </div>
               </div>
             </div>
        
    </div>
    <!--HOME SECTION TAG LINE END-->   
         <div id="features-sec" class="container set-pad" >
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line">FARE ESTIMATION </h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s" >

                    <div class="row set-row-pad"  data-scroll-reveal="enter from the bottom after 0.5s" >
           
               
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                    <form>


						<% 
						
							
						
						
						%>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">::  Source ::</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                              <option><%=request.getAttribute("source") %></option>
                             
                            
                            </select>
                          </div>
                          <br>
                          <div class="form-group">
                            <label for="exampleFormControlSelect1">::Destination ::</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                              <option><%=request.getAttribute("destination") %></option>
                              
                            </select>
                          </div>

                          
                                                  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Fare</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="INR <%=request.getAttribute("cost") %>">
    </div>
  </div>



                    </form>
                    <br>
                    <br>
                <!--    <b>Fare (In INR)::</b><BR>
                    <input class="form-control" type="text" placeholder="INR 0.00" readonly>
                </div>-->


<br>


     
              
              
                
               </div>



                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->


      
             </div>
   <!-- FEATURES SECTION END-->


   <!--ROUTE SECTION STARTS HERE--> 
</div>

	<%
		String stations[]=(String[])request.getAttribute("stations");
		
		for(String st:stations)
		{
			if(st!=null)
			{
	%>

 <a  href="#features-sec" class="btn btn-info btn-lg" style="margin-left:10px;" >   <%=st%>  </a>
	<%
			}
		}
	
	%>
  
     <div class="container">
             <div class="row set-row-pad"  >
    <div class="col-lg-4 col-md-4 col-sm-4   col-lg-offset-1 col-md-offset-1 col-sm-offset-1 " data-scroll-reveal="enter from the bottom after 0.4s">

                    <h2 ><strong>Our Location </strong></h2>
        <hr />
                    <div ">
                        <h4>Pune Institute of Computer Technology<br>Behind Bhari Vidyapeeth</h4>
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


</body>
</html>
