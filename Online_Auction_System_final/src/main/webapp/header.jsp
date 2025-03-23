<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- External CSS -->
<link rel="stylesheet" href="resources/css/header.css">

<header class="custom-header shadow-sm fixed-top">
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <!-- Brand / Logo -->
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">BidSphere</a>

            <!-- Toggler Button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Content -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about-us.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/schedule.jsp">Schedule</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
                </ul>

                <!-- Right Section -->
                <div class="d-flex flex-column flex-lg-row align-items-stretch align-items-lg-center gap-2">
                    <form class="d-flex search-form">
                        <div class="input-group">
                            <input type="search" class="form-control search-input" placeholder="Search..." aria-label="Search">
                            <button class="btn btn-search" type="submit">
                                <i class="fas fa-search"></i> <!-- Font Awesome icon -->
                            </button>
                        </div>
                    </form>

                    <!-- Login Dropdown (Hover) -->
                    <div class="dropdown login-dropdown">
                        <button class="btn btn-danger dropdown-toggle" type="button" id="loginDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            Login
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="loginDropdown">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">User Login</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/sellerlogin.jsp">Seller Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>