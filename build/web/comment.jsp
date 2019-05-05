
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>comments</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <script src="Rating.js"></script>
    </head>
    <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
            <br/>
               
                <%
                    String user;
                    user = request.getParameter("user");
                      
                    //jdbc code
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                    System.out.println("connection with database success");
                    Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs1 = stmt1.executeQuery("select * from restaurant where username='" + user + "'");
                    System.out.println("result set created");

                    if (rs1.next())
                    {
                %>
                <table style="margin-top: 50px" align='center'>
                    <tr align="center" >
                        <td colspan="2"><img src="<%=rs1.getString("logo")%>" height="250" width="250" style="border-radius: 15px 50px 30px;box-shadow: 0 4px 40px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"/> <td>
                        <td><table><tr align="center">
                                    <td colspan="2"><span style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;"><%=rs1.getString("username")%></span></td>
                                </tr>
                                <tr align="center">
                                    <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Address</span></td>
                                    <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("address")%></span></td>
                                </tr>
                                <tr>
                                    <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;line-height: 2.5em;">Phone Number:</span></td>
                                    <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("contact_no")%></span></td>
                                </tr>
                            </table></td>

                    </tr>   

                </table>

                <%
                    }
                %>
                <hr/>
                <h1 align="center" style="font-family: Brush Script MT, cursive;font-size: 40px;color: darkred;"> Post Your Reviews</h1>
                <br/>
                <form action="comment2.jsp?rest=<%=user%>" method="post">
                    <table align="center">
                        <!-- Spicy -->
                        <tr>
                            <td><b>Spicy</b></td>
                            <td>
                                <input type="hidden" name="rate1" id="rate1" />
                                <table>
                                    <tr>
                                        <td>
                                            <img width="20" height="20" id="rating1_1" src="rating/empty_star.png" onmouseover="fill1(this)" onmouseout="unfill1(this)" onclick="selected1(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating1_2" src="rating/empty_star.png" onmouseover="fill1(this)" onmouseout="unfill1(this)" onclick="selected1(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating1_3" src="rating/empty_star.png" onmouseover="fill1(this)" onmouseout="unfill1(this)" onclick="selected1(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating1_4" src="rating/empty_star.png" onmouseover="fill1(this)" onmouseout="unfill1(this)" onclick="selected1(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating1_5" src="rating/empty_star.png" onmouseover="fill1(this)" onmouseout="unfill1(this)" onclick="selected1(this)">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                        <!-- Yummy -->
                        <tr>
                            <td><br/><b>Yummy</b></td>
                            <td><br/>
                                <input type="hidden" name="rate2" id="rate2" />
                                <table>
                                    <tr>
                                        <td>
                                            <img width="20" height="20" id="rating2_1" src="rating/empty_star.png" onmouseover="fill2(this)" onmouseout="unfill2(this)" onclick="selected2(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating2_2" src="rating/empty_star.png" onmouseover="fill2(this)" onmouseout="unfill2(this)" onclick="selected2(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating2_3" src="rating/empty_star.png" onmouseover="fill2(this)" onmouseout="unfill2(this)" onclick="selected2(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating2_4" src="rating/empty_star.png" onmouseover="fill2(this)" onmouseout="unfill2(this)" onclick="selected2(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating2_5" src="rating/empty_star.png" onmouseover="fill2(this)" onmouseout="unfill2(this)" onclick="selected2(this)">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                        <!-- Food Presentation -->
                        <tr>
                            <td><br/><b>Food Presentation</b></td>
                            <td><br/>
                                <input type="hidden" name="rate3" id="rate3" />
                                <table>
                                    <tr>
                                        <td>
                                            <img width="20" height="20" id="rating3_1" src="rating/empty_star.png" onmouseover="fill3(this)" onmouseout="unfill3(this)" onclick="selected3(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating3_2" src="rating/empty_star.png" onmouseover="fill3(this)" onmouseout="unfill3(this)" onclick="selected3(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating3_3" src="rating/empty_star.png" onmouseover="fill3(this)" onmouseout="unfill3(this)" onclick="selected3(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating3_4" src="rating/empty_star.png" onmouseover="fill3(this)" onmouseout="unfill3(this)" onclick="selected3(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating3_5" src="rating/empty_star.png" onmouseover="fill3(this)" onmouseout="unfill3(this)" onclick="selected3(this)">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                        <!-- Overall Rating -->
                        <tr>
                            <td><br/><b>Overall Rating</b></td>
                            <td><br/>
                                <input type="hidden" name="rate" id="rate" />
                                <table>
                                    <tr>
                                        <td>
                                            <img width="20" height="20" id="rating_1" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating_2" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating_3" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating_4" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                        <td>
                                            <img width="20" height="20" id="rating_5" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td><br/><b>Review</b></td>
                            <td><br/><textarea placeholder="Enter your Review here" name="comment" cols="37" rows="5" style="border-radius: 7px;" id="comment"></textarea></td>
                        </tr>
                        <tr>
                            <%
                                if (session.getAttribute("user") == null) {
                                    // response.sendRedirect("user_login.jsp?msg=to post comment please login");

                            %>
                            <td colspan="2" align="center"><br/>To comment please <a href="user_login.jsp">Login</a></td>
                            <%                         } else {

                            %>
                            <td colspan="2" align="right"><br/><br/><input type="submit" value="COMMENT" style="width: 250px;height: 35px;border-radius: 20px;background-color: darkred;color: white;border: none;"/></td>
                                <%                                }
                                %>
                        </tr>

                    </table>  
                </form>
                        <hr/>
                <h3 align="center" style="font-family: Brush Script MT, cursive;font-size: 40px;color: darkred;">User Reviews</h3>
                <%@page import="java.sql.*" %>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from comments where restaurant='" + user + "' order by cid desc");
                %>
                <table width="600" align="center">
                <%       
                    while (rs.next())
                    {
                %>
                    <tr>
                        <td align="left"><span style="font-family: cursive; font-size: 16px"><%=rs.getString("user")%></span></td>
                        <td align="right" style="color: gray;font-size: 12px;"><%=rs.getString("date")%></td>

                    </tr>    
                    <tr>
                        <td colspan="2" ><br/><span style="font-family: cursive; font-size: 20px"><%=rs.getString("comment")%></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" ><br/>
                            <table style="border: solid 2px silver;padding: 5px;">
                                <tr>
                                    <td><b>Spicy</b></td>
                                    <%

                                        int n1 = Integer.parseInt(rs.getString("spicy"));
                                        for (int i = 0; i < n1; i++)
                                        {
                                    %>

                                    <td>
                                        <img width="20" height="20" id="rating_1" src="rating/filled_star.png" >
                                    </td>

                                    <%
                                        }
                                        for (int i = 0; i < 5 - n1; i++) 
{
                                    %>

                                    <td>
                                        <img width="20" height="20" id="rating_1" src="rating/empty_star.png" >
                                    </td>


                                    <%
                                        }
                                    %>
                                </tr>
                                <tr>
                                    <td><br/><b>Yummy</b></td>
                                    <%

                                        int n2 = Integer.parseInt(rs.getString("yummy"));
                                        for (int i = 0; i < n2; i++)
                                        {
                                    %>

                                    <td><br/>
                                        <img width="20" height="20" id="rating_1" src="rating/filled_star.png" >
                                    </td>

                                    <%
                                        }
                                        for (int i = 0; i < 5 - n2; i++) 
{
                                    %>

                                    <td><br/>
                                        <img width="20" height="20" id="rating_1" src="rating/empty_star.png" >
                                    </td>


                                    <%
                                        }
                                    %>
                                </tr>
                                <tr>
                                    <td><br/><b>Food Presentation</b></td>
                                    <%

                                        int n3 = Integer.parseInt(rs.getString("presentation"));
                                        for (int i = 0; i < n3; i++)
                                        {
                                    %>

                                    <td><br/>
                                        <img width="20" height="20" id="rating_1" src="rating/filled_star.png" >
                                    </td>

                                    <%
                                        }
                                        for (int i = 0; i < 5 - n3; i++) 
{
                                    %>

                                    <td><br/>
                                        <img width="20" height="20" id="rating_1" src="rating/empty_star.png" >
                                    </td>


                                    <%
                                        }
                                    %>
                                </tr>
                                <tr>
                                    <td><br/><b>Overall Rating</b></td>
                                    <%

                                        int n = Integer.parseInt(rs.getString("rating"));
                                        for (int i = 0; i < n; i++)
                                        {
                                    %>

                                    <td><br/>
                                        <img width="20" height="20" id="rating_1" src="rating/filled_star.png" >
                                    </td>

                                    <%
                                        }
                                        for (int i = 0; i < 5 - n; i++) 
{
                                    %>

                                    <td><br/>
                                        <img width="20" height="20" id="rating_1" src="rating/empty_star.png" >
                                    </td>


                                    <%
                                        }
                                    %>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <td><hr/></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
<hr/>
            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
