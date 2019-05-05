

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
        <script type="text/javascript">
            function go()
            {
                return confirm("Are you sure u wanna update ?");
            }
            var xmlhttp;
            function go1()
            {
                var id = document.getElementById("category").value;
               // document.getElementById("hide").style.display="none";
                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "rest_sub_menu.jsp?id="+id, true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("show").innerHTML = xmlhttp.responseText;
                }
            }
            
            function go5()
            {
                return confirm("Do you want to Delete ?");
            }
        </script>
    </head>
     <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
           <h2>Restaurant Sub-Menu View</h2>
        <%@page import="java.sql.*" %>


    <form action="" method="post" >
        <table align="center">
            <tr>
                <td>Menu Category Name </td>
                <td><select name="category" id="category" onchange="go1()" class="form-control">
                    <option>select</option>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from restaurant_menu_category where username='"+session.getAttribute("rest")+"'");
                        while (rs.next()) {
                    %>  
                    <option value="<%=rs.getInt("rmid")%>"><%=rs.getString("name")%></option>
                   <%
                        }
                   %>      
                    </select></td>

                    </tr>
                     <tr>
                        
                    </tr>

            </table>
            <%
                String message = request.getParameter("msg");
                if(message!=null)
                {
            %>
            <span id="hide" style="font-size: 18px;color: red;"><%=message%></span>
            <%
                }
            %>
                                <br>
                                
            <div id="show"></div>
           
            </div>
            <%@include file="footer.jsp"%>
    </body>
</html>
