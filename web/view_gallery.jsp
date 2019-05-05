
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view gallery</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            var xmlhttp;
            function go1()
            {
                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "user_gallery.jsp", true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("pic").innerHTML = xmlhttp.responseText;
                }
            }
     

            function lightboxpic(ob)
            {
                var width = window.innerWidth;
                var height = window.innerHeight;

                document.getElementById("div1").style.display = "block";
                width = (width - 600) / 2;
                height = (height - 500) / 2;

                document.getElementById("div2").style.display = "block";
                document.getElementById("close").style.display = "block";
                document.getElementById("close").style.top = (height-20)+"px";
                document.getElementById("close").style.left = (width+575)+"px";
                document.getElementById("div2").style.top = height + "px";
                document.getElementById("div2").style.left = width + "px";
                document.getElementById("img1").src = ob;
            }
            function removelightbox()
            {
                document.getElementById("div2").style.display = "none";
                document.getElementById("div1").style.display = "none";
                document.getElementById("close").style.display = "none";

            }
        </script>

    </head>
    <body onload="go1()" style="background-color: #F4F4F4;">
         <%@page import="java.sql.*" %>
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
            <br/>
        <%
            String user = request.getParameter("user");
            session.setAttribute("id1", user);
            user = request.getParameter("user");

            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = stmt1.executeQuery("select * from restaurant where username='" + user + "'");
            rs1.next();
        %>
        <table align="center">
            <tr  >
                <td colspan="2"><img src="<%=rs1.getString("logo")%>" height="250" width="250" style="border: solid 2px lightskyblue;" <td>
                <td><table><tr align="center">
                            <td colspan="2"><span style="font-family: cursive; font-size: 22px; font-weight: bold;"><%=rs1.getString("username")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Address</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("address")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Phone Number:</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("contact_no")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Description</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("description")%></span></td>
                        </tr></table></td>

            </tr>   

        </table>
        <hr/>
        <div id="pic"></div>


<!--        <a href="#" onclick="lightboxpic('./images/a.jpg')" title="profile pic"><img src="./images/a.jpg" width=100 height=100/></a>-->
       
        <div id="div1" style="display: none; z-index: 30; height: 100% ; width: 100%; background-color: gray; opacity: 0.6; position: fixed; top: 0px; left: 0px;">

        </div>
        <div id="div2" style="display: none;  z-index: 80; height: 500px ; width: 600px; background-color: white; border: solid 5px white; border-radius: 10px; position: fixed; top: 300px; left: 400px;">
            <img height="500" width="600" src="" id="img1">
            
        </div>
        <a onclick="removelightbox()" href="#" id="close" style="display: none; z-index: 100;  color: white; border: none; position: fixed; top: 300px; left: 400px;" >Close</a>
       </div>
       <%@include file="footer.jsp"%>
    </body>
</html>
