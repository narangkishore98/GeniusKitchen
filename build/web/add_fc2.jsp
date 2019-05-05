<%-- 
    Document   : add_fc2
    Created on : Apr 8, 2014, 5:29:37 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>food category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go(obj)
            {
                var name = document.getElementById("ff").value;
                var ext = name.substring(name.lastIndexOf("."));
                if(ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext ==".JPG")
                {
               //     var fc_name = document.getElementById("fc").value;
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
        <%@page import="java.sql.*" %>
        <jsp:include page="header_admin_new.jsp"/>
        <div class="container-fluid">
            <br/>
                <h1 style="font-family: Brush Script MT, cursive;font-size: 50px;color: darkred;" align="center">Upload Cuisine Photo</h1>
                <br>
                <br>
        <%@page import="java.sql.*" %>
        
        <%
            String fc_name,description;
            fc_name=request.getParameter("cuisine");
            description=request.getParameter("description");
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
             System.out.println("connection with database success");
             Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
             ResultSet rs=stmt.executeQuery("select * from food_category where fc_name=\'"+fc_name+"\'");
             System.out.println("result set created");
        
                if(rs.next())
                {
                   // out.println("food category with same name present");
                    response.sendRedirect("add_fc1.jsp?msg=food category with same name present");
                }
                else
                {
                   // Insert data to database 
                    rs.moveToInsertRow();
                    rs.updateString("fc_name",fc_name);
                    rs.updateString("description",description);
                    rs.updateString("logo",null);
                    rs.insertRow();
                    ////////////////////////
                   
                }
                %>
                <form action="add_fc3.jsp?q=<%=fc_name%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
                    <table align="center">
                        <tr>
                            <td>
                                <input type="file" name="file" id="ff" required>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value=" Upload " style="width: 200px;height: 35px;border-radius: 20px;background-color: darkred;color: white;border: none;">
                            </td>
                        </tr>
                    </table>
                </form>
                    </div><br/><br/>
                            <%@include file="footer.jsp"%>
    </body>
</html>
