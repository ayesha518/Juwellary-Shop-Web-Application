package cn.techtutorial.servlet;

import cn.techtutorial.connection.DbCon;
import cn.techtutorial.model.Cart;
import cn.techtutorial.model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

@WebServlet("/payment-process")
public class PaymentProcessServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1494225695824405597L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        user authUser = (user) session.getAttribute("auth");
        ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");

        if (authUser != null && cart_List != null) {
            try (Connection con = DbCon.getConnection()) {
                con.setAutoCommit(false);
                try {
                    for (Cart item : cart_List) {
                        String sql = "INSERT INTO cart (user_id, product_id, name, category, price, quantity, total) VALUES (?, ?, ?, ?, ?, ?, ?)";
                        try (PreparedStatement ps = con.prepareStatement(sql)) {
                            ps.setInt(1, authUser.getId());
                            ps.setInt(2, item.getId());
                            ps.setString(3, item.getName());
                            ps.setString(4, item.getCategory());
                            ps.setDouble(5, item.getPrice());
                            ps.setInt(6, item.getQuantity());
                            ps.setDouble(7, item.getPrice() * item.getQuantity());
                            ps.executeUpdate();
                        }
                    }
                    con.commit();

                    // Clear cart
                    session.removeAttribute("cart-list");
                    request.setAttribute("message", "Payment completed and cart saved to database.");
                    request.getRequestDispatcher("order-success.jsp").forward(request, response);

                } catch (Exception e) {
                    con.rollback();
                    throw e;
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
