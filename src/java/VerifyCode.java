
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import inception.cart;
import inception.sms;

public class VerifyCode extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            String num = request.getParameter("code");

            HttpSession session = request.getSession();
            String code = session.getAttribute("code") + "";

            if (code.equals(num)) {
                out.println("you have successfully submitted order");

                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                System.out.println("connection with database success");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from orders");
                rs.moveToInsertRow();
                rs.updateDate("date", new java.sql.Date(new java.util.Date().getTime()));
                rs.updateString("username", session.getAttribute("user").toString());
                rs.updateString("total", session.getAttribute("total").toString());
                rs.insertRow();
                rs = stmt.executeQuery("select max(oid) 'oid' from orders");
                rs.next();
                int oid = rs.getInt("oid");
                ArrayList<cart> al = (ArrayList<cart>) session.getAttribute("cart");
                rs = stmt.executeQuery("select * from order_detail");
                for (int i = 0; i < al.size(); i++) {
                    rs.moveToInsertRow();
                    rs.updateInt("oid", oid);
                    rs.updateString("menu_id", al.get(i).menuid);
                    rs.updateString("qty", al.get(i).qty + "");
                    rs.updateString("price", al.get(i).price + "");
                    rs.insertRow();
                }

                for (int i = 0; i < al.size(); i++) {
                    rs = stmt.executeQuery("select * from menu  where menu_id='" + al.get(i).menuid + "'");
                    rs.next();
                    al.get(i).restaurant = rs.getString("restaurant");
                }

                for (int i = 0; i < al.size(); i++) {
                    String rest = al.get(i).restaurant;
                    boolean traverse = true;
                    for (int j = i - 1; j >= 0; j--) {
                        if (al.get(j).restaurant.equals(rest)) {
                            traverse = false;
                            break;
                        }
                    }
                    if (traverse) {
                        String message = "Order Booking --\n";
                        for (int j = 0; j < al.size(); j++) {

                            if (al.get(j).restaurant.equals(rest)) {
                                rs = stmt.executeQuery("select * from menu  where menu_id='" + al.get(j).menuid + "'");
                                rs.next();
                                String menu = rs.getString("name");
                                message += "Item - " + menu + " Qty - " + al.get(j).qty + "\n";
                            }
                        }
                        message += "Dine-in option - " + session.getAttribute("dinein") + "\n";
                        if (session.getAttribute("dinein").toString().equals("home")) {
                            message += "Delivery Address - " + session.getAttribute("address") + "\n";
                        }
                        message += "User - " + session.getAttribute("user") + "\n Mobile - " + session.getAttribute("mobile");
                        rs = stmt.executeQuery("select * from restaurant where username='" + rest + "'");
                        rs.next();
                        String contact = rs.getString("contact_no");
                        inception.sms obj = new sms(contact, message);
                                
                    }
                }

                session.setAttribute("cart", null);

            } else {
                out.println("verification code does not match");
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
