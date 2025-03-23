<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Auction - Home</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #1abc9c 0%, #3498db 100%);
            min-height: 100vh;
        }
        
        .hero-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            padding: 3rem;
            animation: cardEntrance 0.8s ease-out;
        }
        
        .hero-title {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(45deg, #2c3e50, #1abc9c);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 1.5rem;
        }
        
        .cta-button {
            padding: 1rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            min-width: 180px;
            margin: 0.5rem;
        }
        
        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .feature-section {
            margin-top: 4rem;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
        }
        
        .feature-icon {
            font-size: 2.5rem;
            color: #1abc9c;
            margin-bottom: 1rem;
        }
        
        @keyframes cardEntrance {
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
    <div class="container d-flex flex-column justify-content-center align-items-center min-vh-100 py-5">
        <div class="hero-card text-center">
            <h1 class="hero-title mb-4">
                <i class="bi bi-hammer me-2"></i>Online Auction House
            </h1>
            <p class="lead text-muted mb-5">
                Discover unique items & exciting auctions. Buy, sell, and bid with confidence!
            </p>
            
            <div class="d-flex flex-column flex-md-row justify-content-center gap-3 mb-5">
                <a href="login.jsp" class="btn btn-success cta-button">
                    <i class="bi bi-box-arrow-in-right me-2"></i>Login
                </a>
                <a href="register.jsp" class="btn btn-primary cta-button">
                    <i class="bi bi-person-plus me-2"></i>Register
                </a>
            </div>

            <div class="feature-section">
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="bi bi-shield-check feature-icon"></i>
                            <h4>Secure Bidding</h4>
                            <p class="text-muted">Safe and encrypted transactions</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="bi bi-clock-history feature-icon"></i>
                            <h4>Real-time Updates</h4>
                            <p class="text-muted">Instant bid notifications</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-item">
                            <i class="bi bi-trophy feature-icon"></i>
                            <h4>Win Amazing Items</h4>
                            <p class="text-muted">Unique collectibles & rare finds</p>
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