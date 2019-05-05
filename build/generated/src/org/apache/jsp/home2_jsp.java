package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class home2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"css1.css\" type=\"text/css\" rel=\"stylesheet\">\n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-color: #F4F4F4;\">\n");
      out.write("         \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "new_header.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"container-fluid\"><br/>\n");
      out.write("             <h1 style=\"font-family: Brush Script MT, cursive;font-size: 50px;color: darkred;\" align=\"center\">Results</h1>\n");
      out.write("            <table align='center'>\n");
      out.write("                \n");
      out.write("        ");

            String city, food;
            city = request.getParameter("city");
           // food = request.getParameter("food");

            //food = food.trim();
            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
            Statement stmt = conn.createStatement();
          //  ResultSet rs = stmt.executeQuery("select restaurant.* from restaurant inner join restaurant_menu_category "
          //          + " on restaurant.username=restaurant_menu_category.username inner join restaurant_menu_subcategory on  "
          //          + " restaurant_menu_category.rmid=restaurant_menu_subcategory.rm_id where city='"+city+"' and restaurant_menu_subcategory.sub_name='"+food+"'");
          //  System.out.println("result set created");
           // if (food.equals("")) {

               ResultSet rs = stmt.executeQuery("select distinct restaurant.* from restaurant inner join restaurant_menu_category "
                        + " where city='"+ city +"' and status=\'approved\'");
           // }
            int i=0;
        
      out.write("\n");
      out.write("        \n");
      out.write("            ");

                while (rs.next()) {
                    if(i%3==0)
                    {
            
      out.write("\n");
      out.write("            </tr><tr>\n");
      out.write("            ");

                    }
                    i++;
                    
            
      out.write("\n");
      out.write("            <td>\n");
      out.write("                <table width=\"400px\">\n");
      out.write("                    <tr align=\"center\" >\n");
      out.write("                        <td colspan=\"2\"><img src=\"");
      out.print(rs.getString("logo"));
      out.write("\" height=\"300\" width=\"300\" style=\"border-radius: 15px 50px 30px;box-shadow: 0 4px 40px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);\"/> <td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr align=\"center\">\n");
      out.write("                        <td colspan=\"2\"><span style=\"font-family: cursive; font-size: 22px; font-weight: bold;\">");
      out.print(rs.getString("username"));
      out.write("</span></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr align=\"center\">\n");
      out.write("                        <td><br/><span style=\"font-family: cursive; font-size: 16px; font-weight: bold;\">Address</span></td>\n");
      out.write("                        <td><br/><span style=\"font-family: cursive; font-size: 14px;\">");
      out.print(rs.getString("address"));
      out.write("</span></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr align=\"center\">\n");
      out.write("                        <td><span style=\"font-family: cursive; font-size: 16px; font-weight: bold;\">(M)</span></td>\n");
      out.write("                        <td><span style=\"font-family: cursive; font-size: 14px;\">");
      out.print(rs.getString("contact_no"));
      out.write("</span></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr align=\"center\">\n");
      out.write("                        <td colspan=\"2\"><br/><a href=\"home3.jsp?user=");
      out.print(rs.getString("username"));
      out.write("\" style=\"padding: 10px 35px 10px 35px;color: white;border-radius: 15px;background-color: green;\">View Menu</a></td>\n");
      out.write("                    </tr>\n");
      out.write("                </table><hr/>\n");
      out.write("            </td>\n");
      out.write("            ");

                }
            
      out.write("\n");
      out.write("        \n");
      out.write("            </table>\n");
      out.write("       </div>\n");
      out.write("       ");
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
      out.write("    </body>\n");
      out.write("</html>\n");
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
