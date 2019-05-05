package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import inception.cart;
import java.util.ArrayList;
import java.sql.*;

public final class home3_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Menu</title>\n");
      out.write("        <link href=\"css1.css\" type=\"text/css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"SpryAssets/SpryTabbedPanels.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"SpryAssets/SpryTabbedPanels.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            var xmlhttp;\n");
      out.write("            function go(id)\n");
      out.write("            {\n");
      out.write("                xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers\n");
      out.write("                var qty = document.getElementById(\"a_\" + id).value;\n");
      out.write("                xmlhttp.onreadystatechange = go2;\n");
      out.write("                xmlhttp.open(\"GET\", \"AddToCart.jsp?id=\" + id + \"&qty=\" + qty, true);\n");
      out.write("                xmlhttp.send();\n");
      out.write("            }\n");
      out.write("            function go2()\n");
      out.write("            {\n");
      out.write("                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)\n");
      out.write("                {\n");
      out.write("                    //document.getElementById(\"pic\").innerHTML = xmlhttp.responseText;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function up(id)\n");
      out.write("            {\n");
      out.write("                var qty = parseInt(document.getElementById(\"a_\" + id).value);\n");
      out.write("                qty++;\n");
      out.write("                document.getElementById(\"a_\" + id).value = qty;\n");
      out.write("            }\n");
      out.write("            function down(id)\n");
      out.write("            {\n");
      out.write("                var qty = parseInt(document.getElementById(\"a_\" + id).value);\n");
      out.write("                qty--;\n");
      out.write("                if (qty <= 0)\n");
      out.write("                {\n");
      out.write("                    qty = 0;\n");
      out.write("                }\n");
      out.write("                document.getElementById(\"a_\" + id).value = qty;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("     <body style=\"background-color: #F4F4F4;\">\n");
      out.write("        \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "new_header.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <br/>\n");
      out.write("        ");

            String user;
            user = request.getParameter("user");

            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from restaurant where username='" + user + "'");
            System.out.println("result set created");

            rs.next();
        
      out.write("\n");
      out.write("        <table align='center'>\n");
      out.write("            <tr>\n");
      out.write("                <td colspan=\"2\"><img src=\"");
      out.print(rs.getString("logo"));
      out.write("\" height=\"250\" width=\"250\" style=\"border-radius: 15px 50px 30px;\"/> <td>\n");
      out.write("                <td>\n");
      out.write("                    <table>\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"2\"><span style=\"font-family: Brush Script MT, cursive;font-size: 55px;color: darkred;\" align=\"center\">");
      out.print(rs.getString("username"));
      out.write("</span><br/></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><span style=\"font-family: sans-serif,cursive; font-size: 16px;line-height: 1.5;font-weight: bold;\">Address</span></td>\n");
      out.write("                            <td><span style=\"font-family: cursive;line-height: 1.5; font-size: 14px;\">");
      out.print(rs.getString("address"));
      out.write("</span></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><span style=\"font-family: sans-serif,cursive; font-size: 16px;line-height: 1.5; font-weight: bold;\">Phone Number:</span></td>\n");
      out.write("                            <td><span style=\"font-family: cursive; font-size: 14px;line-height: 1.5;\">");
      out.print(rs.getString("contact_no"));
      out.write("</span></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><span style=\"font-family: sans-serif,cursive; font-size: 16px;line-height: 1.5; font-weight: bold;\">Delivery In</span></td>\n");
      out.write("                            <td><span style=\"font-family: cursive; font-size: 14px;line-height: 1.5;\">");
      out.print(rs.getString("delivery_in"));
      out.write("</span> minutes</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><span style=\"font-family: sans-serif,cursive; font-size: 16px; line-height: 1.5;font-weight: bold;\">Delivery charges</span></td>\n");
      out.write("                            <td><span style=\"font-family: cursive; font-size: 14px;line-height: 1.5;\">");
      out.print(rs.getString("delivery_charges"));
      out.write("</span> rs</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td><span style=\"font-family: sans-serif,cursive; line-height: 1.5;font-size: 16px; font-weight: bold;\">Free Delivery Above</span></td>\n");
      out.write("                            <td><span style=\"font-family: cursive; font-size: 14px;line-height: 1.5;\">");
      out.print(rs.getString("free_delivery_above"));
      out.write("</span> rs</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr style=\"height: 50px; font-size: 22px;\">\n");
      out.write("                            <td><a href=\"view_gallery.jsp?user=");
      out.print(user);
      out.write("\" style=\"padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: green;\">Gallery</a></td>\n");
      out.write("                            <td><a href=\"comment.jsp?user=");
      out.print(user);
      out.write("\" style=\"padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: royalblue;\"> Post a Review</a>\n");
      out.write("                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=\"index.jsp?lat=");
      out.print(rs.getString("latitude"));
      out.write("&long=");
      out.print(rs.getString("longitude"));
      out.write("&user=");
      out.print(user);
      out.write("\" style=\"padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: darkred;\">Location</a></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("                </td>\n");
      out.write("            </tr>   \n");
      out.write("        </table>\n");
      out.write("        <br>\n");
      out.write("        <hr>\n");
      out.write("        <br>\n");
      out.write("                        \n");
      out.write("        ");

            String user2;
            user2 = request.getParameter("user");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            System.out.println("connection with database success");
            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select food_category.* from food_category inner join restaurant_category on  restaurant_category.fc_name=food_category.fc_name where username=\'" + user2 + "\'");
            System.out.println("result set created");
        
      out.write("\n");
      out.write("        <center>\n");
      out.write("            <span style=\"font-family: Brush Script MT, cursive;font-size: 40px;color: darkred;\">Cuisines Served</span>\n");
      out.write("            <table>\n");
      out.write("              <tr>\n");
      out.write("                    ");

                        while (rs2.next())
                        {
                    
      out.write("\n");
      out.write("                    <td style=\"text-align: center;\">\n");
      out.write("                        <img src=\"");
      out.print(rs2.getString("logo"));
      out.write("\" height=\"150\" width=\"150\" style=\"border-radius: 10px;box-shadow: 5px 5px 10px darkgray\"/>\n");
      out.write("                    <br>\n");
      out.write("                    <b>");
      out.print(rs2.getString("fc_name"));
      out.write("</b>\n");
      out.write("                    </td>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        <hr/>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("        <div id=\"TabbedPanels1\" class=\"TabbedPanels\">\n");
      out.write("            <ul class=\"TabbedPanelsTabGroup\">\n");
      out.write("                    ");

                        ArrayList<Integer> al = new ArrayList<>();
                        String user3;
                        user3 = request.getParameter("user");
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Driver loaded successfully");
                        Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                        System.out.println("connection with database success");
                        Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs3 = stmt3.executeQuery("select  *  from restaurant_menu_category where username=\'" + user3 + "\'");
                        System.out.println("result set created");
                        while (rs3.next())
                        {
                    
      out.write("\n");
      out.write("                    <li class=\"TabbedPanelsTab\" tabindex=\"0\">");
      out.print(rs3.getString("name"));
      out.write("</li>\n");
      out.write("                    ");

                            al.add(rs3.getInt("rmid"));
                        }
                    
      out.write("\n");
      out.write("            </ul>\n");
      out.write("                <div class=\"TabbedPanelsContentGroup\">\n");
      out.write("                    ");

                        for (int i = 0; i < al.size(); i++) {

                            Class.forName("com.mysql.jdbc.Driver");
                            System.out.println("Driver loaded successfully");
                            Connection conn4 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                            System.out.println("connection with database success");
                            Statement stmt4 = conn4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs4 = stmt4.executeQuery("select  *  from restaurant_menu_subcategory where rm_id=\'" + al.get(i) + "\'");
                            System.out.println("result set created");
                    
      out.write("\n");
      out.write("                    <div class=\"TabbedPanelsContent\">\n");
      out.write("                        ");

                            while (rs4.next()) {
                        
      out.write("\n");
      out.write("                            <h2>");
      out.print(rs4.getString("sub_name"));
      out.write("</h2>\n");
      out.write("                            <img src=\"");
      out.print(rs4.getString("photo"));
      out.write("\" style=\"width: 950px; height: 250px;border-radius: 10px;box-shadow: 0px 2px 5px gray;\">\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("                            <h3>Menu Items</h3>\n");
      out.write("                            ");

                                Class.forName("com.mysql.jdbc.Driver");
                                System.out.println("Driver loaded successfully");
                                Connection conn5 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                                System.out.println("connection with database success");
                                Statement stmt5 = conn5.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs5 = stmt5.executeQuery("select  *  from menu where sub_category='" + rs4.getString("rms_id") + "'");
                                System.out.println("result set created");

                            
      out.write("\n");
      out.write("                            <table width=\"100%\" align='center'>\n");
      out.write("                                <tr style=\"text-align: center;\">\n");
      out.write("                                    <th></th>\n");
      out.write("                                    <th align='center'>Item</th>\n");
      out.write("                                    <th width=\"400\">Description</th>\n");
      out.write("                                    <th>Price(in Rs.)</th>\n");
      out.write("                                    <th>Quantity</th>\n");
      out.write("                                    <th></th>\n");
      out.write("                                </tr>\n");
      out.write("                                ");

                                while (rs5.next()) 
                                {
                                        System.out.println(rs5.getString("name"));
                                
      out.write("\n");
      out.write("                                <tr align='left'>\n");
      out.write("                                    <td>\n");
      out.write("                                        <img src=\"");
      out.print(rs5.getString("photo"));
      out.write("\" height=\"100\" width=\"100\" style=\"border-radius: 7px;box-shadow: 0px 2px 5px gray;\">\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        ");
      out.print(rs5.getString("name"));
      out.write("\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        ");
      out.print(rs5.getString("description"));
      out.write("\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                        ");
      out.print(rs5.getString("price"));
      out.write("\n");
      out.write("                                    </td>\n");
      out.write("                                    <td>\n");
      out.write("                                         ");

                                            int qty = 0;
                                            ArrayList<inception.cart> al2 = (ArrayList<cart>) session.getAttribute("cart");
                                            if (al2 != null) {
                                                for (int k = 0; k < al2.size(); k++) {
                                                    if (al2.get(k).menuid.equals(rs5.getInt("menu_id") + "")) {
                                                        qty = al2.get(k).qty;
                                                    }
                                                }
                                            }
                                        
      out.write("\n");
      out.write("                                        <input onclick=\"down('");
      out.print(rs5.getInt("menu_id"));
      out.write("')\" type=\"button\" value=\"-\" style=\"width: 25px;background-color: darkred;border: none;color: white;\"> \n");
      out.write("                                        <input type=\"text\" style=\"width: 20px;\" id=\"a_");
      out.print(rs5.getInt("menu_id"));
      out.write("\" value=\"");
      out.print(qty);
      out.write("\" readonly>\n");
      out.write("                                        <input type=\"button\" onclick=\"up('");
      out.print(rs5.getInt("menu_id"));
      out.write("')\" value=\"+\" style=\"width: 25px;background-color: green;border: none;color: white;\">\n");
      out.write("                                    </td>\n");
      out.write("                                    <td align='center'>\n");
      out.write("                                        <a href=\"#\" onclick=\"go('");
      out.print(rs5.getInt("menu_id"));
      out.write("')\" style=\"padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: #555;\">Add to Cart</a>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr><td colspan=\"6\"><hr/></td></tr>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                            </table>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("                        \n");
      out.write("                        <br>\n");
      out.write("                        <br>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <script type=\"text/javascript\">\n");
      out.write("                var TabbedPanels1 = new Spry.Widget.TabbedPanels(\"TabbedPanels1\");\n");
      out.write("            </script>\n");
      out.write("        \n");
      out.write("                </center>\n");
      out.write("            </div>\n");
      out.write("                    ");
      out.write("\n");
      out.write("<div style=\"background-color: #222;color: white;height: 100px;font-size: 20px;padding-top: 15px;box-shadow: 0px 0px 10px yellow;\">\n");
      out.write("    <table width=\"100%\">\n");
      out.write("        <tr>\n");
      out.write("            <td width=\"55%\">Guru Nanak Dev University</td>\n");
      out.write("            <td align=\"right\">Developed By:</td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>Amritsar</td>\n");
      out.write("            <td align=\"right\">Govind</td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("    ");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
