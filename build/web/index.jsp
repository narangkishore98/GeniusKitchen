
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" 
                src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCJwgqN_3NBJ3thYxeNMBRSM-EW5VJPB8o&libraries=places&sensor=false&region=IN">

        </script>  
        <script type="text/javascript">
            var mapOptions;
            var map;
            var marker;
            var infowindow;

            function initialize()
            {
                var lat = document.getElementById("lat").value;
                var log = document.getElementById("log").value;

                mapOptions = {
                    center: new google.maps.LatLng(lat, log),
                    zoom: 15, //can range from 0-25
                    mapTypeId: google.maps.MapTypeId.ROADMAP //mapid can be ROADMAP, SATELLITE, HYBRID, Terrain-->
                };

                //31.635913,74.873277location of inception education..
                map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
                marker = new google.maps.Marker({
                    position: map.getCenter(),
                    map: map
                });
                infowindow = new google.maps.InfoWindow(
                        {
                            content: "Welcome",
                            size: new google.maps.Size(40, 40)
                        });
                infowindow.open(map, marker);


            }

        </script>
    </head>
    <body onload="initialize()" style="background-color: #F4F4F4;">
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

            rs1.next();
        %>
        <table>
            <tr align="center" >
                <td colspan="2"><img src="<%=rs1.getString("logo")%>" height="250" width="250" style="border-radius: 5px 50px 15px;box-shadow: 0px 2px 5px #555;" <td>
                <td><table>
                        <tr align="center">
                            <td colspan="2"><span style="font-family: Brush Script MT,cursive; font-size: 65px;color: darkred;"><%=rs1.getString("username")%></span></td>
                        </tr>
                        <tr>
                            <td><span style="font-family: sans-serif,cursive; font-size: 16px;line-height: 2.0em;font-weight: bold;">Address</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("address")%></span></td>
                        </tr>
                        <tr>
                            <td><span style="font-family: sans-serif,cursive; font-size: 16px;line-height: 2.0em; font-weight: bold;">Phone Number:</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("contact_no")%></span></td>
                        </tr>
                        <tr>
                            <td><span style="font-family: sans-serif,cursive; font-size: 16px;line-height: 2.0em; font-weight: bold;">Description</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("description")%></span></td>
                        </tr></table></td>

            </tr>   

        </table>
<hr/>
        <%
            String lat = request.getParameter("lat");
            String log = request.getParameter("long");

        %>
        <input type="hidden" value="<%=lat%>" id="lat" >
        <input type="hidden" value="<%=log%>" id="log" >
        <center>
        <div id="map_canvas" style="height: 500px; width: 1000px; border: solid 1px gray;box-shadow: 0px 2px 2px #555;">
        </div>
        </center>
        
        </div>
        <br/>
             <%@include file="footer.jsp"%>
    </body>
</html>
