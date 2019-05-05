
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">


        <script>


            function lightboxpic(ob)
            {
                var width = window.innerWidth;
                var height = window.innerHeight;

                document.getElementById("div1").style.display = "block";
                width = (width - 400) / 2;
                height = (height - 100) / 2;

                document.getElementById("div2").style.display = "block";
                document.getElementById("close").style.display = "block";
                document.getElementById("close").style.top = (height - 20) + "px";
                document.getElementById("close").style.left = (width + 375) + "px";
                document.getElementById("div2").style.top = height + "px";
                document.getElementById("div2").style.left = width + "px";
                document.getElementById("img1").src = ob;
            }


            var xmlhttp;

            function removelightbox()
            {
                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                var city = document.getElementById("city").value;
                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "SetCity.jsp?city=" + city, true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                {
                    document.getElementById("div2").style.display = "none";
                    document.getElementById("div1").style.display = "none";
                    document.getElementById("close").style.display = "none";
                    window.location.href = "main_home2.jsp?cus=" + document.getElementById("cus").value;
                }
            }
        </script>
    </head>
    <%@page import="java.sql.*" %>
    <body onload="lightboxpic()" style="background-color: #F4F4F4;">
        <%@page import="java.sql.*" %>
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
            <br/>
                <%
                String cuisine = request.getParameter("q");
                
                %>
                <input type="hidden" value="<%=cuisine%>" id="cus">


    </div>


    <%@include file="footer.jsp"%>
</div>
<div id="div1" style="display: none; z-index: 3000; height: 100% ; width: 100%; background-color: gray; opacity: 0.6; position: fixed; top: 0px; left: 0px;">

</div>
<div id="div2" style="display: none; text-align: center;  z-index: 8000; height: 100px ; width: 400px; background-color: #fe8908; border: solid 5px white; border-radius: 10px; position: fixed; top: 300px; left: 400px;">
    <table width="100%" >
        <tr>
            <td>Enter City</td>
        <br>
        <td><select name="city" id="city">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                    System.out.println("connection with database success");
                    Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs2 = stmt2.executeQuery("select * from city");
                    System.out.println("result set created");

                    while (rs2.next()) {
                %>  
                <option value="<%=rs2.getString("city")%>"><%=rs2.getString("city")%></option>
                <%
                    }
                %>      

            </select></td>

        <td colspan="2"><input type="button" id="submit" onclick="removelightbox()" value="Find Restaurants" /></td>
        </tr>

    </table> 
</div>
<a onclick="removelightbox()" href="#" id="close" style="display: none; z-index: 8000;  color: white; border: none; position: fixed; top: 300px; left: 400px;" ></a>

</body>
</html>
