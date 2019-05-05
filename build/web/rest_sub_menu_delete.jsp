
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
     <%
        int id= Integer.parseInt(request.getParameter("id"));
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_menu_subcategory where rms_id="+id);
            if(rs.next())
            {
                rs.deleteRow();
                response.sendRedirect("restaurant_submenu_category_view.jsp?msg=Sub Menu category Deleted");
            }
        } 
        catch(Exception ex)
        {
            response.sendRedirect("restaurant_submenu_category_view.jsp?msg=Child Record Exist. Row can't be deleted.");
        }
        %>
    </body>
</html>
