<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BidSphere - Online Auction Platform</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Animate.css for additional animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <!-- Custom CSS -->
    <!--  --><link rel="stylesheet" href="resources/css/index.css">
</head>
<body>
    <!-- Decorative floating shapes -->
    <div class="floating-shape shape1"></div>
    <div class="floating-shape shape2"></div>
    <div class="floating-shape shape3"></div>

    <div class="container main-container d-flex flex-column justify-content-center align-items-center">
        <div class="hero-card text-center">
            <!-- <h1 class="hero-title mb-4">
                <i class="bi bi-hammer me-2"></i>BidSphere Auction House
            </h1> -->
            <p class="hero-lead">
                Discover unique items & exciting auctions. Buy, sell, and bid with confidence on our trusted platform!
            </p>
            
            <div class="cta-button-container">
                <a href="login.jsp" class="btn btn-success cta-button">
                    <i class="bi bi-box-arrow-in-right"></i>Login
                </a>
                <a href="register.jsp" class="btn btn-primary cta-button">
                    <i class="bi bi-person-plus"></i>Register
                </a>
            </div>

            <div class="feature-section">
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="bi bi-shield-check feature-icon"></i>
                            <h4>Secure Bidding</h4>
                            <p>Safe and encrypted transactions for peace of mind</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="bi bi-clock-history feature-icon"></i>
                            <h4>Real-time Updates</h4>
                            <p>Instant bid notifications and auction alerts</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="bi bi-trophy feature-icon"></i>
                            <h4>Win Amazing Items</h4>
                            <p>Unique collectibles & rare finds at great prices</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <!-- Bootstrap 5 JS with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>