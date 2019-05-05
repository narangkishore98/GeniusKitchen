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

if(session.getAttribute("rest")== null)
{
    response.sendRedirect("home.jsp");
}
%>
<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="restauranthome.jsp" style="font-family: Brush Script MT, cursive;font-size: 50px;color: orange;">Genius Kitchen</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Profile
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="manage_food_category.jsp">Manage Food Category</a></li>
          <li><a href="edit_restaurant_info.jsp">Edit my Info</a></li>
          <li><a href="edit_restaurant_pic.jsp">Change my Photo</a></li>
          <li><a href="restaurant_gallery.jsp"><span>Manage my gallery</a></li>
          <li><a href="change_rest_password1.jsp">Change Password</a></li>
          <li><a href="logout.jsp">Logout</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Menu Category
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="restaurant_menu_category.jsp">Add menu category</a></li>
          <li><a href="restaurant_category_view.jsp">View menu category</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Sub Menu
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="restaurant_submenu_category.jsp">Add sub Menu</a></li>
          <li><a href="restaurant_submenu_category_view.jsp">View Sub Menu</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Food Item
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="add_menu.jsp">Add Food Item</a></li>
          <li><a href="view_menu.jsp">View Food Items</a></li>
        </ul>
      </li>
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
