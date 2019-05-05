
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user forgot password page</title>
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
            String username;
            String contactno="";
            username=request.getParameter("username");
           
            
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery("select * from user where username='"+username+"'");
                System.out.println("result set created");
                String ques="";
                if(rs.next())
                {
                  contactno=rs.getString("mobile_no");
                  ques = rs.getString("security_ques");
                }
                %>
                <form action="user_forgot_password3.jsp" method="post">
                    <center> 
                        <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">Enter Details</h1>
                <br>
                    <table cellpadding="20px" align="center">
                <tr>
                    <td>username</td>
                    <td><input type="text" value="<%=username%>" id="username" name="username" readonly/></td>
                </tr>
                     <tr>
                    <td>Your Security Question</td>
                    <td><input type="text" size="45" name="ques" id="username" value="<%=ques%>" readonly/></td>
                </tr>
                <tr>
                    <td>Security Answer</td>
                    <td><input type="text" placeholder="Enter Answer" id="username" name="ans" required/></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value=" Next " class="btn btn-primary"></td>
                </tr>
                    </table>
             
                </form>
                </div><br/><br/>
                            <%@include file="footer.jsp"%>
    </body>
</html>
