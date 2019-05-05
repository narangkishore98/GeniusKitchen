
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
          try {
            int id =Integer.parseInt(request.getParameter("id"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_menu_subcategory where rm_id="+id);
            
            String  s = "";
            s = s + "<table class=\"table table-striped\" align=\"center\" >";
            int i = 1;
            while(rs.next())
            {
                s += "<tr><td>"+rs.getString("sub_name")+"</td><td><img src=\""+rs.getString("photo")+"\" height=\"100\" width=\"100\"></td><td><a href=\"rest_sub_menu_delete.jsp?id="+rs.getInt("rms_id")+"\" onclick=\"return go5()\">Delete</a></td></tr>";        
            }
            s+="</table>";
            out.println(s);
        } 
        catch(Exception ex){
            out.close();
        }
       %>
    </body>
</html>
