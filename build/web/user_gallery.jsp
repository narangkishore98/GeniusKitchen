

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
             String username = (String)session.getAttribute("id1");
            System.out.println("#######USername:: "+username);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from restaurant_gallery where username='" + username + "'");
            
            String s = "";
            s = s + "<h2 align='center'>Photo Gallery</h2><div style=\"text-align: center;\"><table align=\"center\"><tr>";
            int i = 1;
            while (rs.next())
            {
                s += "<td style=\"cursor: pointer;\" onclick=\"lightboxpic('"+rs.getString("photo")+"')\"><img src=\"" + rs.getString("photo") + "\"height=\"200\" width=\"200\" style=\"border-radius: 50%;\"><td>&nbsp;&nbsp;&nbsp</td>";
                if (i%3==0 && i!=0) 
                {
                    s += "</tr><tr><td solspan=\"3\">&nbsp;</td></tr><tr>";
                }
                i++;
            }

            s += "</tr></table></div>";
            out.println(s);

        
        %>
    </body>
</html>
