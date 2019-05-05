

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user home</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        
         </head>
    <body>
       <body style="background-color: #F4F4F4;">
        <jsp:include page="new_header.jsp"/>
        <div class="container-fluid">
         <br>
         <br>
        <h1 align="center">Welcome <%=session.getAttribute("user") %></h1>
      <br>
         <br>
                </div>
                            <%@include file="footer.jsp"%>
    </body>
</html>
