
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view cuisine</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
         <script type="text/javascript">
            function go()
            {
                return confirm(" are you sure you want to delete?");
            }
         </script>
    </head>
    <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="header_admin_new.jsp"/>
        <div class="container-fluid">
            <br/>
                <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">All Cuisines</h1>
                <br>
                <br>
         <%@page import="java.sql.*" %>
         
         <% 
         Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from food_category");
                System.out.println("result set created");
             %>
             <%
            String msg=request.getParameter("msg");
            if(msg!=null)
            {
        %>
        <span style="color:blue"><%=msg%></span>
        <%
          }
%>  
             
            
<table class="table table-hover">
    <tr style="background-color: lightgrey;" >
        <th>S.No.</th>
        <th>Cuisine</th>
        <th width="800">Description</th>
        <th>Photo</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Edit Logo</th>
    </tr>
    <%
            int i=1;
            while(rs.next())
            {
    %>
                <tr>
                    <td><%=i++%></td>
                    <td><%=rs.getString("fc_name")%></td>
                    <td><br/><%=rs.getString("description")%></td>
                    <td><img src="<%=rs.getString("logo")%>" height="90" width="90"/></td>
                    <td align="center"><br/><a href="edit_cuisine.jsp?q=<%=rs.getString("fc_name")%>"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td align="center"><br/><a href="delete_cuisine.jsp?q=<%=rs.getString("fc_name")%>" onclick="return go()"><span class="glyphicon glyphicon-trash"></span></a>
                    <td align="center"><br/><a href="edit_cuisine_pic.jsp?q=<%=rs.getString("fc_name")%>"><span class="glyphicon glyphicon-picture"></span></a></td>
                </tr>
                <%}%>
                 </table>
                 </div><br/><br/>
                  <%@include file="footer.jsp"%>
            </body>
</html>
