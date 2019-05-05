
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%@page import="java.sql.*" %>
        <%@page import="inception.*" %>
        <%@page import="java.util.*" %>
        <%
           try
           {
                String id = request.getParameter("id");
                ArrayList<inception.cart> al2 = (ArrayList<cart>) session.getAttribute("cart");
                al2.remove(Integer.parseInt(id));
                System.out.println(id);
                session.setAttribute("cart", al2);
           } 
           catch (Exception ex) 
           {
              ex.printStackTrace();
           }
        %>
    </body>
</html>
