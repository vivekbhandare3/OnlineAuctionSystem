<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product for Auction</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { width: 50%; margin: auto; border: 1px solid #ccc; padding: 20px; border-radius: 10px; }
        label { font-weight: bold; display: block; margin-top: 10px; }
        input, textarea { width: 100%; padding: 8px; margin-top: 5px; }
        button { margin-top: 15px; padding: 10px; background: green; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <h2 align="center">Sell Your Product in Auction</h2>
    <form action="AddProductServlet" method="post">
        <label>Seller Name:</label>
        <input type="text" name="sellerName" required>

        <label>Email:</label>
        <input type="email" name="sellerEmail" required>

        <label>Phone Number:</label>
        <input type="text" name="sellerPhone" required>

        <label>Product Name:</label>
        <input type="text" name="productName" required>

        <label>Starting Price (in $):</label>
        <input type="number" name="startingPrice" required>
        
        <label>Auction Start Time:</label>
        <input type="time" name="startingTime" required>
        
        <label>Auction End Time:</label>
        <input type="time" name="endingTime" required>

        <label>Product Description:</label>
        <textarea name="productDescription" rows="4" required></textarea>

        <button type="submit">Submit Product</button>
    </form>
</body>
</html>
