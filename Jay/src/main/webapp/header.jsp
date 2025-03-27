<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String sessionName = (String) session.getAttribute("session_name"); // Get session name
%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

<!-- Animate.css for animations -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

<!-- External CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">

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
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </form>

                    <% if (sessionName == null) { %>
                        <!-- Show login dropdown if user is not logged in -->
                        <div class="dropdown login-dropdown">
                            <button class="btn dropdown-toggle" type="button" id="loginDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                Login
                            </button>
                            <ul class="dropdown-menu animate__animated animate__fadeIn" aria-labelledby="loginDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login.jsp"><i class="bi bi-person-circle"></i> User Login</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/sellerlogin.jsp"><i class="bi bi-shop"></i> Seller Login</a></li>
                            </ul>
                        </div>
                    <% } else { %>
                        <!-- Show profile and logout if user is logged in -->
                        <div class="dropdown login-dropdown">
                            <button class="btn dropdown-toggle" type="button" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user"></i> <%= sessionName %>
                            </button>
                            <ul class="dropdown-menu animate__animated animate__fadeIn" aria-labelledby="profileDropdown">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile.jsp"><i class="bi bi-person"></i> Profile</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                            </ul>
                        </div>
                    <% } %>
                </div>
            </div>
        </nav>
    </div>
</header>

<!-- Bootstrap JS (Moved to bottom and ensured correct path) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<!-- Fallback JavaScript to ensure dropdown works -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var dropdowns = document.querySelectorAll(".dropdown-toggle");
        dropdowns.forEach(function (dropdown) {
            dropdown.addEventListener("click", function (event) {
                event.stopPropagation();
                var bsDropdown = new bootstrap.Dropdown(dropdown);
                bsDropdown.toggle();
            });
        });
    });
</script>
