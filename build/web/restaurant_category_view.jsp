

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
        <script>
            
           function go()
               {
                   return confirm(" are you sure you want to delete?");
               } 
        </script>
    </head>
   <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
        <%@page import="java.sql.*" %>

        <%
            String username = (String) session.getAttribute("rest");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with daabase success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_menu_category where username=\'" + username + "\'; ");
            System.out.println("result set created");
        %>

        <form action="" method="post" >
            <h2 align="center">Restaurant Menu Category </h2>
            <table class="table table-striped">
                <tr style="background-color: lightgray;">

                        <th>S.NO</th>
                        <th> category name</th>
                        <th>description</th>
                        <th>Photo</th>
                        <th>Delete</th>
                        <th>Change Photo</th>
                        <th>Edit</th>
                    </tr>
                    <%
            int i =1;
                        while(rs.next()) {

                    %> 
                    <tr>
                        <td><%=i++%> </td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("description")%></td>
                        
              

                        <td><img src="<%=rs.getString("photo")%>" width="100" height="100"/></td>
                        <td><a href="restaurant_category_delete.jsp?p=<%=rs.getString("rmid")%>" onclick="return go()">Delete</a></td>
                        <td><a href="restaurant_category_change_photo.jsp?p=<%=rs.getString("rmid")%>">Change Photo</a></td>
                        <td><a href="restaurant_category_edit.jsp?p=<%=rs.getString("rmid")%>">Edit</a></td>
                    </tr>
                    <%

                        }
                    %>
            </table>
                    </div>
                            <%@include file="footer.jsp"%>
    </body>
</html>
