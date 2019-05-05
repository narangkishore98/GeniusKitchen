
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view approved restaurants</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
           <script type="text/javascript">
            function go()
            {
                return confirm(" are you sure you want to disapprove");
            }
        </script>
    </head>
     <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="header_admin_new.jsp"/>
        <div class="container-fluid">
            <br/>
                <h1 style="font-family: Brush Script MT, cursive;font-size: 50px;color: darkred;" align="center">Approved Restaurants</h1>
                <br>
                <br>
         <%@page import="java.sql.*" %>
         
         <% 
         Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant where status='approved'");
                System.out.println("result set created");
             %>
            
                 <table class="table table-hover">
                     <tr style="background-color: lightgrey;">
                        
            <th>S.No.</th>
            <th>Username</th>
            <th>Name</th>
            <th>Email</th>
            <th>( M )</th>
            <th>Address</th>
            <th>City</th>
            <th>Logo</th>
            
            <th></th>
            <th></th>
                     </tr>
                
        
            <%
                int i=1;
            while(rs.next())
            {
                %>
                <tr>
                    <td><%=i++%></td>
                    <td><%=rs.getString("username")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("contact_no")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("city")%></td>
                    <td><img src="<%=rs.getString("logo")%>" height="90" width="90"/></td>
                    <td><br/>
                        <a href="disapprove_restaurant.jsp?q=<%=rs.getString("username")%>" onclick="return go()" class="btn btn-danger">Disapprove</a>
                    </td>
                </tr>
                <%}%>
                 </table>
                 </div>
                            <%@include file="footer.jsp"%>
            </body>
</html>


       
    
