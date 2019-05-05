

<%@page import="inception.delivery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function up(id)
            {
                var qty = parseInt(document.getElementById("a_" + id).value);
                qty++;
                document.getElementById("a_" + id).value = qty;
            }
            function down(id)
            {
                var qty = parseInt(document.getElementById("a_" + id).value);
                qty--;
                if (qty <= 0)
                {
                    qty = 0;
                }
                document.getElementById("a_" + id).value = qty;
            }

            var xmlhttp;
            function add(id)
            {
                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                var qty = document.getElementById("a_" + id).value;

                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "AddToCart.jsp?id=" + id + "&qty=" + qty, true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    alert("Item updated in cart");
                    window.location = "view_cart.jsp"
                }
            }

            function rem(id)
            {
                xmlhttp = new XMLHttpRequest();       
                var flag = confirm("Are you sure , you want to remove item from cart ?");
                if (flag)
                {
                    xmlhttp.onreadystatechange = go22;
                    xmlhttp.open("GET", "remove_cart.jsp?id=" + id, true);
                    xmlhttp.send();
                }
            }
            function go22()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    window.location = "view_cart.jsp";
                }
            }
            function check()
            {
                window.location = "checkout.jsp"
            }
        </script>
    </head>
    <body style="background-color: #F4F4F4;">
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
         <br>
           <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">Your Cart</h1>
            <br/>
                <br>
                <%@page import="inception.cart" %>
                <%@page import="java.util.ArrayList"%>
                <%@page import="java.sql.*" %>
                <%
                    ArrayList<inception.cart> al = (ArrayList<inception.cart>) (session.getAttribute("cart"));
                    
                    ArrayList<inception.delivery> al2 = new ArrayList<inception.delivery>();

                    int total2 = 0;

                    if (session.getAttribute("cart") == null || al.size() == 0) {

                %>
                <h1 align="center"> your cart is empty  </h1>

                <%                } else {
                %>
                <table class="table table-hover">
                    <tbody>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                            Statement stmt = conn.createStatement();
                            ResultSet rs;

                            for (int i = 0; i < al.size(); i++) {

                                String rest = al.get(i).restaurant;
                                boolean traverse = true;
                                for (int j = i - 1; j >= 0; j--) {
                                    if (al.get(j).restaurant.equals(rest)) {
                                        traverse = false;
                                        break;
                                    }
                                }
                                if (traverse) {

                                    int rest_total = 0;
                        %>
                        <tr style="background-color: lightgrey;"> 
                            <td colspan="8" style="font-size: 25px;color: darkred;"><b>Restaurant - <%=rest%></b></td></tr>
                        <tr>
                            <th>S.NO</th>
                            <th>Name</th>
                            <th>Photo</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total Price</th>
                        </tr>
                        <%
                            for (int j = 0; j < al.size(); j++) {
                                if (al.get(j).restaurant.equals(rest)) {

                                    rs = stmt.executeQuery("select * from menu  where menu_id='" + al.get(j).menuid + "'");
                                    rs.next();
                        %>

                        <tr>

                            <td> <br/><%=(j + 1)%> </td>
                            <td><br/><%=rs.getString("name")%></td>
                            <td><img src="<%=rs.getString("photo")%>" height="80" width="80" style="border-radius: 5px;"></td>
                            <td><br/><input onclick="down('<%=al.get(j).menuid%>')" type="button" value="-" style="width: 25px;background-color: darkred;border: none;color: white;">
                                <input type="text" style="width:20px;" id="a_<%=al.get(j).menuid%>" value="<%=al.get(j).qty%>" readonly>
                                <input type="button" onclick="up('<%=al.get(j).menuid%>')" value="+" style="width: 25px;background-color: green;border: none;color: white;">
                            </td>
                            <td>
                                <br/><%=rs.getString("price")%>
                            </td>
                            <td>
                                <%
                                    int price = Integer.parseInt(rs.getString("price"));
                                    int total = price * al.get(j).qty;
                                    total2 += total;
                                    rest_total += total;
                                %>
                                <br/><%=total%>
                            </td>

                            <td><br/>
                                <a href="#" onclick="add('<%=al.get(j).menuid%>')" class="btn btn-success">Update Cart</a>
                            </td>
                            <td><br/>
                                <a href="#" onclick="rem('<%=j%>')" class="btn btn-primary">Remove Cart</a>
                            </td>

                        </tr>

                        <%

                                }
                            }

                        %>

                        <tr>
                            <td colspan="8" style="font-size: 18px;">Sub-Total : <%=rest_total%> </td>
                        </tr>
                        <tr>
                            <td colspan="8" style="font-size: 18px;">Tax : <%= (int) (rest_total * 0.14)%> </td>
                        </tr>
                        <tr>
                            <td colspan="8" style="font-size: 18px;">Total : <%=(int) (rest_total + (rest_total * 0.14))%> </td>
                        </tr>

                        <%
                            int rt = (int) (rest_total + (rest_total * 0.14));

                            rs = stmt.executeQuery("select * from restaurant where username='" + rest + "'");
                            rs.next();
                            int min = Integer.parseInt(rs.getString("min_order"));
                            int dc = Integer.parseInt(rs.getString("delivery_charges"));
                            int fd = Integer.parseInt(rs.getString("free_delivery_above"));

                            boolean flag = true;
                            int dvc = 0;
                            if (rt < min) {
                                flag = false;
                        %>
                        <tr>
                            <td colspan="8" style="font-size: 18px;color: red;">Minimum order for delivery is - <%=min%></td>
                        </tr>
                        <tr>
                            <td colspan="8" style="font-size: 18px;color: red;"><b>Order for <%=rest%> cannot be processed</b></td>
                        </tr>

                        <%
                            } else {
                                flag = true;
                            

                            
                            if (rt < fd) {
                                dvc = dc;
                        %>

                        <tr>
                            <td colspan="8" style="font-size: 18px;color: red;">****** Minimum order for free home delivery is - <%=fd%> and delivery charges are - <%=dc%> ******</td>
                        </tr>
                        <%
                            }
                            }
                            al2.add(new delivery(rest, flag, dvc));
                        %>
                        <%
                            }
                        %>

                        <tr><td colspan="8">&nbsp;</td></tr>
                        <%
                            }
                        %>

                </table>
               

                <%
                    session.setAttribute("deliver", al2);
                    
    }
                
                %>
            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
