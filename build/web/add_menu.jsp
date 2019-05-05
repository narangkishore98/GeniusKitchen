

<%@page contentType="text/html" pageEncoding="UTF-8"%>^
<!DOCTYPE html>
<html>
    <head>

        <title>add menu</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go(obj)
            {
                var image = document.getElementById("ff").value;
                var item = document.getElementById("item").value;
                var desc = document.getElementById("desc").value;
                var price = document.getElementById("price").value;
               
                var category = document.getElementById("category").value;
                var subcat = document.getElementById("subcat").value;
                var ext = image.substring(image.lastIndexOf("."));
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".PNG" || ext == ".JPG" || ext == ".JPEG")
                {
                    obj.action = obj.action + "?image=" + ext + "&item=" + item + "&desc=" + desc +"&price=" + price  +"&cat=" + category+"&subcat=" + subcat;
                    return true;
                }
                else
                {
                    alert("upload image files only");
                    return false;
                }
            }

            function go1()
            {
                var price = document.getElementById("price").value;
                if (isNaN(phone_no))
                {
                    alert("invalid phone number");
                    return false;
                }
                else
                {
                    return true;
                }
            }
            
            
            //33333333333333333333333333333333333333333333333333333333333333333333333333333333333
            var xmlhttp;
            function go2()
            {
                var id = document.getElementById("category").value;
                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                xmlhttp.onreadystatechange = go3;
                xmlhttp.open("GET", "menu.jsp?id="+id, true);
                xmlhttp.send();
            }
            function go3()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("subcat").innerHTML = xmlhttp.responseText;
                }
            }
        </script>
    </head>
    <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
        <%@page import="java.sql.*" %>
        <%
            String msg=request.getParameter("msg");
            if(msg!=null)
            {
        %>
        <span style="color: blue"><h1><%=msg%></h1></span>
        <%
          }
%>  
        <form action="add_menu2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this)" >
            <h2 align="center"> Add Menu  </h2>
            <table align="center">
                <tr>
                    <td><br/>Name</td>
                    <td><br/><input type="text" name="item" id="item" required class="form-control"></td>
                </tr>
                <tr>
                    <td><br/>Description</td>
                    <td><br/><textarea name="desc" id="desc" required class="form-control"></textarea></td>
                </tr>

                <tr>
                    <td><br/>select image</td>
                    <td><br/><input type="file" name="file" id="ff" required class="form-control"></td>
                </tr>
                <tr>
                    <td><br/>Price</td>
                    <td><br/><input type="text" name="price" id="price" class="form-control" required/></td>
                </tr>    

                <tr>
                    <td><br/>Category (to which food belongs)</td>
                    <td><br/><select name="category" id="category" class="form-control" onchange="go2();">
                            <option value="select">select</option>
                            <%

                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from restaurant_menu_category where username=\'" + session.getAttribute("rest") + "\' ");
                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getInt("rmid")%>"><%=rs.getString("name")%></option>
                            <%
                                }
                            %>      

                        </select></td>
                </tr>
                <tr>
                    <td><br/>Select sub category</td>
                    <td><br/><select name="subcat" id="subcat" class="form-control">
                            <option value="select">select</option>
                        </select> 
                </tr>
                <tr>
                    
                    <td align="center" colspan="2"><br/><input type="submit" value=" Add " class="btn btn-success"></td>
                </tr>
            </table><br/><br/>
        </form>
           </div>
             <%@include file="footer.jsp"%>
    </body>
</html>
