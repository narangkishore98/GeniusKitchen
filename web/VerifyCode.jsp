
<%@page import="inception.SimpleMailDemo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.*"%>
     <%
        try 
        {
            String num = request.getParameter("code");

            String code = session.getAttribute("code") + "";

            if (code.equals(num))
            {
                

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
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
                
                ArrayList<inception.cart> al = (ArrayList<inception.cart>) session.getAttribute("cart");
                rs = stmt.executeQuery("select * from order_detail");
                for (int i = 0; i < al.size(); i++) 
                {
                    rs.moveToInsertRow();
                    rs.updateInt("oid", oid);
                    rs.updateString("menu_id", al.get(i).menuid);
                    rs.updateString("qty", al.get(i).qty + "");
                    rs.updateString("price", al.get(i).price + "");
                    rs.insertRow();
                }

                for (int i = 0; i < al.size(); i++) 
                {
                    rs = stmt.executeQuery("select * from menu  where menu_id='" + al.get(i).menuid + "'");
                    rs.next();
                    al.get(i).restaurant = rs.getString("restaurant");
                }

                for (int i = 0; i < al.size(); i++) 
                {
                    String rest = al.get(i).restaurant;
                    boolean traverse = true;
                    for (int j = i - 1; j >= 0; j--) {
                        if (al.get(j).restaurant.equals(rest)) {
                            traverse = false;
                            break;
                        }
                    }
                    if (traverse) 
                    {
                        String message = "Order Booking --\n";
                        for (int j = 0; j < al.size(); j++) 
                        {
                            if (al.get(j).restaurant.equals(rest)) {
                                rs = stmt.executeQuery("select * from menu  where menu_id='" + al.get(j).menuid + "'");
                                rs.next();
                                String menu = rs.getString("name");
                                message += "Item - " + menu + " Qty - " + al.get(j).qty + "\n";
                            }
                        }
                        message += "Dine-in option - " + session.getAttribute("dinein") + "\n";
                        if (session.getAttribute("dinein").toString().equals("home"))
                        {
                            message += "Delivery Address - " + session.getAttribute("address") + "\n";
                        }
                        message += "User - " + session.getAttribute("user") + "\n Email ID - " + session.getAttribute("mobile");
                        rs = stmt.executeQuery("select * from restaurant where username='" + rest + "'");
                        rs.next();
                        String contact = rs.getString("email");
                        inception.SimpleMailDemo obj = new inception.SimpleMailDemo(contact,"Order Booking" ,message);
                    }
                }
                out.println("<br/><b style=\'color: red;\'>You have successfully submitted order</b>");
                session.setAttribute("cart", null);
            }
            else
            {
                out.println("verification code does not match");
            }
        }
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
        %>
    </body>
</html>
