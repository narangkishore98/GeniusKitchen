
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%@page import="inception.*" %>
        <%@page import="java.util.*" %>
        <%
          try 
          {
            String id = request.getParameter("id");
            String qty = request.getParameter("qty");
            System.out.println("ID: "+id +" , Quantity: "+qty);
            ArrayList<cart> al;
            
            ArrayList<cart> al2 = (ArrayList<cart>) session.getAttribute("cart");
            if (al2 != null) {
                al = al2;
            } else {
                al = new ArrayList<>();
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
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/geniuskitchen", "root", "rootsystem");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from menu  where menu_id='" + al.get(i).menuid + "'");
                rs.next();
                al.get(i).restaurant = rs.getString("restaurant");
            }
//change
            session.setAttribute("cart", al);

            for (int i = 0; i < al.size(); i++)
            {
                System.out.println(al.get(i).qty);
            }

        } 
        catch (Exception ex)
        {
            ex.printStackTrace();
        }

        %>
    </body>
</html>
