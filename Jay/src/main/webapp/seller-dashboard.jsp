<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seller Dashboard - Online Auction System</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #1abc9c;
            --hover-color: #16a085;
        }

        body {
            background-color: #f8f9fa;
            min-height: 100vh;
        }

        .dashboard-header {
            background: linear-gradient(135deg, var(--primary-color), #34495e);
            color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .stat-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 10px;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .nav-link-custom {
            color: rgba(255, 255, 255, 0.8);
            transition: all 0.3s ease;
        }

        .nav-link-custom:hover {
            color: white;
            transform: translateX(5px);
        }

        .btn-custom {
            background-color: var(--secondary-color);
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background-color: var(--hover-color);
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
    <div class="container py-5">
        <!-- Dashboard Header -->
        <header class="dashboard-header p-4 mb-4">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h1 class="display-5 fw-bold">Seller Dashboard</h1>
                    <p class="lead mb-0">Welcome back, <strong>${sessionScope.sellerName}</strong></p>
                </div>
                <div>
                    <a href="logout.jsp" class="btn btn-light btn-sm">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </div>
            </div>
        </header>

        <!-- Quick Actions Section -->
        <div class="row mb-4">
            <div class="col-12">
                <a href="add-product.html" class="btn btn-custom">
                    <i class="bi bi-plus-circle"></i> Add New Product
                </a>
            </div>
        </div>

        <!-- Dashboard Content -->
        <div class="row g-4">
            <!-- Statistics Card -->
            <div class="col-md-6 col-lg-3">
                <div class="card stat-card bg-primary text-white">
                    <div class="card-body">
                        <h5 class="card-title">Active Listings</h5>
                        <h2 class="card-text">15</h2>
                        <small>+2 from last week</small>
                    </div>
                </div>
            </div>

            <!-- Recent Products Card -->
            <div class="col-md-6 col-lg-4">
                <div class="card stat-card">
                    <div class="card-body">
                        <h5 class="card-title">Recent Products</h5>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Vintage Camera
                                <span class="badge bg-warning">Draft</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Antique Chair
                                <span class="badge bg-success">Active</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Quick Links Card -->
            <div class="col-md-6 col-lg-3">
                <div class="card stat-card">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Quick Actions</h5>
                        <div class="d-grid gap-2">
                            <a href="#" class="btn btn-outline-secondary text-start">
                                <i class="bi bi-pencil"></i> Edit Profile
                            </a>
                            <a href="#" class="btn btn-outline-secondary text-start">
                                <i class="bi bi-graph-up"></i> View Analytics
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS + Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</body>
</html>