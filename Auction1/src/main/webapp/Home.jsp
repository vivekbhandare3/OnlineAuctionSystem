<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="css/Home.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="product-container">
        <div class="product-card">
            <img src="demo.png" alt="Product Image">
            <h3>Product Name</h3>
            <p class="time">Bidding starts at 12:50 AM</p>
            <p class="description">Description</p>
            <button class="buy-btn">Interested</button>
        </div>

        <div class="product-card">
            <img src="demo.png" alt="Product Image">
            <h3>Product Name</h3>
            <p class="time">Bidding starts at 10:00 AM</p>
            <p class="description">Description</p>
            <button class="buy-btn">Interested</button>
        </div>

        <div class="product-card">
            <img src="demo.png" alt="Product Image">
            <h3>Product Name</h3>
            <p class="time">Bidding starts at 10:00 AM</p>
            <p class="description">Description</p>
            <button class="buy-btn">Interested</button>
        </div>

        <div class="product-card">
            <img src="demo.png" alt="Product Image">
            <h3>Product Name</h3>
            <p class="time">Bidding starts at 10:00 AM</p>
            <p class="description">Description</p>
            <button class="buy-btn">Interested</button>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
