<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"> 
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="input-box">
                <label for="email">Email</label>
                <input type="text" name="email" placeholder="Enter Your Email" required>
            </div>
            <div class="input-box">
                <label for="password">Password</label>
                <input type="password" name="password" placeholder="Enter Your Password" required>
            </div>
            <button type="submit" class="submit-btn">Login</button>
            <p>Don't have an account? <a href="Register.jsp">Register</a></p>
        </form>
    </div>
</body>
</html>
