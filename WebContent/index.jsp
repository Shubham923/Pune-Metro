<%@page import="querySet.QuerySet" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Home | Pune Metro</title>
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="bootstrap_1.css" rel="stylesheet" />
    <!-- FONT AWESOME CSS -->
<link href="assets/css/font-awesome.min.css" rel="stylesheet" />
     <!-- FLEXSLIDER CSS -->
<link href="flexslider.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="style_1.css" rel="stylesheet" />    
  <!-- Google	Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
</head>
<style>.announcement {
  display: inline-block;
  height: 100%;
  text-align: center;
  width: 100%;
  background: #ffff0;
  color: red;
  font-family: Arial, sans;
  margin: 0;
  padding: 0;
  vertical-align: middle;
  font-size: 0.8em;
}

.announcement a { 
  color: #ccc; 
}

.announcement a:hover {
  color: red;
}</style>
<body >
<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);


%>
     <div class="announcement">
    <p>Announcement Here!&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="">Full Story ></a></p>
  </div>
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
                     <li><a href="#features-sec">FEATURES</a></li>
                      <li><a href="#route-sec">ROUTES</a></li>
                    <li><a href="#faculty-sec">FACILITIES</a></li>
                     <li><a href="#course-sec">TEAM</a></li>
                    
                     <li><a href="userloginnew.jsp">LOGIN</a></li>
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
                             <a  href="fare.jsp" class="btn btn-success btn-lg" >
                                GET FARE
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
                             <a  href="fare.jsp" class="btn btn-success btn-lg" >
                                GET FARE
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
               
        <h2 data-scroll-reveal="enter from the bottom after 0.1s" ><i class="fa fa-circle-o-notch"></i> WELCOME TO THE PUNE METRO <i class="fa fa-circle-o-notch"></i> </h2>
                   </div>
               </div>
             </div>
             <%
             ServletContext context=getServletContext();
             context.setAttribute("loginFailed", false);
        QuerySet qs=new QuerySet();
        String check=qs.IsWorking();
        System.out.print(check);
        if(check!=null)
        {
        %>
             <div class="announcement">
    <p><%=check %>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>
  </div>
  <%} %>
        
    </div>
    <!--HOME SECTION TAG LINE END-->   
         <div id="features-sec" class="container set-pad" >
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line">FEATURE LIST </h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s" >
                     Operational: 0 km | Under Construction: 10.795 km | Approved: 20.459 km | Proposed: 23.33 km<br>

<b>Line-1 </b><br>Pimpri Chinchwad Municipal Corporation – Swargate: 16.589 km with 15 stations<br>
Elevated: PCMC – Shivaji Nagar: 11.570 km, 9 stations<br>
Underground: Shivaji Nagar – Swargate: 5.019 km, 6 stations<br>

<b>Line-2</b> <br> Vanaz – Ramwadi – 14.665 km with 16 stations
Type: Elevated<br>

<b>Line-3 </b><br> Hinjawadi – Shivaji Nagar – 23.33 km with 23 stations
Type: Elevated
                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->


           <div class="row" >
           
               
               <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.4s">
                     <div class="about-div">
                     <i class="fa fa-paper-plane-o fa-4x icon-round-border" ></i>
                   <h3 >Quality SERVICE </h3>

                 <hr />
                       <hr />
                   <p >
                       Pune Metro provides safe, reliable, comfortable service to passengers.
                       
                   </p>
                </div>
                   </div>
                   <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.5s">
                     <div class="about-div">
                     <i class="fa fa-bolt fa-4x icon-round-border" ></i>
                   <h3 >SYSTEMATIC APPROACH</h3>
                 <hr />
                       <hr />
                   <p >
                       Pune Metro follow best systematic approach to provide service to passengers as per the new evoloving technology. 
                       
                   </p>
                </div>
                   </div>
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.6s">
                     <div class="about-div">
                     <i class="fa fa-magic fa-4x icon-round-border" ></i>
                   <h3 >Centre of Excellence</h3>
                 <hr />
                       <hr />
                   <p >
                       Pune Metro has established a 'Centre of Excellence for Training' that is imparting a specialised training to all its newly recruited staff and officers to infuse a sense of belongingness among them.
                       
                   </p>
                </div>
                   </div>
                 
                 
               </div>
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

  <script type="text/javascript" src="assets/js/imagemagnify.js"></script>


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
                <script>magnify("map1.jpg",3);</script>
              

              </div>
            </div>
        </div>
      </p>
    </div>
 </div> 
</div>





    <div id="faculty-sec" >
    <div class="container set-pad">
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.1s" class="header-line">OUR FACILITIES </h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s">
                     We are willing to provide you the world class travelling experience through most awaited Pune Metro Rail Project. Pune Metro project has been undertaken by MAHA Metro, a SPV (Special Purpose Vehicle) of Government of India and Government of Maharashtra. The project intends to develop world class stations and surrounding areas to showcase the rich cultural heritage, journey of various social reformation that started from the city.
                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->

           <div class="row" >
           
               
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.4s">
                     <div class="faculty-div">
                     <img src="wifi.jpg"  class="img-rounded" />
                   <h3 >FREE WIFI </h3>
                 <hr />
                   <p >
                      Enjoy speedy Wi-Fi and discover more of what the internet can offer. Free Wi-Fi Hotspots are availabe on each station as well as in the metro train.
                       
                   </p>
                </div>
                   </div>
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.5s">

                     <div class="faculty-div">
                     <img src="disabled.jpg"  class="img-rounded" />
                   <h3 >SERVICE TO EVERYONE</h3>
                 <hr />
                         
                   <p >
                      We provide special service for differently abled persons throughout their travel span. Also, medical assistance is provided on each station for emergency purpose.
                       
                   </p>
                </div>
                   </div>
               <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.6s">
                     <div class="faculty-div">
                     <img src="rvct.jpg" class="img-rounded" />
                   <h3 >RVCT</h3>
                 <hr />
                   <p >
                       A Remaining Value Checking Terminal (RVCT) is installed near Customer Care to enable passengers check balance and previous transactions on their tokens and smart card  
                       
                   </p>
                </div>
                   </div>
                 
               </div>
             </div>
        </div>
    <!-- FACULTY SECTION END-->
      <div id="course-sec" class="container set-pad">
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.1s" class="header-line">OUR TEAM </h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s">
                      We have team of 500+ members and they are putting their efforts to run Pune Metro as early as possible.
                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->


           <div class="row set-row-pad" >
           <div class="col-lg-6 col-md-6 col-sm-6 " data-scroll-reveal="enter from the bottom after 0.4s" >
                 <img src="assets/img/8.jpg" class="img-thumbnail" />
           </div>
               <div class="col-lg-4 col-md-4 col-sm-4 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
                   <div class="panel-group" id="accordion">
                        <div class="panel panel-default" data-scroll-reveal="enter from the bottom after 0.5s">
                            <div class="panel-heading" >
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="collapsed">
                                  <strong>   350+</strong> TECHNICAL STAFF
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse" style="height: 0px;">
                                <div class="panel-body">
                                    <p></p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default" data-scroll-reveal="enter from the bottom after 0.7s">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="collapsed">
                                      <strong>   250+</strong> NON-TECHNICAL STAFF
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse" style="height: 0px;">
                                <div class="panel-body">
                                    <p>
                                       
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default" data-scroll-reveal="enter from the bottom after 0.9s">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="collapsed">
                                        <strong>   153+</strong> MANAGEMENT STAFF 
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse"  style="height: 0px;">
                                <div class="panel-body">
                                    <p>
                                       
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                   <div class="alert alert-info" data-scroll-reveal="enter from the bottom after 1.1s" >
                       <span style="font-size:40px;">
                          <strong> 50 + </strong> 
                           <hr />
                           Stations 
                       </span>
                   </div>
           </div>
             
                 
                 
               </div>
             </div>
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
                     <form action="Queries" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control " name="name" required="required" placeholder="Your Name" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control " name="email" required="required"  placeholder="Your Email" />
                        </div>
                        <div class="form-group">
                            <textarea name="message" required="required" class="form-control" style="min-height: 150px;" placeholder="Message"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-info btn-block btn-lg" value="SUBMIT REQUEST"/>
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
