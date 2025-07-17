package cn.techtutorial.servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import cn.techtutorial.model.Cart;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();

        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

        if (cart_list != null) {
            cart_list.removeIf(c -> c.getId() == id);
        }

        response.sendRedirect("cart.jsp");
    }
}
