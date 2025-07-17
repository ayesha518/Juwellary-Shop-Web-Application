package cn.techtutorial.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.techtutorial.model.Cart;

/**
 * Servlet implementation class QuantityIncreaseServlet
 */


@WebServlet("/quantity-increase")
public class QuantityIncreaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

        if (cart_list != null) {
            for (Cart c : cart_list) {
                if (c.getId() == id) {
                    c.setQuantity(c.getQuantity() + 1);
                    break;
                }
            }
        }

        response.sendRedirect("cart.jsp");
    }
}
