package cn.techtutorial.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat; 
import java.util.Date;

import cn.techtutorial.connection.DbCon; // DbCon class එකට path එක නිවැරදිව දෙන්න
import cn.techtutorial.dao.OrderDao; // OrderDao class එකට path එක නිවැරදිව දෙන්න


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.techtutorial.model.Order;
import cn.techtutorial.model.user;

@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date = new Date(); 
			String orderDate = formatter.format(date); 
			
			user auth = (user) request.getSession().getAttribute("auth");
			if(auth != null) {
				String produId = request.getParameter("id");
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				if(productQuantity <=0 ) {
					productQuantity = 1;
				}
				
				Order orderModel = new Order();
				orderModel.setId(Integer.parseInt(produId)); // product ID එක set කරයි
				orderModel.setUid(auth.getId()); // User ID එක set කරයි
				orderModel.setQuantity(productQuantity); // Quantity එක set කරයි
				orderModel.setDate(orderDate); // Format කරන ලද date string එක set කරයි
				
				// **** මෙහිදී database එකට order එක save කිරීමේ logic එක ඇතුලත් වේ ****
				try {
				    // DbCon සහ OrderDao classs වල නිවැරදි package path එක අනුව import කරගන්න
				    OrderDao orderDao = new OrderDao(DbCon.getConnection()); 
				    boolean result = orderDao.insertOrder(orderModel); // Order එක database එකට save කරයි
				    
				    if (result) {
				        response.sendRedirect("orders.jsp"); // Order එක සාර්ථකව save නම්, orders.jsp වෙත යොමු කරන්න
				    } else {
				        out.println("Order failed to be placed. Please try again."); // අසාර්ථක නම් පණිවිඩයක් දෙන්න
				    }
				} catch (ClassNotFoundException e) {
				    // Database connection හෝ SQL query දෝෂ හසුරුවයි
				    e.printStackTrace();
				    out.println("Database error: " + e.getMessage()); // Console වලට print කරනවා වෙනුවට browser එකේ පෙන්වීමට
				    response.sendRedirect("error.jsp"); // හෝ වෙනත් දෝෂ පිටුවකට යොමු කරන්න
				}
				
			} else {
				// පරිශීලකයා ලොග් වී නොමැති නම්, registation.jsp වෙත යොමු කරයි
				response.sendRedirect("registation.jsp");
			}
		} catch (NumberFormatException e) {
            // quantity integer එකක් නොවේ නම්
            e.printStackTrace();
            response.sendRedirect("error.jsp"); 
        } catch (Exception e) {
            // වෙනත් ඕනෑම exception එකක් හසුරුවයි
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}