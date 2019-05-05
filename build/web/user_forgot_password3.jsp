
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
    </head>
     <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
            <br/>
       <%@page import="java.sql.*" %>
        
        <%
            String username,ans;
            username=request.getParameter("username");
            ans=request.getParameter("ans");
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
             Statement stmt=conn.createStatement();
             ResultSet rs=stmt.executeQuery("select * from user where username='"+username+"' and security_ans='"+ans+"'");
        
             if(rs.next())
             {
                 String password=rs.getString("password");
                 String mobile=rs.getString("mobile_no");
                // inception.sms o1 = new inception.sms(mobile,"Your Password is - "+password);
                 inception.SimpleMailDemo obj = new inception.SimpleMailDemo(rs.getString("email"), "Password Recovery", "Your password is: "+password); 
                 %> 
                <!-- <span style="font-size: 16px;color: #555555;">Your Password has been sent to your registered Mobile Number</span>-->
                 <h1 align="center" style="font-family: Brush Script MT, cursive;font-size: 45px;color: darkred;">Your Password has been sent to your registered Email-ID</h1>
                 <%
//response.sendRedirect("user_login.jsp?msg=your password is "+password);
                }
                else
                {
                    response.sendRedirect("user_login.jsp?msg=invalid username or email or phone no");
                }
                %>
                </div><br/><br/>
                            <%@include file="footer.jsp"%>
    </body>
</html>
