
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home page</title>
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
         <%--   <%@include file="header.jsp"%> --%>
         <br>
                <%@page import="java.sql.*" %>
                <form action="home2.jsp" method="post">
                    <table align="center" style="font-size: 18px;">
                        <tr>
                            <td>Select City</td>
                        <br>
                        <td><select name="city" style="width: 250px;height: 35px;border-radius: 10px;">
                                <%
                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Driver loaded successfully");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                    System.out.println("connection with database success");
                                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                    ResultSet rs = stmt.executeQuery("select * from city");
                                    System.out.println("result set created");

                                    while (rs.next()) {
                                %>  
                                <option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
                                <%
                                    }
                                %>      

                            </select></td>
                            <%-- <td>Enter food</td>
                        <br>
                        <td><input type="text" id="search" name="food"/></td>--%>

                        <td colspan="2">
                            <input type="submit" style="width: 200px;height: 35px;border-radius: 20px;background-color: darkred;color: white;border: none;" value="Find Restaurants" />
                        </td>
                        </tr>

                    </table> 
                </form>
                
                <br>
                <br>

            <%--   Find Restaurants    --%>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                    Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs3 = stmt3.executeQuery("select * from restaurant where status=\'approved\' order by rand() limit 6");
                %>
                <h1 align="center" style="font-family: Brush Script MT, cursive;font-size: 50px;color: darkred;">Top Restaurants</h1>
                <div style="width: 100%;">
                    <table width="100%">
                        <tr>
                            <% 
                                int i=0;
                                while (rs3.next())
                                {
                                    if(i==0 || i%3==0)
                                    {
                            %>
                        <tr>
                            <%
                                    }
                            %>
                            <td align="center"><hr/>
                                <img style="box-shadow: 0 8px 8px -4px #333;width: 250px;height: 230px;border-radius: 10px;" src="<%=rs3.getString("logo")%>" height="100" width="170"/>
                                <br>
                                <a style="color: darkred;" href="home3.jsp?user=<%=rs3.getString("username")%>"><%=rs3.getString("username")%></a>
                            </td>
                            <%
                                i++;
                                }
                            %>
                        </tr>
                    </table>
                 </div>
                 <br/><hr/>
        <%-- Find Cuisines  --%>
            <%
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                    System.out.println("connection with database success");
                    Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs2 = stmt2.executeQuery("select * from food_category order by rand() limit 6 ");
                    System.out.println("result set created");
                %>
        <h1 align="center" style="font-family: Brush Script MT, cursive;font-size: 50px;color: darkred;">Cuisines</h1>
                <div style=" width: 100%;">
                    <table width="100%">
                        <tr>
                            <%  int ii=0;
                                while (rs2.next()) 
                                {
                                    if(ii==0 || ii%3==0)
                                    {
                            %>
                            <tr>
                            <%    
                                    }
                            %>
                            <td align="center"><hr/>
                                <img style="box-shadow: 0 8px 8px -4px #333;width: 250px;height: 230px;border-radius: 50%;" src="<%=rs2.getString("logo")%>" height="100" width="140"/>
                                <br>
                                <a style="color: darkred;" href="main_home.jsp?q=<%=rs2.getString("fc_name")%>"><%=rs2.getString("fc_name")%></a>
                            </td>


                            <%ii++;
                                }
                            %>
                        </tr>
                    </table>
                </div>
        
        </div><br/>
   <%@include file="footer.jsp"%>

    </body>
</html>
