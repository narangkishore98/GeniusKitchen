
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit cuisine</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="header_admin_new.jsp"/>
        <div class="container-fluid">
            <br/>
                <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">Edit Cuisine</h1>
                <br>
                <br>
        <%@page import="java.sql.*" %>
        <%
            String fc_name="";
            String description="";
            String n=request.getParameter("q");
            ///JDBC CODE/////
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs=stmt.executeQuery("select * from food_category where fc_name='"+ n +"'");
                
            if(rs.next())
            {
                fc_name=rs.getString("fc_name");
                description=rs.getString("description");
            }
                %>
                <form action="edit_cuisine2.jsp" method="post">
                     <table align="center">
                <tr>
                    <td style="font-size: 20px;">Cuisine Name</td>
                    <td><input type="text" value="<%=fc_name%>" id="cuisine" name="fc" readonly required/></td>
                </tr>
                <tr>
                    <td style="font-size: 20px;">Description</td>
                    <td><textarea name="desc" rows="7" id="description" required><%=description%> </textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><br/>
                        <input type="submit" value=" Update " style="width: 200px;height: 35px;border-radius: 20px;background-color: darkred;color: white;border: none;"/></td>
                </tr>
                 <tr>
                       <td>
                       <% 
                            String msg=request.getParameter("msg");
                            if(msg!=null)
                            {
                                %>
                                <span style="color:brown;"><%=msg%></span>
                                <%
                            }
                        %> 
                       </td>
              </table>
            </form>
          </div>
                <br/><br/>
            <%@include file="footer.jsp"%>
    </body>
</html>
