package com.auction.controller;

import com.auction.model.Product;
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
import java.sql.Date;
import java.sql.Time;

@WebServlet("/addProduct")
public class ProductController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/addProduct.jsp");
        rd.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sellerName = req.getParameter("sellerName");
        String sellerEmail = req.getParameter("sellerEmail");
        String sellerPhone = req.getParameter("sellerPhone");
        String productName = req.getParameter("productName");
        double startingPrice = Double.parseDouble(req.getParameter("startingPrice"));
        Date auctionDate = Date.valueOf(req.getParameter("auctionDate"));
        Time startingTime = Time.valueOf(req.getParameter("startingTime") + ":00");
        Time endingTime = Time.valueOf(req.getParameter("endingTime") + ":00");
        String productDescription = req.getParameter("productDescription");
        String productImage = "placeholder.jpg"; // Handle file upload separately if needed

        Product product = new Product(sellerName, sellerEmail, sellerPhone, productName, startingPrice,
                auctionDate, startingTime, endingTime, productDescription, productImage);

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO products(seller_name, seller_email, seller_phone, product_name, starting_price, auction_date, starting_time, ending_time, product_description, product_image) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, product.getSellerName());
            ps.setString(2, product.getSellerEmail());
            ps.setString(3, product.getSellerPhone());
            ps.setString(4, product.getProductName());
            ps.setDouble(5, product.getStartingPrice());
            ps.setDate(6, product.getAuctionDate());
            ps.setTime(7, product.getStartingTime());
            ps.setTime(8, product.getEndingTime());
            ps.setString(9, product.getProductDescription());
            ps.setString(10, product.getProductImage());

            int count = ps.executeUpdate();
            if (count > 0) {
                req.setAttribute("successMessage", "Product added successfully!");
                RequestDispatcher rd = req.getRequestDispatcher("/profile.jsp");
                rd.forward(req, resp);
            } else {
                req.setAttribute("errorMessage", "Failed to add product.");
                RequestDispatcher rd = req.getRequestDispatcher("/addProduct.jsp");
                rd.forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Exception Occurred: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("/addProduct.jsp");
            rd.forward(req, resp);
        }
    }
}