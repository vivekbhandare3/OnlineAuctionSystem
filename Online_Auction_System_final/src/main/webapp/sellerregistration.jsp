<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Registration</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Seller Registration</h2>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p class="text-danger text-center"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
        <% if (request.getAttribute("successMessage") != null) { %>
            <p class="text-success text-center"><%= request.getAttribute("successMessage") %></p>
        <% } %>
        <form action="${pageContext.request.contextPath}/seller-register" method="post" class="login-form">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Phone:</label>
                <input type="text" id="phone" name="phone" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address:</label>
                <textarea id="address" name="address" class="form-control" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
        <div class="nav-links mt-3 text-center">
            <a href="${pageContext.request.contextPath}/sellerlogin.jsp">Already a Seller? Login</a> |
            <a href="${pageContext.request.contextPath}/">Home</a>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>