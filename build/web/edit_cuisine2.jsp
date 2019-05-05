
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit cuisine logic</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
       <%@page import="java.sql.*" %>
        <%
           
            String description= request.getParameter("desc");
            String fc=request.getParameter("fc");
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
             Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
             ResultSet rs=stmt.executeQuery("select * from food_category where fc_name='"+ fc +"'");
                
             if(rs.next())
             {
                rs.updateString("description" , description);
                rs.updateRow();
                response.sendRedirect("view_cuisine.jsp");
             }
             else
             {
                 response.sendRedirect("edit_cuisine.jsp?msg=Record doesn't Exist.");
             }
        %>
    </body>
</html>
