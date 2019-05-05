<%-- 
    Document   : restaurant_gallery2
    Created on : Apr 14, 2014, 12:33:51 PM
    Author     : LENOVO B560
--%>

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
    <body> 
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main">
        <%@page import="java.sql.*" %>
        <%@page import="inception.*" %>

        <%
            String path = getServletContext().getRealPath("/restaurant_gallery");
            String filename = request.getParameter("fn");
            String cap = request.getParameter("cap");

            System.out.println(filename);
            System.out.println("Path:: "+path);
            
            String ext = filename.substring(filename.lastIndexOf("."));

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select max(rpid) 'id' from restaurant_gallery");
            int id = -1;
            if(rs2.next())
            {
              id = rs2.getInt("id");
              id++;
            }

            filename = id + ext;
            inception.FileUploader.savefile(request, path, filename);

            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_gallery");

            System.out.println("result set created");

            rs.moveToInsertRow();
            rs.updateString("photo", "./restaurant_gallery/" + filename);
            rs.updateString("caption", cap);
            rs.updateString("username", session.getAttribute("rest").toString());
            rs.insertRow();
            
            response.sendRedirect("restaurant_gallery.jsp");
            out.println("photo added successfully");

        %>
</div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
