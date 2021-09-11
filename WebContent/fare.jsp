
<%@ page import="java.sql.*" %>
<%@ page import="fareEstimation.FindStation" %>
<%@ page import="querySet.GetConnection" %>
<%@ page import="querySet.QuerySet" %>

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
                             <a  href="index.jsp" class="btn btn-default btn-lg" >
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
                             <a  href="index.jsp" class="btn btn-default btn-lg" >
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
                             <a  href="index.jsp" class="btn btn-default btn-lg" >
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
                    <form action="FareServlet" method="post">



                        <div class="form-group">
                            <label for="exampleFormControlSelect1">:: Select Source ::</label>
                                <select class="form-control" id="exampleFormControlSelect1" name="src">
                            <%
                            
                    			QuerySet qs=new QuerySet();
                            	ResultSet rs=qs.GetStations(1);
                            
                            	while(rs.next())
                            	{
                            %>
                        
                              <option value=<%=rs.getInt("st_id") %>> <%=rs.getString("name") %></option>
                            
                            
                            
                            <%
                            
                            	}
                            %>
                                                        </select>
                            
                          </div>
                          <br>
                          <div class="form-group">
                            <label for="exampleFormControlSelect1">:: Select Destination ::</label>
                              <select class="form-control" id="exampleFormControlSelect1" name="dest">
                            <%
                            
                    		 rs=qs.GetStations(2);
                            
                            	while(rs.next())
                            	{
                            %>
                        
                              <option value=<%=rs.getInt("st_id") %>><%=rs.getString("name") %></option>
                            <%
                            
                            	}
                            %>
                               </select>
                          </div>

                          <br>
                          <br>

                                                  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Fare</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="INR 0.00">
    </div>
  </div>
  <br>
  <br>
                        <div class="form-group">
                            <button type="submit" class="btn btn-info btn-block btn-lg">CALCULATE</button>
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

<script type="text/javascript">
function load_home() {
     document.getElementById("content").innerHTML='<object type="text/html" data="route2.html" ></object>';
}
function clickRoute1() 
{
    var route1 = document.getElementsByClassName("mvp1");
  var route2 = document.getElementsByClassName("mvp2");
    if(route1[0].style.display == "none")
  {
    route1[0].style.display = "block";
    route2[0].style.display = "none";
  }
}
function clickRoute2() 
{
    var route1 = document.getElementsByClassName("mvp1");
  var route2 = document.getElementsByClassName("mvp2");
    if(route2[0].style.display == "none")
  {
    route2[0].style.display = "block";
    route1[0].style.display = "none";
  }
}
</script>

  <script type="text/javascript" src="imagemagnify.js"></script>


<div id="route-sec" class="container set-pad" >
  <div class="row text-center">
    <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
      <h1 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line">ROUTES</h1>
        <p data-scroll-reveal="enter from the bottom after 0.3s" >PUNE METRO HAS 2 ROUTES<br>
          <div class="route">
              <a  href="#route" class="btn btn-primary btn-lg" onclick="clickRoute1();" >ROUTE 1 </a>  <a  href="#route" class="btn btn-primary btn-lg" onclick="clickRoute2();" >ROUTE 2 </a><br>
          </div>
          <p data-scroll-reveal="enter from bottom after 0.4s">
          <div class="mvp1">
            <div class="r1">
              <ul class="squ">
                <a href="pcmc.html"><li class="r11">PCMC</li><br></a>
                <a href="tukaramnagar.html"><li class="r11">Sant Tukaram Nagar</li><br></a>
                <a href="bhosari.html"><li class="r11">Bhosari</li><br></a>
                <a href="kasarwadi.html"><li class="r11">Kasarvadi</li><br></a>
                <a href="phugewadi.html"><li class="r11">Phugewadi</li><br></a>
              </ul>
            </div>
            <div class="r1">
              <ul class="squ">
                <a href="dapodi.html"><li class="r22">Dapodi</li><br></a>
                <a href="bopodi.html"><li class="r22">Bopodi</li><br></a>
                <a href="khadaki.html"><li class="r22">Khadki</li><br></a>
                <a href="rangehills.html"><li class="r22">Range Hills</li><br></a>
                <a href="shivajinagar.html"><li class="r22">Shivajinagar</li><br></a>
              </ul >
            </div>
            <div class="r1"> 
              <ul class="squ">
                <a href="civilcourt.html"><li class="r33">Civil Court</li><br></a>
                <a href="bughwarpeth.html"><li class="r33">Budhwar Peth</li><br></a>
                <a href="mandai.html"><li class="r33">Mandai</li><br></a>
                <a href="swargate.html"><li class="r33">Swargate</li><br></a>
              </ul>
            </div>
           <!-- <div class="r1">
              <div class="map">
                <img src="map1.jpeg" class="mappy">
              </div>
            </div> -->
          </div>

          <div class="mvp2" style="display:none">
            <div class="r1">
              <ul class="squ">
                <a href="vanaz1.html"><li class="r11">Vanaz</li><br></a>
                <a href="anandnagar.html"><li class="r11">Anand Nagar</li><br></a>
                <a href="idealcolony.html"><li class="r11">Ideal Colony</li><br></a>
                <a href="nalstop.html"><li class="r11">Nal Stop</li><br></a>
                <a href="garwarecollege.html"><li class="r11">Garware College</li><br></a>
                <a href="deccangymkhana.html"><li class="r11">Deccan Gymkhana</li><br></a>
              </ul>
            </div>
            <div class="r1">
              <ul class="squ">
                <a href="sambhajiudyan.html"><li class="r22">Chhatrapati Sambhaji Udyan</li><br></a>
                <a href="pmc.html"><li class="r22">PMC</li><br></a>
                <a href="civilcourt.html"><li class="r22">Civil Court</li><br></a>
                <a href="mangalwarpeth.html"><li class="r22">Mangalwar Peth</li><br></a>
                <a href="railwaystation.html"><li class="r22">Pune Railway Station</li><br></a>
                <a href="rubyhall.html"><li class="r22">Ruby Hall Clinic</li><br></a>
              </ul >
            </div>
            <div class="r1"> 
              <ul class="squ">
                <a href="bundgarden.html"><li class="r33">Bund Garden</li><br></a>
                <a href="yerwada.html"><li class="r33">Yerawada</li><br></a>
                <a href="kalyaninagar.html"><li class="r33">Kalyani Nagar</li><br></a>
                <a href="ramwadi.html"><li class="r33">Ramwadi </li><br></a>
              </ul>
            </div>
          </div>
        </p>
            <div class="r1">
              <div class="img-thumbnail">
                <img src="assets/img/map1.jpeg" class="img-thumbnail">
                <script>magnify("assets/img/map1.jpg",3);</script>
              

              </div>
            </div>
        </div>
      </p>
    </div>
 </div> 
</div>





   
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
