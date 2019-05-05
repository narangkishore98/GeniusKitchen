
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main">
                <%@page import="java.sql.*" %>

                <%
                 String rest = request.getParameter("rest");
                 try
                 {
                    String comment, rating, spicy, yummy, presentation;
                    comment = request.getParameter("comment");
                    rating = request.getParameter("rate");
                    spicy = request.getParameter("rate1");
                    yummy = request.getParameter("rate2");
                    presentation = request.getParameter("rate3");
                    
                    String user = (String) session.getAttribute("user");
                   
                    //jdbc code
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs = stmt.executeQuery("select * from comments");
                    rs.moveToInsertRow();
                    rs.updateString("comment", comment);
                    rs.updateString("rating", rating);
                    rs.updateString("spicy", spicy);
                    rs.updateString("yummy", yummy);
                    rs.updateString("presentation", presentation);
                    rs.updateString("user", user);
                    rs.updateString("restaurant", rest);
                    rs.updateDate("date", new java.sql.Date(new java.util.Date().getTime()));
                    rs.insertRow();
                    response.sendRedirect("comment.jsp?user=" + rest);
                 }
                 catch(Exception e)
                 {
                     response.sendRedirect("comment.jsp?user="+ rest);
                 }

                %>
                <h1> Comment added successfully</h1>
            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
