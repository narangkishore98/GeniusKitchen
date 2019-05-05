<%@page import="java.util.ArrayList"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="images/logo.png" width="100px"/>
    </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="bikhome.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <%
          if(session.getAttribute("user")!=null)
          {
      %>
      <li class="nav-item active">
        <a class="nav-link" href="change_user_password1.jsp">Change Password</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="previous_orders_history.jsp">Order History</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="logout.jsp">Logout</a>
      </li>
      
      <%
          }
          else
          {
      %>
      
      <li class="nav-item active">
        <a class="nav-link" href="add_restaurant.jsp">Restaurant Signup</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="restaurantlogin1.jsp">Restaurant Login</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="user_signup.jsp">User Signup</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="user_login.jsp">User Login</a>
      </li>
      <%
          }
           int count = 0;
                            ArrayList<inception.cart> al_session = (ArrayList<inception.cart>) (session.getAttribute("cart"));
                            if(session.getAttribute("cart")!=null)
                            {
                                count = al_session.size();
                            }
                            
                        %>
                        
                        <li class="nav-item active">
                            <a class="nav-link" href="view_cart.jsp">My Cart(<%=count%>)</a>
                          </li>
                        <%
                        if(count>0)
                        {   
                            %>
                            <li class="nav-item active">
                            <a class="nav-link" href="checkout.jsp">Checkout</a>
                          </li>
                        <%
                        }
                        %>
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>