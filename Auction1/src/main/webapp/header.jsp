<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- External CSS -->
<link rel="stylesheet" href="css/header-style.css">

<header class="custom-header shadow-sm fixed-top">
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <!-- Brand / Logo -->
            <a class="navbar-brand fw-bold" href="index.jsp">BidSphere</a>

            <!-- Toggler Button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Content -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="Schedule.jsp">Schedule</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                </ul>

                <!-- Right Section -->
                <div class="d-flex flex-column flex-lg-row align-items-stretch align-items-lg-center gap-2">
                    <form class="d-flex search-form">
                        <div class="input-group">
                            <input type="search" class="form-control" placeholder="Search...">
                            <button class="btn btn-outline-light" type="submit">
                                <i class="fas fa-search"></i> <!-- Font Awesome icon -->
                            </button>
                        </div>
                    </form>
                    <div class="d-grid">
                        <a href="Login.jsp" class="btn btn-danger">Login</a>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
