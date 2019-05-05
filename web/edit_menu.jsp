
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit menu</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>

            function go()
            {
                return confirm(" are you sure u want to update ?");
            }
            var xmlhttp;
            function go1()
            {
                 var id = document.getElementById("category").value;

              
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
                }
                catch (e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
                    }
                    catch (e2)
                    {
                        xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                    }
                }



                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "./menu?id=" + id, true);
                xmlhttp.send();
            }
            function go2()
            {
               
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    
                    document.getElementById("subcat").innerHTML = xmlhttp.responseText;
                }
            }
            
            
            //##############################################################################
            
            function go3()
            {
                 var id1 = document.getElementById("subcat").value;

                 
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
                }
                catch (e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
                    }
                    catch (e2)
                    {
                        xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                    }
                }



                xmlhttp.onreadystatechange = go4;
                xmlhttp.open("GET", "./view_menu?id="+id1, true);
                xmlhttp.send();
            }
            function go4()
            {
               
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    
                    document.getElementById("show").innerHTML = xmlhttp.responseText;
                }
            }
            
            
        </script>
            </head>
             
           <body style="background-color: #F4F4F4;">
        <%@include file="header_rest.jsp"%>
            
         <div class="container-fluid" align="center">
           <br/>
            <%@page import="java.sql.*" %>
            <h2>Edit Menu</h2>
            <%

                String id = request.getParameter("id");
                ///JDBC CODE/////
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from menu where menu_id='" + id + "'");
                if (rs.next()) {
            %>
                
            <form action ="edit_menu2.jsp?id=<%= id%>" method = "post">
                <table class="table table-striped" style="width: 50%;" align="center">
                    <tr>
                    <td><br/> Name </td>
                    <td><br/> <input type="text" value="<%=rs.getString("name")%>" name = "item" required class="form-control" id = "item"/> </td>
                    </tr>
                    <tr>
                    <td><br/> Description </td>
                    <td><br/> <textarea  name = "desc" required class="form-control"><%=rs.getString("description")%> </textarea></td>
                    </tr>
                    <tr>
                    <td><br/> Price </td>
                    <td><br/> <input type = "text" value = "<%=rs.getString("price")%>" name = "price" id = "price" class="form-control"/> </td>
                    </tr>
                    <tr>

                        <td><br/> select category </td>
                        <td><br/><select name="category" id="category" onchange="go1()" class="form-control">
                                <option>select</option>
                                <%

                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Driver loaded successfully");
                                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                    System.out.println("connection with daabase success");
                                    Statement stmt2 = conn2.createStatement();
                                    ResultSet rs2 = stmt2.executeQuery("select * from restaurant_menu_category where username=\'" + session.getAttribute("rest") + "\' ");
                                    System.out.println("result set created");
                                    System.out.println(session.getAttribute("rest"));
                                    while (rs2.next()) {
                                %>  
                                <option value="<%=rs2.getInt("rmid")%>"
                                        <%
                                        if(rs.getInt("category") == rs2.getInt("rmid")) {
                                            %>
                                            selected="selected"
                                            
                                            <%
                                        }
                                        %>
                                        
                                       ><%=rs2.getString("name")%></option>
                                <%
                                    }
                                %>      

                            </select></td>

                    </tr>
                    <tr>
                        <td><br/>select sub category</td>
                    <td><br/><select name="subcat" id="subcat" onchange="go3()" class="form-control">
                             <%

                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Driver loaded successfully");
                                    Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                    System.out.println("connection with database success");
                                    Statement stmt3 = conn3.createStatement();
                                    ResultSet rs3 = stmt3.executeQuery("select * from restaurant_menu_subcategory where rm_id=\'" + rs.getInt("category") + "\' ");
                                    System.out.println("result set created");
                                    System.out.println(session.getAttribute("rest"));
                                    while (rs3.next()) {
                                %>  
                                <option value="<%=rs3.getInt("rms_id")%>"
                                        <%
                                        if(rs.getInt("sub_category") == rs3.getInt("rms_id")) {
                                            %>
                                            selected="selected"
                                            
                                            <%
                                        }
                                        %>
                                        ><%=rs3.getString("sub_name")%></option>
                                <%
                                    }
                                    %>
                        </select>
                        </td>
                    </tr>
                    <tr>
                    <td colspan = "2" align="center"><br/> <input type = "submit" value = "Update" class="btn btn-primary" onclick="return go()"/></td>
                    </tr>
                    </table>
                    </form>
                    <br/><br/>
            <%
                }
            %>
            </div>
            <%@include file="footer.jsp"%>
    </body>
</html>
