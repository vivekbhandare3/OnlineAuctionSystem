<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Profile</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        
        body {
            background: linear-gradient(135deg, #1abc9c 0%, #3498db 100%);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            padding-top: 60px; /* Offset for reduced-height fixed header */
            overflow-y: auto;
        }
        
        .profile-header {
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin: 2rem 0;
            animation: fadeInDown 0.8s ease-out;
        }
        
        .nav-card {
            transition: transform 0.3s ease;
            border: none;
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            background: rgba(255, 255, 255, 0.95);
        }
        
        .nav-card:hover {
            transform: translateY(-5px);
        }
        
        .bid-table {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            animation: fadeInUp 0.8s ease-out;
        }
        
        .table thead th {
            background: #1abc9c;
            color: white;
            border-bottom: none;
        }
        
        .btn-danger {
            background: #1abc9c;
            border: none;
            transition: all 0.3s ease;
        }
        
        .btn-danger:hover {
            background: #148f77;
            transform: translateY(-2px);
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container flex-grow-1">
        <% if (session.getAttribute("session_name") == null) {
               response.sendRedirect(request.getContextPath() + "/login");
           } %>
        
        <header class="profile-header">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h1 class="display-5 fw-bold">Welcome, <%= session.getAttribute("session_name") %></h1>
                    <p class="lead text-muted">Manage your auctions and bids</p>
                </div>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
            
            <% if (request.getAttribute("successMessage") != null) { %>
                <div class="alert alert-success alert-dismissible fade show mt-3 animate__animated animate__slideInLeft" role="alert">
                    <%= request.getAttribute("successMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>
        </header>

        <nav class="navbar navbar-expand-lg navbar-light nav-card mb-4">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#profileNav" aria-controls="profileNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="profileNav">
                    <div class="navbar-nav w-100 justify-content-between">
                        <a class="nav-link btn btn-outline-primary mx-1 my-1 animate__animated animate__fadeIn" style="animation-delay: 0.2s;" href="${pageContext.request.contextPath}/about-us.jsp">
                            <i class="bi bi-info-circle"></i> About Us
                        </a>
                        <a class="nav-link btn btn-outline-info mx-1 my-1 animate__animated animate__fadeIn" style="animation-delay: 0.4s;" href="${pageContext.request.contextPath}/view-products.html">
                            <i class="bi bi-eye"></i> View Bids
                        </a>
                    </div>
                </div>
            </div>
        </nav>

        <main>
            <div class="card bid-table">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0"><i class="bi bi-currency-exchange"></i> Recent Bids</h3>
                </div>
                <!-- You can add table content here if needed -->
            </div>
        </main>
    </div>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap 5 JS with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>