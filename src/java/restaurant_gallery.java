
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class restaurant_gallery extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            HttpSession session = request.getSession();

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from restaurant_gallery where username='" + session.getAttribute("rest") + "'");
            System.out.println("result set created");

            String s = "";
            s = s + "<table><tr>";
            int i = 1;

            while (rs.next()) {
                s += "<td align=\"center\"><img src=\"" + rs.getString("photo") + "\"height=\"150\" width=\"150\"><br/>"+rs.getString("caption")+"<br/><a href = \"#\" onclick=\"delete23("+rs.getInt("rpid")+")\"/>delete</a></td><td>&nbsp;&nbsp;&nbsp</td>";
                
                if (i%3==0 && i!=0) 
                {
                    s += "</tr></table><br><br><table><tr>";
                }
                i++;
            }

            s += "</tr></table>";
            out.println(s);
            System.out.println(s);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
