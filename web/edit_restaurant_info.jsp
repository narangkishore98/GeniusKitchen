
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>restaurant</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go()
            {
               var email=document.getElementById("email").value;
               var contact_no=document.getElementById("contactno").value;
               var delivery_in=document.getElementById("delivery_in").value;
               var min_order=document.getElementById("min_order").value;
               var delivery_charges=document.getElementById("delivery_charges").value;
               var free_delivery_above=document.getElementById("free_delivery_above").value;
               var email=document.getElementById("email").value;
                   
                 if (email.indexOf("@") == -1 || email.lastIndexOf(".") == -1 || email.indexOf("@") >= email.lastIndexOf("."))
                {
                    alert("Email incorrect");
                    return false;
                }
                
                
               else if(isNaN(contact_no)) 
                {

                    alert("invalid phone number");
                    return false;
                }
               else if(isNaN(delivery_in))
                {
                    alert("invalid delivery in");
                    return false;
                }
                else if(isNaN(min_order))
                {
                    alert("invalid min order");
                    return false;
                }
                else if(isNaN(delivery_charges))
                {
                    alert("invalid delivery charges");
                    return false;
                }
                else if(isNaN(free_delivery_above))
                {
                    alert("invalid free delivery above");
                    return false;
                }
                else
                {
                    return true;
                }
            }
        </script>
    </head>
    
    <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
                <h2 align="center">Update information</h2>
                <br>
        <%@page import="java.sql.*" %>
        <form action="edit_restaurant_info2.jsp" method="post" onsubmit="return go()">
            <table align="center">
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="username" id="username" value="<%=session.getAttribute("rest")%>" class="form-control" readonly=""/></td>
                </tr>
                <%
                 Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant where username='"+ session.getAttribute("rest").toString() +"'");
                System.out.println("result set created");
                rs.next();
                %>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" id="name" value="<%=rs.getString("name")%>" required/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="description" id="description" required><%=rs.getString("description")%></textarea></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" id="email" value="<%=rs.getString("email")%>"required/></td>
                    </tr>
                 <tr>
                    <td>Contact No</td>
                    <td><input type="text" name="contact_no" id="contactno" value="<%=rs.getString("contact_no")%>"required/></td>
                    </tr>
                 <tr>
                    <td>Address</td>
                    <td><textarea name="address" id="address" required><%=rs.getString("address")%></textarea></td>
                    </tr>
                    <tr>
                        <td><br/>City</td>
                        <td><br/><select name="city" class="form-control">
                            <option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn1=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt1=conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs1=stmt1.executeQuery("select * from city");
                System.out.println("result set created");
        
                            while(rs1.next())
                            {
                          %>  
                          <option value="<%=rs1.getString("city")%>"><%=rs1.getString("city")%></option>
                          <%
                            }
                          %>      
                            
                        </select></td>
                    </tr>
                     <tr>
                         <td><br/>Security Question</td>
                         <td><br/><select name="security_ques" class="form-control">
                            <option value="where were you born?">where were you born?</option>
                            <option value="your fav place?">your fav place?</option>
                            <option value="your fav dish?">your fav dish?</option>
                            <option value="your best friend?">your best friend?</option>
                        </select></td>
               
                    </tr>
                <tr>
                    <td><br/>Security Answer</td>
                    <td><br/><input type="text" name="security_ans" id="security_ans" value="<%=rs.getString("security_ans")%>" required/></td>
                    </tr>
                    <tr>
                    <td><br/>Latitude</td>
                    <td><br/><input type="text" name="latitude" id="latitude" value="<%=rs.getString("latitude")%>" required/></td>
                    </tr>
                    
                 <tr>
                    <td><br/>Longitude</td>
                    <td><br/><input type="text" name="longitude" id="longitude" value="<%=rs.getString("longitude")%>" required/></td>
                    </tr>
                    
                    <tr>
                    <td><br/>Delivery in</td>
                    <td><br/><input type="text" name="delivery_in" id="delivery_in" value="<%=rs.getString("delivery_in")%>"required/></td>
                    </tr>
                    <tr>
                    <td><br/>Minimum Order</td>
                    <td><br/><input type="text" name="min_order" id="min_order" value="<%=rs.getString("min_order")%>"required/></td>
                    </tr>
                    
                    <tr>
                    <td><br/>Delivery Charges</td>
                    <td><input type="text" name="delivery_charges" id="delivery_charges" value="<%=rs.getString("delivery_charges")%>"required/></td>
                    </tr>
                    
                    <tr>
                    <td><br/>Free Delivery Above</td>
                    <td><input type="text" name="free_delivery_above" id="free_delivery_above" value="<%=rs.getString("free_delivery_above")%>" required/></td>
                    </tr>
                
                <tr>
                    <td align="center" colspan="2"><input type="submit" value="update" class="btn btn-success"/></td>
                </tr>
            </table>
        </form>
                    <br/><br/>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>