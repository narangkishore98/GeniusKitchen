

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>proceed to checkout</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go()
            {
                document.getElementById("address").style.display = "block";
            }
            function go2()
            {
                document.getElementById("address").style.display = "none";
            }
        </script>
    </head>
    <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
            <br/>
            <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">Checking Out</h1>
            <br/>
                
                <%@page import="java.sql.*" %>
                <%@page import="java.util.*" %>
                <%            
                ArrayList<inception.delivery> al2 = (ArrayList<inception.delivery>) (session.getAttribute("deliver"));
                    boolean flag = false;
                    if (session.getAttribute("deliver") != null) {
                        for (int k = 0; k < al2.size(); k++) {
                            if (al2.get(k).isDelivery) {
                                flag = true;
                                break;
                            }
                        }
                    }
                    if (flag) {

                        if (session.getAttribute("user") == null) {
                            response.sendRedirect("user_login.jsp?msg=to checkout please login");
                        } else {
                %>
                <form action="checkout2.jsp" method="post">
                    <div style="text-align: center;">
                        <h3><b> WELCOME <%=session.getAttribute("user")%></b></h3>
                        <hr style="border: solid 1px darkred;"/>
                        <h4 align="center">Choose Dining Option -</h4>
                        <table align="center">
                            <tr>
                                <td>
                                    <input type="radio" value="takeaway" id="takeaway" name="del" onclick="go2()" checked style="align: center"> Take Away
                                </td>
                                <td><br/><br/></td>
                            </tr>
                            <tr>
                                <td><input type="radio" value="home" id="home" name="del" onclick="go()" > Home Delivery<br>

                                    <%
                                        String address;
                                        address = request.getParameter("address");

                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery("select * from user where username=\'" + session.getAttribute("user") + "\' ");
                                        rs.next();
                                    %>
                            </tr>
                            <tr>
                                <td><textarea name="add" style="display: none;" id="address" required><%=rs.getString("address")%></textarea></td>
                            </tr>
                        </table>                             

                        <hr/>
                        <h4>Choose Payment Option - </h4>
                        <table align="center">
                            <tr>
                                <td><input type="radio" value="cash" name="pay" id="pay1"> Cash on Delivery</td>
                                <td><br/><br/></td>
                            </tr>
                            <tr>
                                <td><input checked type="radio" value="card" name="pay" id="pay2"> Credit Card</td>
                            </tr>
                            <tr>
                                <td colspan="2"><br/><br/><input type="submit" value="           Proceed          " class="btn btn-success"/></td>
                            </tr>
                        </table>
                        <%
                            }
                        } else {
                        %>
                        <h2>
                            No order to be processed.
                        </h2>
                        <%
                            }
                        %>


                    </div>
                </form>
            </div>
                        <br/><br/>
            <%@include file="footer.jsp"%>
    </body>
</html>

