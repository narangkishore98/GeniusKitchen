
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class view_menu extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
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
           s = s + "<table border=\"1\" align=\"center\" >";
           int i = 1;
            while(rs.next())
            {
                s += "<tr><td>"+rs.getString("name")+"</td><td>"+rs.getString("description")+"</td><td>"+rs.getString("price")+"</td><td><img src=\""+rs.getString("photo")+"\" height=\"100\" width=\"100\"></td><td><a href=\"#\" onclick=\"go5("+ rs.getInt("menu_id")+")\" >delete</a></td><td><a href=\"edit_menu.jsp?id="+ rs.getInt("menu_id")+"\" >edit data</a></td><td><a href=\"edit_menu_changephoto.jsp?id="+ rs.getInt("menu_id")+"\" >change photo</a></td></tr>";        
            }
            s+="</table>";
            out.println(s);
            System.out.println(s);
        
        }
        
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }

}