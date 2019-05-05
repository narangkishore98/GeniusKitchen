<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ON SUCCESS</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
          
            <div id="main">
        <%@page import="java.sql.*" %>
        
        <%
            String un,pw;
            un=request.getParameter("un");
            pw=request.getParameter("pw");
            
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
             System.out.println("connection with database success");
             Statement stmt=conn.createStatement();
             ResultSet rs=stmt.executeQuery("select * from admin where username='"+un+"' and password='"+pw+"' ");
             System.out.println("result set created");
                
             if(rs.next())
             {
                session.setAttribute("un",un);
                response.sendRedirect("adminhome.jsp");
             }
             else
             {
                response.sendRedirect("adminlogin1.jsp?msg=invalid username/password");
               
             }
            
          
        %>
        <h1> User added succesfully</h1>
    
    
    </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>