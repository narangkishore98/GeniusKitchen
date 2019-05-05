<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
 
<style type="text/css">
    td
    {
        padding-left: 20px;
        padding-right: 20px;
    }
    a
    {
        font-size: 18px;
        color: #555;
    }
</style>


<%

if(session.getAttribute("un")== null)
{
    response.sendRedirect("home.jsp");
}
%>

<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="adminhome.jsp" style="font-family: Brush Script MT, cursive;font-size: 50px;color: orange;">Genius Kitchen</a>
    </div>
    <ul class="nav navbar-nav">
    
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">City
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="add_city.jsp">Add City</a></li>
          <li><a href="delete_city.jsp">Manage City</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Cuisine
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="add_fc1.jsp">Add Cuisine</a></li>
          <li><a href="view_cuisine.jsp">Manage Cuisine</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Restaurant
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="view_pending_restaurant.jsp">View Pending Restaurants</a></li>
          <li><a href="view_approved_restaurant.jsp">View Approved Restaurants</a></li>
        </ul>
      </li>
      <li><a href="change_password1.jsp">Change Password</a></li>
      <li><a href="logout.jsp">Logout</a></li>
    </ul>
  </div>
</nav>

 <!-- Slideshow Code -->
 <div style="width: 100%;">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
      <li data-target="#myCarousel" data-slide-to="7"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
          <img src="images/1.jpg" alt="Los Angeles" style="width:100%;height: 450px;">
        <div class="carousel-caption">
          <h3></h3>
          <p></p>
        </div>
      </div>

      <div class="item">
          <img src="images/2.jpg" alt="Chicago" style="width:100%;height: 450px;">
        <div class="carousel-caption">
          <h3>Spring Roll</h3>
          <p>I Love Spring Roll</p>
        </div>
      </div>
    
      <div class="item">
        <img src="images/3.jpg" alt="New York" style="width:100%;height: 450px;">
        <div class="carousel-caption">
          <h3>Dishes</h3>
          <p></p>
        </div>
      </div>
      <div class="item">
        <img src="images/4.jpg" alt="New York" style="width:100%;height: 450px;">
        <div class="carousel-caption">
          <h3>Burger</h3>
          <p>Yummy Veg. Burger</p>
        </div>
      </div>
      <div class="item">
        <img src="images/5.jpg" alt="New York" style="width:100%;height: 450px;">
        <div class="carousel-caption">
          <h3>Samosa</h3>
          <p>Yummy India Evening Snacks</p>
        </div>
      </div>
      <div class="item">
        <img src="images/6.jpg" alt="New York" style="width:100%;height: 450px;">
        <div class="carousel-caption">
          <h3>Noodles</h3>
          <p>   </p>
        </div>
      </div>
      <div class="item">
        <img src="images/7.jpg" alt="New York" style="width:100%;height: 450px;">
        <div class="carousel-caption">
          <h3>Pizza</h3>
          <p>Farm House Veg. Pizza</p>
        </div>
      </div>
      <div class="item">
        <img src="images/8.jpg" alt="New York" style="width:100%;height: 450px;">
        <div class="carousel-caption">
          <h3>Pasta</h3>
          <p>White Pasta</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
 </div>
