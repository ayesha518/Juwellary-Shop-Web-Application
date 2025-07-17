package cn.techtutorial.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import cn.techtutorial.model.Cart;

@WebServlet("/quantity-decrease")
public class QuantityDecreaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();

        ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cart-list");

        if (cartList != null) {
            for (Cart c : cartList) {
                if (c.getId() == id && c.getQuantity() > 1) {
                    c.setQuantity(c.getQuantity() - 1);
                    break;
                }
            }
        }

        response.sendRedirect("cart.jsp");
    }
}
