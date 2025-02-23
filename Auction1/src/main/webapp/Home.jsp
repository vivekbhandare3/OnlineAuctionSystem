<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="css/Home.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="product-card">
                    <img src="demo.png" alt="Product Image">
                    <h3>Product Name</h3>
                    <p class="time">Bidding starts at 12:50 AM</p>
                    <p class="description">Description</p>
                    <button class="buy-btn">Interested</button>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="product-card">
                    <img src="demo.png" alt="Product Image">
                    <h3>Product Name</h3>
                    <p class="time">Bidding starts at 10:00 AM</p>
                    <p class="description">Description</p>
                    <button class="buy-btn">Interested</button>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="product-card">
                    <img src="demo.png" alt="Product Image">
                    <h3>Product Name</h3>
                    <p class="time">Bidding starts at 10:00 AM</p>
                    <p class="description">Description</p>
                    <button class="buy-btn">Interested</button>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="product-card">
                    <img src="demo.png" alt="Product Image">
                    <h3>Product Name</h3>
                    <p class="time">Bidding starts at 10:00 AM</p>
                    <p class="description">Description</p>
                    <button class="buy-btn">Interested</button>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
