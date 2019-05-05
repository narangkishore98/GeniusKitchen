
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change password2</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <%@page import="java.sql.*"%>
        <%
            String oldpassword,newpassword,confirmpassword;
            oldpassword=request.getParameter("pw");
            newpassword=request.getParameter("newpw");
            confirmpassword=request.getParameter("cpw");
            String username= (String)session.getAttribute("un");
            
            if(newpassword.equals(confirmpassword))
            {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Loading driver");
                
                Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("Connection build");
                
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                
                ResultSet rs=stmt.executeQuery("select * from admin where username='"+username+"' and password='"+oldpassword +"'");
                
                if(rs.next())
                {
                    rs.updateString("password", newpassword);
                    rs.updateRow();
                    response.sendRedirect("change_password1.jsp?msg=Password Updated successfully.");
                    
                }
                else
                {
                    response.sendRedirect("change_password1.jsp?msg=Old password incorrect");
                }
            }
            else
                {
                response.sendRedirect("change_password1.jsp?msg=password does not match"); 
         }
            %>
          
    </body>
</html>
