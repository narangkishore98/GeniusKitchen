
<%@page import="java.sql.*"%>
<%@page import="inception.cart"%>
<%@page import="java.util.ArrayList"%>
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
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            var xmlhttp;

            function go()
            {
                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                var num = document.getElementById("num").value;
               // if (isNaN(num) || num.length > 10 || num.length < 10)
                //{
                  //  alert("Invalid Contact No.");
                //}
                //else
                //{
                    alert(num);
                    xmlhttp.onreadystatechange = go2;
                    xmlhttp.open("GET", "checkout3.jsp?num="+num, true);
                    xmlhttp.send();
                //}
            }
            function go2()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("tr").style.display = "block";
                    document.getElementById("go").disabled = "disabled";
                }
            }
            function go5()
            {
                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                var num = document.getElementById("num2").value;
                if (isNaN(num) || num.length > 4 || num.length < 4)
                {
                    alert("Invalid Verification Code");
                }
                else
                {
                    xmlhttp.onreadystatechange = go25;
                    xmlhttp.open("GET", "VerifyCode.jsp?code=" + num, true);
                    xmlhttp.send();
                }
            }
            function go25()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("data").innerHTML = xmlhttp.responseText;
                    if (xmlhttp.responseText.indexOf("success") > 0)
                    {
                        document.getElementById("ver").disabled = "disabled";
                        document.getElementById("resend").style.display = "none";
                    }
                    else
                    {
                        document.getElementById("resend").style.display = "block";
                    }
                }
            }

            function resend()
            {
                document.getElementById("go").removeAttribute("disabled");
                document.getElementById("resend").style.display = "none";
            }
        </script>
    </head>
    <body style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
            <br/>
            <h1 style="font-family: Brush Script MT, cursive;font-size: 60px;color: darkred;" align="center">Checking Out Through COD</h1>
            <br/>
                <%
                    String dinein = request.getParameter("del");
                     session.setAttribute("dinein", dinein);
                    String add = "";
                    if (dinein.equals("home")) {
                        add = request.getParameter("add");
                    }
                    String method = request.getParameter("pay");
                    if (method.equals("card")) {
                        response.sendRedirect("paypal.jsp");
                    }
                    session.setAttribute("address", add);
                %>
                <table class="table table-hover">
                    <thead>
                        <tr style="background-color: lightgrey;">
                            <th>S.NO</th>
                            <th>Name</th>
                            <th>Photo</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>total price</th>
                        </tr>
                    </thead>

                    <%  ArrayList<inception.cart> al;
                        ArrayList<inception.delivery> al2 = null;
                        int total2 = 0;

                        if (session.getAttribute("cart") == null) {
                            al = new ArrayList<cart>();
                        } else {
                            al = (ArrayList<inception.cart>) (session.getAttribute("cart"));
                            al2 = (ArrayList<inception.delivery>) (session.getAttribute("deliver"));

                            for (int i = 0; i < al.size(); i++) {

                                boolean flag = true;
                                for (int k = 0; k < al2.size(); k++) {
                                    if (al2.get(k).restaurant.equals(al.get(i).restaurant)) {
                                        if (al2.get(k).isDelivery == false) {
                                            flag = false;
                                            break;
                                        }
                                    }
                                }

                                if (flag)
                                {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                    ResultSet rs = stmt.executeQuery("select * from menu where menu_id='" + al.get(i).menuid + "'  ");
                                    rs.next();

                    %>       
                    <tr>
                        <td> <%=(i + 1)%> </td>
                        <td><%=rs.getString("name")%></td>
                        <td><img src="<%=rs.getString("photo")%>" height="60" width="60"  style="border-radius: 7px;"></td>
                        <td><%=al.get(i).qty%>
                        </td>
                        <td>
                            <%=rs.getString("price")%>
                        </td>
                        <td>
                            <%
                                int price = Integer.parseInt(rs.getString("price"));
                                al.get(i).price = price;
                                int total = price * al.get(i).qty;
                                total2 += total;
                                double d = (double) price / 60.0;
                                String val2 = d + "";
                                val2 = val2.substring(0, val2.indexOf(".") + 2);
                            %>

                            <%=total%>
                        </td>
                    </tr>
                    <%
                                }
                            }
                        }

                    %>
                    <tr>
                        <td colspan="10" align="center">Total price - <%=total2%></td>
                    </tr>
                    <tr>
                        <td colspan="10" align="center">Tax (14%) - 
                            <%
                                int cal = (int) (total2 * (0.14));


                            %>
                            <%=cal%> </td>
                    </tr>
                    <tr>
                        <td colspan="10" align="center">
                            <%
                                int dvc = 0;
                                if (dinein.equals("home")) {

                                    for (int q = 0; q < al2.size(); q++) {
                                        dvc += al2.get(q).charges;
                                    }

                                }
                            %>
                            Delivery Charges: - <%=dvc%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="10" align="center">Subtotal=
                            <%
                                double cal2 = total2 + cal + dvc;

                                session.setAttribute("total", cal2);

                            %>
                            <%=cal2%></td>
                    </tr> 



                </table>

                <br />
                <table align="center">
                    <tr>
                        <td colspan="2">
                            <h3> You have chosen the dine-in option - <%=dinein%>  </h3>
                            <%
                                if (dinein.equals("home")) {
                            %>
                            <h3> You have confirmed the address - </h3>
                            <p><%=add%></p>
                            <%
                                }

                            %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h4>Please confirm your order -</h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Enter your Email-Id </b> <input type="email" size="40" id="num" required > &nbsp; <input type="button" value="Go" id="go" onclick="go()" class="btn btn-primary"/> <a href="#" id="resend" style="display: none;" onclick="resend()">Resend Verification Code</a>
                        </td>
                    </tr>
                    <tr id="tr" style="display: none;">
                        <td>
                            <b>Enter your verification code - </b> <input type="text" id="num2" required > &nbsp; <input type="button" value="Verify" id="ver" onclick="go5()" class="btn btn-primary"/>
                        </td>
                    </tr>
                    <tr>
                        <td id="data">

                        </td>
                    </tr>
                </table>
            </div>
                        <br/><br/>
            <%@include file="footer.jsp"%>
    </body>
</html>
