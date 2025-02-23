<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/header-style.css">

<header>
    <div class="container">
        <a href="index.jsp" class="logo">BidSphere</a>

        <nav class="navbar">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="Schedule.jsp">Schedule</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </nav>

        <div class="header-right">
            <form action="search.jsp" class="search-bar">
                <input type="text" placeholder="Search..." name="query">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>

            <a href="Login.jsp" class="btn">Login</a>
        </div>
    </div>
</header>
