
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import inception.cart;

public class AddToCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            String id = request.getParameter("id");
            String qty = request.getParameter("qty");
            ArrayList<inception.cart> al;

            HttpSession session = request.getSession();
            ArrayList<inception.cart> al2 = (ArrayList<cart>) session.getAttribute("cart");
            if (al2 != null) {
                al = al2;
            } else {
                al = new ArrayList<cart>();
            }
            boolean flag = false;
            int pos = -1;
            for (int i = 0; i < al.size(); i++) {
                if (id.equals(al.get(i).menuid)) {
                    flag = true;
                    pos = i;
                    break;
                }
            }
            if (flag) {
                if (Integer.parseInt(qty) == 0) {
                    al.remove(pos);
                } else {
                    al.get(pos).qty = Integer.parseInt(qty);
                }
            } else {
                if (Integer.parseInt(qty) == 0) {

                } else {
                    al.add(new cart(id, Integer.parseInt(qty)));
                }
            }

//change
            for (int i = 0; i < al.size(); i++)
            {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from menu  where menu_id='" + al.get(i).menuid + "'");
                rs.next();
                al.get(i).restaurant = rs.getString("restaurant");
            }
//change
            session.setAttribute("cart", al);

            for (int i = 0; i < al.size(); i++) {
                System.out.println(al.get(i).qty);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
