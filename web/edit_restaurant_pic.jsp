
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
                if(ext === ".jpg" || ext === ".jpeg" || ext === ".png" || ext === ".JPG" || ext=== ".PNG")
                {
                    obj.action = obj.action + "?fn=" + name;
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
    <body>
    <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
                <h2>Edit Restaurant Logo</h2>
       <%@page import="java.sql.*" %>
        <%
            
            String path="";
            String n=session.getAttribute("rest").toString();
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant where username='"+ n +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    path=rs.getString("logo");
                }
                    %>
                    
                    <img src="<%=path%>" height="300" width="300" align="center"><br/>
                    <form action="edit_restaurant_pic2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
                    <table>
                        <tr>
                            <td>
                                <input type="file" name="file" id="ff" required class="form-control">
                            </td>
                        </tr>
                        <tr align="center">
                            <td><br/>
                                <input type="submit" value="Upload Photo" class="btn btn-primary">
                            </td>
                        </tr>
                    </table>
                    </form>
                    <center>
                        <%
                          String msg = request.getParameter("msg");
                          if(msg!=null)
                          {
                        %>
                        <span style="font-size: 16px;color: #781e19;"><%=msg%></span>
                        <%
                          }
                        %>
                    </center>
                    <br/><br/>
                    </div>
                            <%@include file="footer.jsp"%>
    </body>
</html>
