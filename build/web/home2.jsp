
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Genius Kitchen - Made By Rhythm</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body style="background-color: #F4F4F4;">
         <%@page import="java.sql.*" %>
        <jsp:include page="bikheader.jsp"/>
        <img src="images/image.jpg" width="100%" height="30%"/>
        <div class="container-fluid"><br/>
           
             <h1 style="font-family: Brush Script MT, cursive;font-size: 50px;color: darkred;" align="center">Results</h1>
            <table align='center'>
                
        <%
            String city, food;
            city = request.getParameter("city");
           // food = request.getParameter("food");

            //food = food.trim();
            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt = conn.createStatement();
          //  ResultSet rs = stmt.executeQuery("select restaurant.* from restaurant inner join restaurant_menu_category "
          //          + " on restaurant.username=restaurant_menu_category.username inner join restaurant_menu_subcategory on  "
          //          + " restaurant_menu_category.rmid=restaurant_menu_subcategory.rm_id where city='"+city+"' and restaurant_menu_subcategory.sub_name='"+food+"'");
          //  System.out.println("result set created");
           // if (food.equals("")) {

               ResultSet rs = stmt.executeQuery("select distinct restaurant.* from restaurant inner join restaurant_menu_category "
                        + " where city='"+ city +"' and status=\'approved\'");
           // }
            int i=0;
        %>
        
            <%
                while (rs.next()) {
                    if(i%3==0)
                    {
            %>
            </tr><tr>
            <%
                    }
                    i++;
                    
            %>
            <td>
                <table width="400px" style="color:black;">
                    <tr align="center" >
                        <td colspan="2"><img src="<%=rs.getString("logo")%>" height="300" width="300" style="border-radius: 15px 50px 30px;box-shadow: 0 4px 40px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"/> <td>
                    </tr>
                    <tr align="center">
                        <td colspan="2"><span style="font-family: cursive; font-size: 22px; font-weight: bold;"><%=rs.getString("username")%></span></td>
                    </tr>
                    <tr align="center">
                        <td><br/><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Address</span></td>
                        <td><br/><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("address")%></span></td>
                    </tr>
                    <tr align="center">
                        <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">(M)</span></td>
                        <td><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("contact_no")%></span></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2"><br/><a href="home3.jsp?user=<%=rs.getString("username")%>" style="padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: green;">View Menu</a></td>
                    </tr>
                </table><hr/>
            </td>
            <%
                }
            %>
        
            </table>
       </div>
       <%@include file="footer.jsp"%>
    </body>
</html>
