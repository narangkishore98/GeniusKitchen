
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
    <body>
      <%@page import="java.sql.*" %>
       <%
            String username,password,name,email,contactno,city,address;
            username=request.getParameter("username");
            password=request.getParameter("password");
            name=request.getParameter("name");
            email=request.getParameter("email");
            contactno=request.getParameter("contactno");
            city=request.getParameter("city");
            address=request.getParameter("address");
            String ques=request.getParameter("ques");
            String ans=request.getParameter("ans");
            //jdbc code
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs=stmt.executeQuery("select * from user where username=\'"+username+"\' ");
            if(rs.next())
            {
                response.sendRedirect("user_signup.jsp?msg=Invalid Username/Password");
            }
            else
            {
                  rs.moveToInsertRow();
                  rs.updateString("username",username);
                  rs.updateString("password",password);
                  rs.updateString("name",name);
                  rs.updateString("email",email);
                  rs.updateString("mobile_no",contactno);
                  rs.updateString("address",address);
                  rs.updateString("city",city);
                  rs.updateString("security_ques",ques);
                  rs.updateString("security_ans",ans);
                  rs.insertRow();
                  out.println("User added successfully");
                
                  response.sendRedirect("user_login.jsp?msg=Fill your Username Password for Login\n. Details Submitted Successfully");
            }
             
               
                %>
    </body>
</html>
