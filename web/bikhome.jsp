<html>
    <head>
        <title>Genius Kitchen - Project Made By Rhythm (2016CSC1088)</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <style>
            /* Slider */
            .slick-slide {
                margin: 0px 20px;
            }
            .slide{
                max-height: 200px;
            }

            .slick-slide img {
                width: 100%;
            }

            .slick-slider
            {
                position: relative;
                display: block;
                box-sizing: border-box;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                        user-select: none;
                -webkit-touch-callout: none;
                -khtml-user-select: none;
                -ms-touch-action: pan-y;
                    touch-action: pan-y;
                -webkit-tap-highlight-color: transparent;
            }

            .slick-list
            {
                position: relative;
                display: block;
                overflow: hidden;
                margin: 0;
                padding: 0;
            }
            .slick-list:focus
            {
                outline: none;
            }
            .slick-list.dragging
            {
                cursor: pointer;
                cursor: hand;
            }

            .slick-slider .slick-track,
            .slick-slider .slick-list
            {
                -webkit-transform: translate3d(0, 0, 0);
                   -moz-transform: translate3d(0, 0, 0);
                    -ms-transform: translate3d(0, 0, 0);
                     -o-transform: translate3d(0, 0, 0);
                        transform: translate3d(0, 0, 0);
            }

            .slick-track
            {
                position: relative;
                top: 0;
                left: 0;
                display: block;
            }
            .slick-track:before,
            .slick-track:after
            {
                display: table;
                content: '';
            }
            .slick-track:after
            {
                clear: both;
            }
            .slick-loading .slick-track
            {
                visibility: hidden;
            }

            .slick-slide
            {
                display: none;
                float: left;
                height: 100%;
                min-height: 1px;
            }
            [dir='rtl'] .slick-slide
            {
                float: right;
            }
            .slick-slide img
            {
                display: block;
            }
            .slick-slide.slick-loading img
            {
                display: none;
            }
            .slick-slide.dragging img
            {
                pointer-events: none;
            }
            .slick-initialized .slick-slide
            {
                display: block;
            }
            .slick-loading .slick-slide
            {
                visibility: hidden;
            }
            .slick-vertical .slick-slide
            {
                display: block;
                height: auto;
                border: 1px solid transparent;
            }
            .slick-arrow.slick-hidden {
                display: none;
            }
        </style>
    </head>
    <body>
        <%@include file="bikheader.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <img src="images/home-img.jpg" width="100%" height="80%"/>
                </div>
            </div>
            <div class="row p-5 bg-light">
                <div class="col-md-12 text-center">
                    <h1>Start Searching Restaurants  Now.</h1>
                          <%@page import="java.sql.*" %>
                <form action="home2.jsp" method="post">
                    <br/>
                    <div class="row p-">
                        <div class="col-md-8">
                  <select name="city" class="form-control">
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Driver loaded successfully");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                    System.out.println("connection with database success");
                                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                    ResultSet rs = stmt.executeQuery("select * from city");
                                    System.out.println("result set created");

                                    while (rs.next()) {
                                %>  
                                <option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
                                <%
                                    }
                                %>      

                            </select>
                        </div>
                                <div class="col-md-4">
                          <input type="submit" class="btn btn-outline-dark btn-block" value="Find Restaurants" />
                     
                                </div>
                                </div>
                </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 bg-dark p-5 text-white text-center">
                    <p class="h1">Get ready food at your doorstep!</p>
                    <p>Our partner restaurants are always ready to serve you with their best and delicious services. Just sign up and start ordering. </p>
                    <p class="h3 text-light text-uppercase ">You are genius now.</p>
                </div>
                <div class="col-md-6 center-block p-5 bg-dark">
                    <center>
                        <img src="images/logo-white.png" class="img-responsive" width="50%"/>
                    </center>
                </div>
            </div>
            <div class="row" style="background-image: linear-gradient(#343A40, #FFF);">
                <div class="col-md-12 p-5">
                    <h1 class="text-center mt-5">
                        
                    </h1>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 p-5">
                    <h1 class="text-center ">
                        Hungry? Grab the tasty food ready in 30 mins.
                    </h1>
                    <center>
                    <a style="display: inline-block;" href="#"class="btn btn-outline-dark text-center mt-3" >Create A new Account Today</a>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center mt-5">Our Top Restaurant Partners</h1>
                    <div class="container mt-5">
                        <section class="customer-logos slider">
                        <div class="slide"><img src="images/image1.png"></div>
                        <div class="slide"><img src="images/image2.png"></div>
                        <div class="slide"><img src="images/image3.png"></div>
                        <div class="slide"><img src="images/image4.png"></div>
                        <div class="slide"><img src="images/image5.png"></div>
                        <div class="slide"><img src="images/image6.png"></div>
                        <div class="slide"><img src="images/image7.jpg"></div>
                        <div class="slide"><img src="images/image8.png"></div>
                        <div class="slide"><img src="images/image9.jpg"></div>
                        <div class="slide"><img src="images/image10.jpg"></div>
                      </section>
                    </div>
                </div>
            </div>
            
            <div class="row bg-dark text-white">
                <div class="col-md-6">
                    Project By Rhythm
                </div>
                <div class="col-md-6">
                    Made By Bikloo
                </div>
            </div> 
        </div>
        <script>
            $(document).ready(function(){
                $('.customer-logos').slick({
                  slidesToShow: 6,
                  slidesToScroll: 1,
                  autoplay: true,
                  autoplaySpeed: 1000,
                  arrows: false,
                  dots: false,
                  pauseOnHover: false,
                  responsive: [{
                    breakpoint: 768,
                    settings: {
                      slidesToShow: 4
                    }
                  }, {
                    breakpoint: 520,
                    settings: {
                      slidesToShow: 3
                    }
                  }]
                });
              });
        </script>
    </body>
</html>