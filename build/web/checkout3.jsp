
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
    </head>
    <body>
        <%
            try 
            {
                String emailid = request.getParameter("num");
                
                String code = "";

                for (int i = 0; i < 4; i++)
                {
                  int n = (int) (Math.random() * 10);
                  code += n;
                }
                System.out.println("CODE: ### "+code);
                String message = "Your order verification code is - " + code + ". Please Enter it to confirm your order .";
               
                inception.SimpleMailDemo obj = new inception.SimpleMailDemo(emailid,"Verification Code",message);
                session.setAttribute("code", code);
                session.setAttribute("mobile", emailid);
                 System.out.println("All CODE WORK ##################");
            } 
            catch(Exception ex) 
            {
                ex.printStackTrace();
            }
        %>
    </body>
</html>
