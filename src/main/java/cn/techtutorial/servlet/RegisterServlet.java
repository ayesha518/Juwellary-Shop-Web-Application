package cn.techtutorial.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import cn.techtutorial.connection.DbCon;

@WebServlet("/user-register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("register-name");
        String address = request.getParameter("register-address");
        String email = request.getParameter("register-email");
        String password = request.getParameter("register-password");
        String confirmPassword = request.getParameter("confirm-password");
        String mobile = request.getParameter("register-mobile");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("registation.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DbCon.getConnection()) {
            String sql = "INSERT INTO register (fullname, address, email, password, mobile) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, address);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, mobile);

            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Registration failed.");
                request.getRequestDispatcher("registation.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());
            request.getRequestDispatcher("registation.jsp").forward(request, response);
        }
    }
}
