
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit cuisine logo</title>
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
    <body>
      <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="header_admin_new.jsp"/>
        <div class="container-fluid">
            <br/>
                <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">Change Cuisine Photo</h1>
                <br>
                <br>
       <%@page import="java.sql.*" %>
        <%
            
            String path="";
            String n=request.getParameter("q");
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from food_category where fc_name='"+ n +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    path=rs.getString("logo");
                }
                    %>
                    <center> 
                        <img src="<%=path%>" height="300" width="300" style="border-radius: 15px 50px 50px;box-shadow: 5px 5px 10px #555;">
                    </center>
                    <form action="edit_cuisine_pic2.jsp?q=<%=n%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
                    <table align="center">
                        <tr>
                            <td>
                                <br/>
                                <input type="file" name="file" id="ff" required >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br/><br/>
                                <input type="submit" value=" Upload Logo " style="width: 300px;height: 40px;border-radius: 20px;background-color: darkred;color: white;border: none;"/>
                            </td>
                        </tr>
                    </table>
                    </form>
                    </div><br/><br/>
                            <%@include file="footer.jsp"%>
    </body>
</html>
