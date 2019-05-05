import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class user_gallery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try
        {
            HttpSession session = request.getSession();
            String username = (String)session.getAttribute("id1");
            System.out.println("#######USername:: "+username);
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from restaurant_gallery where username='" + username + "'");
            
            String s = "";
            s = s + "<div style=\"text-align: center;\"><table align=\"center\"><tr>";
            int i = 1;
            while (rs.next())
            {
                s += "<td style=\"cursor: pointer;\" onclick=\"lightboxpic('"+rs.getString("photo")+"')\"><img src=\"" + rs.getString("photo") + "\"height=\"150\" width=\"150\"><td>&nbsp;&nbsp;&nbsp</td>";
                if (i%3==0 && i!=0) 
                {
                    s += "</tr><tr><td solspan=\"3\">&nbsp;</td></tr><tr>";
                }
                i++;
            }

            s += "</tr></table></div>";
            out.println(s);
            System.out.println(s);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
