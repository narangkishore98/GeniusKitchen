

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class restaurant_gallery_delete extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id=Integer.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter();
        try {
            // HttpSession session= request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_gallery where rpid ='"+id+"'");
            if(rs.next())
            {
                rs.deleteRow();
                System.out.println("row deleted");
                out.println("success");
//                response.sendRedirect("restaurant_gallery.jsp");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
}
}