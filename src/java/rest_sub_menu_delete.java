import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class rest_sub_menu_delete extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         String id=request.getParameter("id");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_menu_subcategory where rms_id='"+id+"'");
            if(rs.next())
            {
                rs.deleteRow();
                System.out.println("row Deleted");
                response.sendRedirect("restaurant_submenu_category_view.jsp?msg=Sub Menu category Deleted");
            }
        } 
        catch(Exception ex)
        {
            response.sendRedirect("restaurant_submenu_category_view.jsp?msg=Child Record Exist. Row can't be deleted.");
        }
    }

}