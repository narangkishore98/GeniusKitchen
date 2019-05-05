
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change photo</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
           function go(obj)
           {
               var name=document.getElementById("ff").value;
               var ext=name.substring(name.lastIndexOf("."));
               if(ext==".jpg"||ext==".jpeg"||ext==".png"||ext==".PNG"||ext==".JPG"||ext==".JPEG")
               {
                   obj.action = obj.action +"&fn=" + name;
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
                <h2>Choose Food Item Photo</h2>
                <%@page import="java.sql.*" %>
        
        <%
            String id;
            id=request.getParameter("id");
            String path="";
            
           
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE , ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from menu where menu_id=\'"+id+"\' ");
                System.out.println("result set created");
                
                if(rs.next())
                {
                     path=rs.getString("photo");
                }
        %>
        <img src="<%=path%>" height="300" width="300"  align="center"><br/>
        <form action="edit_menu_changephoto2.jsp?q=<%=id%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
                
              <table align="center" top="200px">
                  <tr>
                      <td> <input type="file" name="file" id="ff" class="form-control" required></td>
                      <td> <input type="submit" value="Upload Photo" class="btn btn-danger"></td>
                  </tr>
              </table>
              
          </form><br/><br/>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
