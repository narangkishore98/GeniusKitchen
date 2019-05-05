
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
        
        <script type="text/javascript">
             function go()
               {
                   return confirm(" are you sure u wanna update ?");
               } 
        </script>
    </head>
     <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
                <h2>Update Restaurant Menu Category</h2>
                <br>
        <%@page import="java.sql.*" %>
        <%
            String id=request.getParameter("p");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs=stmt.executeQuery("select * from restaurant_menu_category where rmid='"+ id +"'");
            String name="";
            String description="";
            if(rs.next())
            {
                name=rs.getString("name");
                description=rs.getString("description");
            }
                %>
        <form action="restaurant_category_edit2.jsp?p=<%=id%>" method="post">
            <table>
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" value="<%=name%>" name="name" required class="form-control"/></td>
                </tr>
                <tr>
                    <td><br/>Description</td>
                    <td><br/><textarea  name="desc" required class="form-control"><%=description%> </textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><br/><input type="submit" value="Update" class="btn btn-success" onClick="return go()" /></td>
                </tr>
            </table>
        </form><br/><br/>
                    </div>
                            <%@include file="footer.jsp"%>
                
    </body>
</html>

