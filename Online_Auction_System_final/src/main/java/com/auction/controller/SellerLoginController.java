package com.auction.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.auction.util.DBConnection;

@WebServlet("/seller-login")
public class SellerLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT * FROM sellers WHERE email = ? AND password = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                statement.setString(2, password);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    // Seller found, create session
                    HttpSession session = request.getSession();
                    session.setAttribute("sellerEmail", email);
                    session.setAttribute("sellerName", resultSet.getString("name"));
                    request.setAttribute("successMessage", "Login successful! Welcome, " + resultSet.getString("name"));
                    // Redirect to a seller dashboard
                    response.sendRedirect(request.getContextPath() + "/seller-dashboard.jsp");
                } else {
                    // Invalid credentials
                    request.setAttribute("errorMessage", "Invalid email or password.");
                    request.getRequestDispatcher("/sellerlogin.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/sellerlogin.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to login page if accessed via GET
        request.getRequestDispatcher("/sellerlogin.jsp").forward(request, response);
    }
}