package com.auction.controller;

import com.auction.model.User;
import com.auction.util.DBConnection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
        rd.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("userName");
        String email = req.getParameter("userEmail");
        String password = req.getParameter("pass1");
        String gender = req.getParameter("gender");
        String city = req.getParameter("city");

        User user = new User(name, email, password, gender, city);

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement checkEmail = con.prepareStatement("SELECT email FROM registered WHERE email = ?");
            checkEmail.setString(1, email);
            ResultSet rs = checkEmail.executeQuery();

            if (rs.next()) {
                req.setAttribute("errorMessage", "Email already exists! Please use another email.");
                RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
                rd.forward(req, resp);
            } else {
                PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO registered(name, email, password, gender, city) VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, user.getName());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getPassword());
                ps.setString(4, user.getGender());
                ps.setString(5, user.getCity());

                int count = ps.executeUpdate();
                if (count > 0) {
                    req.setAttribute("successMessage", "User registered successfully!");
                    RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
                    rd.forward(req, resp);
                } else {
                    req.setAttribute("errorMessage", "User not registered due to some error.");
                    RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
                    rd.forward(req, resp);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Exception Occurred: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.forward(req, resp);
        }
    }
}