package cn.techtutorial.servlet;
import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import cn.techtutorial.connection.DbCon;
 
import cn.techtutorial.model.user;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DbCon.getConnection()) {
            String sql = "SELECT * FROM register WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Login success
                user loggedInUser = new user(); // <-- User object එකක් හදනවා
                loggedInUser.setName(rs.getString("fullname"));
                loggedInUser.setEmail(rs.getString("email")); // email එකත් අවශ්‍ය නම්

                HttpSession session = request.getSession();
                
                session.setAttribute("loginSuccess", "true"); // Login successful alert එක සඳහා
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Server error: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}