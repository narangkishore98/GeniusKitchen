<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view city</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            function go()
            {
                return confirm("Are you sure you want to delete?");
            }
         </script>
    </head>
    <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="header_admin_new.jsp"/>
        <div class="container-fluid">
            <br/>
                <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">View City</h1>
                <br>
                <br>
       <%@page import="java.sql.*" %>
        <%
            String city;
            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select * from city");
        %>
        <table class="table table-hover">
            <tr style="background-color: lightgrey;">
                <th style="text-align: center;">S.No.</th>
                <th style="text-align: center;">City</th>
                <th style="text-align: center;">Delete</th>
            </tr>
        <%
            int i=1;
            while(rs.next())
            {
                %>
                
                <tr align="center">
                    <td><%=i++%></td>
                    <td><%=rs.getString("city")%></td>
                    <td><a href="delete_city.jsp?city=<%=rs.getString("city")%>" onclick="return go();"><span class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
                <%
            }
            %>
        </table>
            <center>
                <%
                    String msg = request.getParameter("msg");
                    if(msg!=null)
                    {
                %>
                <span style="color: red;font-size: 16px;"><%=msg%></span>
                <%
                    }
                %>
            </center>
            </div><br/><br/>
                            <%@include file="footer.jsp"%>
    </body>
</html>
