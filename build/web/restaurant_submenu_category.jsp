

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adding sub menu</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
         <script>
           function go(obj)
           {
               var image=document.getElementById("ff").value;
               var name=document.getElementById("name").value;
               var category=document.getElementById("category").value;
               var ext=image.substring(image.lastIndexOf("."));
               if(ext==".jpg"||ext==".jpeg"||ext==".png"||ext==".PNG"||ext==".JPG"||ext==".JPEG")
               {
                   obj.action = obj.action +"?image=" + ext + "&name=" + name + "&cat=" + category;
                   return true;
               }
               else
               {
                   alert("upload image files only");
                   return false;
               }
           }
            
        </script>
    </head>
    <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
        <%@page import="java.sql.*" %>
         <h2 align="center">Add Sub-Menu</h2>
         <form action="restaurant_submenu_category2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
            <table align="center">
                <tr>
                    <td>Sub-Menu  Name</td>
                    <td><input type="text" required name="name" id="name" required class="form-control"></td>
                </tr>
                <tr>
                    <td><br/>Category (to which food belongs)</td>
                    <td><br/><select name="category" id="category" class="form-control">
                            <%
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            System.out.println("Driver loaded successfully");
                            Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                            System.out.println("connection with daabase success");
                            Statement stmt=conn.createStatement();
                            ResultSet rs=stmt.executeQuery("select * from restaurant_menu_category where username=\'"+session.getAttribute("rest")+"\' ");
                            System.out.println("result set created");
                            System.out.println(session.getAttribute("rest"));
                            while(rs.next())
                            {
                          %>  
                          <option value="<%=rs.getInt("rmid")%>"><%=rs.getString("name")%></option>
                          <%
                            }
                          %>      
                            
                        </select></td>
                </tr>
                <tr>
                    <td><br/>Select image</td>
                    <td><br/><input type="file" name="file" id="ff" required class="form-control" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><br/><input type="submit" value=" Add " name="submit" class="btn btn-primary"></td>
                </tr>
            </table>
        </form><br/><br/>
            </div>
                <%@include file="footer.jsp"%>
    </body>
</html>
