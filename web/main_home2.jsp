

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body style="background-color: #F4F4F4;">
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
         <br>
          <h1 style="font-family: Brush Script MT, cursive;font-size: 50px;color: darkred;" align="center">Results</h1>
          <br/>
        <%@page import="java.sql.*" %>
       <table width="100%">
        <%
                        //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement();
            ResultSet rs;

            rs = stmt.executeQuery("select  restaurant.* from restaurant inner join restaurant_category on restaurant.username=restaurant_category.username"
                    + " where city='" + session.getAttribute("city") + "' and restaurant_category.fc_name = '"+request.getParameter("cus")+"' and status=\'approved\'");
            int i = 0;
            while (rs.next()) 
            {
                if (i % 3 == 0)
                {
                    %>
                </tr><tr>
                <%
                }
                i++;
        %>
                <td>
                    <table width="400px">
                        <tr align="center" >
                            <td colspan="2"><img src="<%=rs.getString("logo")%>" height="300" width="300" style="border-radius: 15px 50px 30px;box-shadow: 0 4px 40px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"/> <td>
                        </tr>
                        <tr align="center">
                            <td colspan="2"><br/><span style="font-family: cursive; font-size: 22px; font-weight: bold;"><%=rs.getString("username")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Address</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("address")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Phone Number:</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("contact_no")%></span></td>
                        </tr>
                        <tr align="center">
                            <td colspan="2"><br/><a href="home3.jsp?user=<%=rs.getString("username")%>" style="padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: green;">View Menu</a></td>
                        </tr>
                    </table>
<hr/>
                </td>
                <%
                    }
                %>

        </table>

             </div>
                            <%@include file="footer.jsp"%>
    </div>
    </body>
</html>
