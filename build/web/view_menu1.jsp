
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
            
            String id1=request.getParameter("id");
            System.out.println("id----------"+id1);
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from menu where sub_category='"+id1+"'");
            
            String  s = "";
           s = s + "<table class=\"table table-striped\" align=\"center\" >";
           s = s+"<tr style=\"background-color: lightgray;\"><th>Menu Name</th><th>Description</th><th>Price</th><th>Photo</th><th>Delete</th><th>Edit</th><th>Change Photo</th></tr>";
           int i = 1;
            while(rs.next())
            {
                s += "<tr><td><br/>"+rs.getString("name")+"</td><td style=\"width: 50%;\"><br/>"+rs.getString("description")+"</td><td><br/>"+rs.getString("price")+"</td><td><img src=\""+rs.getString("photo")+"\" height=\"100\" width=\"100\"></td><td><br/><a href=\"#\" onclick=\"go5("+ rs.getInt("menu_id")+")\" >Delete</a></td><td><br/><a href=\"edit_menu.jsp?id="+ rs.getInt("menu_id")+"\" >Edit Data</a></td><td><br/><a href=\"edit_menu_changephoto.jsp?id="+ rs.getInt("menu_id")+"\" >Change Photo</a></td></tr>";        
            }
            s+="</table>";
            out.println(s);
            System.out.println(s);
        
        }
        
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
       %>
    </body>
</html>
