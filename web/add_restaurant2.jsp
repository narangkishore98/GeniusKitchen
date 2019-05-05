

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
        function go(obj)
           {
               var name=document.getElementById("ff").value;
               var ext=name.substring(name.lastIndexOf("."));
               if(ext==".jpg"||ext==".jpeg"||ext==".png"||ext==".PNG"||ext==".JPG"||ext==".JPEG")
               {
                   obj.action = obj.action +"&fn=" + name;
                   return true;
               }
               else
               {
                   alert("upload image files only");
                   return false;
               }
           }
</script> 
    </head>
     <body style="background-color: #F4F4F4;">
       <jsp:include page="new_header.jsp"/>
        <div class="container-fluid" align="center"><br/><br/>
                <h2 class="headings" align="center">Upload Restaurant Logo</h2>
        <br/>
                <%@page import="java.sql.*" %>
       <%
            String username,password,conf_password,name,description,logo,email,contactno,city,address,security_ques,security_ans,latitude,longitude,delivery_in,min_order,delivery_charges,free_delivery_above;
            username=request.getParameter("username");
            password=request.getParameter("password");
            name=request.getParameter("name");
            description=request.getParameter("description");
            logo=request.getParameter("logo");
            email=request.getParameter("email");
            contactno=request.getParameter("contactno");
            city=request.getParameter("city");
            address=request.getParameter("address");
            security_ques=request.getParameter("security_ques");
            security_ans=request.getParameter("security_ans");
            latitude=request.getParameter("latitude");
            longitude=request.getParameter("longitude");
            delivery_in=request.getParameter("delivery_in");
            min_order=request.getParameter("min_order");
            delivery_charges=request.getParameter("delivery_charges");
            free_delivery_above=request.getParameter("free_delivery_above");
            //jdbc code
            System.out.println(username);
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant where username=\'"+username+"\' ");
                System.out.println("result set created");
        
                if(rs.next())
                {
                  response.sendRedirect("add_restaurant.jsp?msg=restaurant with same name already exists");
                }
                else
                {
                    rs.moveToInsertRow();
                    rs.updateString("username",username);
                    rs.updateString("password",password);
                    rs.updateString("name",name);
                    rs.updateString("description",description);
                    rs.updateString("email",email);
                    rs.updateString("contact_no",contactno);
                    rs.updateString("address",address);
                    rs.updateString("security_question",security_ques);
                    rs.updateString("security_ans",security_ans);
                    rs.updateString("latitude",latitude);
                    rs.updateString("longitude",longitude);
                    rs.updateString("city",city);
                    rs.updateString("delivery_in",delivery_in);
                    rs.updateString("min_order",min_order);
                    rs.updateString("delivery_charges",delivery_charges);
                    rs.updateString("free_delivery_above",free_delivery_above);
                    rs.updateString("status","pending");
                    rs.insertRow();
                    out.println("restaurant added successfully");
                }
                %>
                    
              <form action="add_restaurant_logo.jsp?msg=<%=username%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
              <table align="center">
                  <tr>
                      <td> <input type="file" name="file" id="ff" ></td>
                  </tr>
                  <tr>
                      <td> <input type="submit" style="width: 250px;height: 40px;border-radius: 20px;background-color: darkred;font-size: 18px;color: white;border: none;" value="upload button"></td>
                  </tr>
                  </table>
          </form>
             </div>
                            <%@include file="footer.jsp"%>
    </body>
</html>
