

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit restaurant logo</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            function go()
            {
                return confirm(" are you sure you want to upload");
            }
             function go(obj)
            {
                var name = document.getElementById("ff").value;
                var ext = name.substring(name.lastIndexOf("."));
                if(ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext ==".JPG")
                {
                    obj.action = obj.action + "&fn=" + name;
                    return true;
                }
                else
                {
                    alert("Upload Image Files only");
                    return false;
                }
            }
         </script>
              
    </head>
     <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
            <h2>Change Restaurant Menu Category Photo</h2>
                <br>
       <%@page import="java.sql.*" %>
        <%
            
            String path="";
            String n=request.getParameter("p");
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant_menu_category where rmid='"+ n +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    path=rs.getString("photo");
                }
                    %>
                    <img src="<%=path%>" height="300" width="300" align="center"><br/>
                    <form action="restaurant_category_change_photo2.jsp?p=<%=n%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
                    <table>
                        <tr>
                            <td>
                             <input type="file" name="file" id="ff" class="form-control">
                            </td>
                        </tr>
                        <tr align="center">
                            <td><br/>
                                <input type="submit" value="Upload Photo" class="btn btn-primary">
                            </td>
                        </tr>
                    </table>
                    </form><br/><br/>
                    </div>
                            <%@include file="footer.jsp"%>
    </body>
</html>