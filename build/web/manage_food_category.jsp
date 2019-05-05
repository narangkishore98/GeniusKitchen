
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>manage food category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
        <%@page import="java.sql.*" %>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from food_category");
            System.out.println("result set created");
            

        %>
        <form action="manage_food_category2.jsp" method="post">
            <h1 align="center"> Choose cuisine </h1>

            <table class="table table-striped" align="center">
                <tr>

                    <%  
                       while (rs.next()) {
                    %>
                    <td><input type="checkbox" name="<%=rs.getString("fc_name")%>"

                               <%
                                   Class.forName("com.mysql.jdbc.Driver");
                                   System.out.println("Driver loaded successfully");
                                   Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                   System.out.println("connection with database success");
                                   Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                   ResultSet rs2 = stmt2.executeQuery("select * from restaurant_category where username='" + session.getAttribute("rest") + "'");
                                   System.out.println("result set created");
                                   while (rs2.next()) {
                                       
                                       if (rs.getString("fc_name").equals(rs2.getString("fc_name"))) {
                               %>
                               checked="checked"
                               <%            
                                       }
                                   }
                               %>

                               > <b><%=rs.getString("fc_name")%></b> </td>
                    <td style="width: 80%;"><%=rs.getString("description")%></td>
                    <td><img src="<%=rs.getString("logo")%>" height="70" width="70"/></td>

                </tr>
                <%
                        
                    }
                %>
                <tr>
                    <td align="center" colspan="4">
                        <input type="submit" value="Manage" class="btn btn-danger">
                        
                    </td>

                </tr>
            </table>
        </form>
                </div>
                            <%@include file="footer.jsp"%>
    </body>
</html>
