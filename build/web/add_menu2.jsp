
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>inserting menu</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
           
            <div id="main" align="center">
                <span class="headings">Food Item added successfully</span>
                <br>
        <%@page import="java.sql.*" %>
       
        <%@page import="inception.*" %>
        <%
            String username = (String)session.getAttribute("rest");
            String item=request.getParameter("item");
            String desc=request.getParameter("desc");
            String price=request.getParameter("price");
            String cat=request.getParameter("cat");
            String subcat=request.getParameter("subcat");
         /*   String path = getServletContext().getRealPath("./restaurant_category");
            String filename = request.getParameter("image");
            System.out.println(filename);
            String ext = filename.substring(filename.lastIndexOf("."));
            filename = username + ext;
            inception.FileUploader.savefile(request, path, filename); */

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with daabase success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from menu");
            System.out.println("result set 1created");

            System.out.println();
            rs.moveToInsertRow();
                   
            rs.updateString("name",item);
            rs.updateString("description",desc);
            rs.updateString("price",price);
            rs.updateString("category",cat);
            rs.updateString("restaurant",username);
            rs.updateString("sub_category",subcat);
            rs.updateString("photo",null);
           
            rs.insertRow();
            
            String path=getServletContext().getRealPath("/menu");
            
            
            String filename=request.getParameter("image");
            System.out.println(filename);
            String ext=filename.substring(filename.lastIndexOf("."));
            
           
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn2=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt2=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE , ResultSet.CONCUR_UPDATABLE);
                ResultSet rs2=stmt2.executeQuery("select max(menu_id) 'id' from menu");
                
                System.out.println("result set2 created");
                
                int id=-1;
                if(rs2.next())
                {
                    id=rs2.getInt("id");
                }
                
                filename = id + ext;
                inception.FileUploader.savefile(request,path,filename);
                rs = stmt.executeQuery("select * from menu where menu_id='"+ id +"' ");
                if(rs.next())
                {
                  rs.updateString("photo","./menu/"+filename);
                  rs.updateRow();
                }
                response.sendRedirect("add_menu.jsp?msg=Menu Added Successfully");
               
        %>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
