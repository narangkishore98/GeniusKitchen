

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        
         </head>
       <body style="background-color: #F4F4F4;">
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
         <br>
         <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">Previous Orders History</h1>
         <br>

         <%@page import="java.sql.*" %>
          <%
            //jdbc code
            String username = session.getAttribute("user").toString();
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select * from orders where username=\'"+username+"\' order by date desc");
            int oid=0;
            String odate="", total="";
            while(rs.next())
            {
               oid = rs.getInt("oid");
               odate = rs.getDate("date").toString();
               total = rs.getString("total");
          %>
           <table class="table table-hover">
            <tr style="background-color: lightgrey;">
                <th style="text-align: center;">Restaurant</th>
                <th style="text-align: center;">Name</th>
                <th style="text-align: center;">Menu Logo</th>
                <th style="text-align: center;">Quantity</th>
                <th style="text-align: center;">Price</th>
                <th style="text-align: center;">Date</th>
            </tr>
         <%  
               int od_id,menu_id;
               String qty, price;
               Statement stmt1=conn.createStatement();
               ResultSet rs1=stmt1.executeQuery("select * from order_detail where oid="+oid);
               while(rs1.next())
               {
                   od_id = rs1.getInt("od_id");
                   menu_id = rs1.getInt("menu_id");
                   qty = rs1.getString("qty");
                   price = rs1.getString("price");
                   
                   String rest, menu_name, photo = "";
                   Statement stmt2=conn.createStatement();
                   ResultSet rs2=stmt2.executeQuery("select * from menu where menu_id="+menu_id);
                   rs2.next();
                   rest = rs2.getString("restaurant");
                   menu_name = rs2.getString("name");
                   photo = rs2.getString("photo");
              %>
              <tr align="center">
                  <td><br/><%=rest%></td>
                  <td><br/><%=menu_name%></td>
                  <td><img src="<%=photo%>" width="90" height="90" style="border-radius: 5px;"/></td>
                  <td><br/><%=qty%></td>
                  <td><br/><%=price%></td>
                  <td><br/><%=odate%></td>
              </tr>
        <%     
               }
        %>
          <tr>
              <td colspan="6" align="right" style="padding-right: 100px;"><h3>Total Amount= <%=total%></h3></td>  
          </tr>
          <tr>
              <td colspan="6"><hr/></td>
          </tr>
        <%
            }
        %>
           </table>
      <br>
         <br>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
