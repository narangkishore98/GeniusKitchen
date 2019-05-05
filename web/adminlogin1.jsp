<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet"/>
    </head>
    <body style="background-color: #F4F4F4;">
       <jsp:include page="new_header.jsp"/>
        <div class="container-fluid" align="center">
                <h2 class="headings" align="center">ADMIN LOGIN</h2>
                <br>
         <form action="adminlogin2.jsp" id="form" method="post" align="center">
            <table border="0" >
                <tr>
                    <td>Username</td>
                    <td><input type="text" placeholder="Username" name="un" id="username" autofocus required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="pw" id="password" placeholder="Password" required/></td>
                </tr>
                <tr>
                    <td colspan="2"><br/><input type="submit" value="Login" style="width: 250px;height: 40px;border-radius: 20px;background-color: darkred;font-size: 18px;color: white;border: none;" /></td>
                </tr>
                
            </table>  
        </form>
                <br/>
        <% 
String msg=request.getParameter("msg");
if(msg!=null)
{
    %>
    <span style="color:brown;"><%=msg%></span>
    <%
}
%>
</div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>