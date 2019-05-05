<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <script>
            function go()
            {
                if(document.getElementById("newpw").value !=document.getElementById("confnewpw").value)
                {
                    alert("new password and confirm password do not match");
                    return false;
                   }
                   else
                   {
                       return true;
                   }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change restaurant password</title>
    </head>
     <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
                <h2>Change Restaurant Password</h2>
                <br>
                
        <form action="change_rest_password2.jsp" onsubmit="return go()" method="post">
              <table align="center">
              <tr>
        <td>USERNAME</td>
    <td>
<input type="text" name="username" class="form-control" readonly value="<%=session.getAttribute("rest")%>">
</td>
</tr>
<tr>
    <td><br/>OLD PASSWORD</td>
    <td><br/>
        <input type="password" name="password" class="form-control" required>
    </td>
</tr>
<tr>
<tr>
    <td><br/>NEW PASSWORD </td>
    <td><br/>
        <input type="password" name="newpw" class="form-control" id="newpw" required>
    </td>
</tr>
<tr>
    <td> CONFIRM NEW PASSWORD</td>
    <td>
        <input type="password" name="cpw" class="form-control" id="confnewpw" required>
        </td>
</tr>
<tr>
    <td>
        
    </td>
    <td align="center" colspan="2">
        <br/><input type="submit" name="save" value="Change Password" class="btn btn-success"/>
    </td>
</tr>
    </table>
<% 
String msg=request.getParameter("msg");
if(msg!=null)
{
    %>
    <span style="color:red;"><%=msg%></span>
    <%
}
%>

        </form><br/><br/>
</div>
        <%@include file="footer.jsp"%>
    </body>
</html>
