<%@page import="inception.cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
        <link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
            var xmlhttp;
            function go(id)
            {
                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                var qty = document.getElementById("a_" + id).value;
                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "AddToCart.jsp?id=" + id + "&qty=" + qty, true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    //document.getElementById("pic").innerHTML = xmlhttp.responseText;
                }
            }

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
        </script>
    </head>
     <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
            <br/>
        <%
            String user;
            user = request.getParameter("user");

            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from restaurant where username='" + user + "'");
            System.out.println("result set created");

            rs.next();
        %>
        <table align='center'>
            <tr>
                <td colspan="2"><img src="<%=rs.getString("logo")%>" height="250" width="250" style="border-radius: 15px 50px 30px;"/> <td>
                <td>
                    <table>
                        <tr>
                            <td colspan="2"><span style="font-family: Brush Script MT, cursive;font-size: 55px;color: darkred;" align="center"><%=rs.getString("username")%></span><br/></td>
                        </tr>
                        <tr>
                            <td><span style="font-family: sans-serif,cursive; font-size: 16px;line-height: 1.5;font-weight: bold;">Address</span></td>
                            <td><span style="font-family: cursive;line-height: 1.5; font-size: 14px;"><%=rs.getString("address")%></span></td>
                        </tr>
                        <tr>
                            <td><span style="font-family: sans-serif,cursive; font-size: 16px;line-height: 1.5; font-weight: bold;">Phone Number:</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;line-height: 1.5;"><%=rs.getString("contact_no")%></span></td>
                        </tr>
                        <tr>
                            <td><span style="font-family: sans-serif,cursive; font-size: 16px;line-height: 1.5; font-weight: bold;">Delivery In</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;line-height: 1.5;"><%=rs.getString("delivery_in")%></span> minutes</td>
                        </tr>
                        <tr>
                            <td><span style="font-family: sans-serif,cursive; font-size: 16px; line-height: 1.5;font-weight: bold;">Delivery charges</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;line-height: 1.5;"><%=rs.getString("delivery_charges")%></span> rs</td>
                        </tr>
                        <tr>
                            <td><span style="font-family: sans-serif,cursive; line-height: 1.5;font-size: 16px; font-weight: bold;">Free Delivery Above</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;line-height: 1.5;"><%=rs.getString("free_delivery_above")%></span> rs</td>
                        </tr>
                        <tr style="height: 50px; font-size: 22px;">
                            <td><a href="view_gallery.jsp?user=<%=user%>" style="padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: green;">Gallery</a></td>
                            <td><a href="comment.jsp?user=<%=user%>" style="padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: royalblue;"> Post a Review</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="index.jsp?lat=<%=rs.getString("latitude")%>&long=<%=rs.getString("longitude")%>&user=<%=user%>" style="padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: darkred;">Location</a></td>
                        </tr>
                    </table>
                </td>
            </tr>   
        </table>
        <br>
        <hr>
        <br>
                        
        <%
            String user2;
            user2 = request.getParameter("user");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select food_category.* from food_category inner join restaurant_category on  restaurant_category.fc_name=food_category.fc_name where username=\'" + user2 + "\'");
            System.out.println("result set created");
        %>
        <center>
            <span style="font-family: Brush Script MT, cursive;font-size: 40px;color: darkred;">Cuisines Served</span>
            <table>
              <tr>
                    <%
                        while (rs2.next())
                        {
                    %>
                    <td style="text-align: center;">
                        <img src="<%=rs2.getString("logo")%>" height="150" width="150" style="border-radius: 10px;box-shadow: 5px 5px 10px darkgray"/>
                    <br>
                    <b><%=rs2.getString("fc_name")%></b>
                    </td>
                    <%
                        }
                    %>
                </tr>
            </table>
        <hr/>
       
        
        <div id="TabbedPanels1" class="TabbedPanels">
            <ul class="TabbedPanelsTabGroup">
                    <%
                        ArrayList<Integer> al = new ArrayList<>();
                        String user3;
                        user3 = request.getParameter("user");
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Driver loaded successfully");
                        Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                        System.out.println("connection with database success");
                        Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs3 = stmt3.executeQuery("select  *  from restaurant_menu_category where username=\'" + user3 + "\'");
                        System.out.println("result set created");
                        while (rs3.next())
                        {
                    %>
                    <li class="TabbedPanelsTab" tabindex="0"><%=rs3.getString("name")%></li>
                    <%
                            al.add(rs3.getInt("rmid"));
                        }
                    %>
            </ul>
                <div class="TabbedPanelsContentGroup">
                    <%
                        for (int i = 0; i < al.size(); i++) {

                            Class.forName("com.mysql.jdbc.Driver");
                            System.out.println("Driver loaded successfully");
                            Connection conn4 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                            System.out.println("connection with database success");
                            Statement stmt4 = conn4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs4 = stmt4.executeQuery("select  *  from restaurant_menu_subcategory where rm_id=\'" + al.get(i) + "\'");
                            System.out.println("result set created");
                    %>
                    <div class="TabbedPanelsContent">
                        <%
                            while (rs4.next()) {
                        %>
                            <h2><%=rs4.getString("sub_name")%></h2>
                            <img src="<%=rs4.getString("photo")%>" style="width: 950px; height: 250px;border-radius: 10px;box-shadow: 0px 2px 5px gray;">
                            <br>
                            <br>
                            <h3>Menu Items</h3>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                System.out.println("Driver loaded successfully");
                                Connection conn5 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                System.out.println("connection with database success");
                                Statement stmt5 = conn5.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs5 = stmt5.executeQuery("select  *  from menu where sub_category='" + rs4.getString("rms_id") + "'");
                                System.out.println("result set created");

                            %>
                            <table width="100%" align='center'>
                                <tr style="text-align: center;">
                                    <th></th>
                                    <th align='center'>Item</th>
                                    <th width="400">Description</th>
                                    <th>Price(in Rs.)</th>
                                    <th>Quantity</th>
                                    <th></th>
                                </tr>
                                <%
                                while (rs5.next()) 
                                {
                                        System.out.println(rs5.getString("name"));
                                %>
                                <tr align='left'>
                                    <td>
                                        <img src="<%=rs5.getString("photo")%>" height="100" width="100" style="border-radius: 7px;box-shadow: 0px 2px 5px gray;">
                                    </td>
                                    <td>
                                        <%=rs5.getString("name")%>
                                    </td>
                                    <td>
                                        <%=rs5.getString("description")%>
                                    </td>
                                    <td>
                                        <%=rs5.getString("price")%>
                                    </td>
                                    <td>
                                         <%
                                            int qty = 0;
                                            ArrayList<inception.cart> al2 = (ArrayList<cart>) session.getAttribute("cart");
                                            if (al2 != null) {
                                                for (int k = 0; k < al2.size(); k++) {
                                                    if (al2.get(k).menuid.equals(rs5.getInt("menu_id") + "")) {
                                                        qty = al2.get(k).qty;
                                                    }
                                                }
                                            }
                                        %>
                                        <input onclick="down('<%=rs5.getInt("menu_id")%>')" type="button" value="-" style="width: 25px;background-color: darkred;border: none;color: white;"> 
                                        <input type="text" style="width: 20px;" id="a_<%=rs5.getInt("menu_id")%>" value="<%=qty%>" readonly>
                                        <input type="button" onclick="up('<%=rs5.getInt("menu_id")%>')" value="+" style="width: 25px;background-color: green;border: none;color: white;">
                                    </td>
                                    <td align='center'>
                                        <a href="#" onclick="go('<%=rs5.getInt("menu_id")%>')" style="padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: #555;">Add to Cart</a>
                                    </td>
                                </tr>
                                <tr><td colspan="6"><hr/></td></tr>
                                <%
                                    }
                                %>
                            </table>
                            <br>
                            <br>
                        
                        <br>
                        <br>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>

                </div>
            </div>
            <script type="text/javascript">
                var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
            </script>
        
                </center>
            </div>
                    <%@include file="footer.jsp" %>




    </body>
</html>


