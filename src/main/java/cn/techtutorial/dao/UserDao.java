package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; // Import SQLException for better error handling

import cn.techtutorial.model.user; // <-- Import 'User' (Capital U)

public class UserDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }

    public user userLogin(String email, String password) {
        user user = null; // Changed 'user' to 'User'
        try {
            query = "SELECT * FROM users WHERE email = ? AND password = ?"; // Assuming table 'users'
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if (rs.next()) {
                user = new user(); // Changed 'user' to 'User'
                user.setId(rs.getInt("id"));       // Correctly sets ID
                user.setName(rs.getString("name"));   // Correctly sets Name (assuming 'name' column in DB)
                user.setEmail(rs.getString("email")); // Correctly sets Email (Capital E)
            }

        } catch (Exception e) { // Catch general Exception or more specific SQLException
            e.printStackTrace();
            System.out.println("UserDao Error: " + e.getMessage()); // Changed print to println for clarity
        } finally {
            // Always close JDBC resources in a finally block
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                // Connection 'con' should be closed in the servlet/main logic if it's passed here,
                // especially if using try-with-resources like in the LoginServlet example.
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }
}