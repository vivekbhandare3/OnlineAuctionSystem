package com.auction.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.auction.util.DBConnection;

@WebServlet("/seller-register")
public class SellerRegistrationController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("SellerRegistrationController: doPost invoked");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try (Connection connection = DBConnection.getConnection()) {
            System.out.println("SellerRegistrationController: Database connection established");
            String sql = "INSERT INTO sellers (name, email, password, phone, address) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setString(3, password);
                statement.setString(4, phone);
                statement.setString(5, address);

                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    request.setAttribute("successMessage", "Registration successful! Please login.");
                    request.getRequestDispatcher("/sellerlogin.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Registration failed. Please try again.");
                    request.getRequestDispatcher("/sellerregistration.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            if (e.getMessage().contains("Duplicate entry")) {
                request.setAttribute("errorMessage", "Email already exists. Please use a different email.");
            } else {
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            }
            request.getRequestDispatcher("/sellerregistration.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("SellerRegistrationController: doGet invoked");
        request.getRequestDispatcher("/sellerregistration.jsp").forward(request, response);
    }
}