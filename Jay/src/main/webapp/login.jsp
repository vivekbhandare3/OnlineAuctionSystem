<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - BidSphere Auction System</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Animate.css for additional animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            background: linear-gradient(135deg, #1abc9c 0%, #3498db 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-container {
            max-width: 450px;
            margin: auto;
            padding: 1rem;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            padding: 2.5rem;
            animation: cardEntrance 0.8s ease-out forwards;
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h2 {
            color: #232f3e;
            animation: textFade 1s ease-in-out;
        }

        .form-floating {
            position: relative;
        }

        .password-toggle-icon {
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .password-toggle-icon:hover {
            color: #1abc9c;
        }

        .btn-signin {
            background-color: #232f3e;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-signin:hover {
            background-color: #1abc9c;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .register-link {
            color: #1abc9c;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .register-link:hover {
            color: #148f77;
            text-decoration: underline;
        }

        .alert {
            animation: slideIn 0.5s ease-out;
        }

        @keyframes cardEntrance {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        @keyframes textFade {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <main class="my-5">
        <div class="login-container">
            <div class="login-card">
                <div class="login-header animate__animated animate__fadeInDown">
                    <h2><i class="fas fa-user-circle me-2"></i>Welcome Back</h2>
                    <p class="text-muted">Sign in to your BidSphere account</p>
                </div>

                <% String errorMessage = (String) session.getAttribute("errorMessage");
                   if (errorMessage != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show animate__animated animate__slideInLeft" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i><%= errorMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% session.removeAttribute("errorMessage"); } %>

                <% String successMessage = (String) session.getAttribute("successMessage");
                   if (successMessage != null) { %>
                    <div class="alert alert-success alert-dismissible fade show animate__animated animate__slideInLeft" role="alert">
                        <i class="fas fa-check-circle me-2"></i><%= successMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% session.removeAttribute("successMessage"); } %>

                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-floating mb-3 animate__animated animate__fadeIn" style="animation-delay: 0.2s;">
                        <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                        <label for="email"><i class="fas fa-envelope me-2"></i>Email address</label>
                    </div>

                    <div class="form-floating mb-4 animate__animated animate__fadeIn" style="animation-delay: 0.4s;">
                        <input type="password" class="form-control password-toggle" id="password" name="password" placeholder="Password" required>
                        <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                        <div class="password-toggle-icon position-absolute end-0 top-50 translate-middle-y me-3">
                            <i class="fas fa-eye-slash text-muted"></i>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-4 animate__animated animate__fadeIn" style="animation-delay: 0.6s;">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="remember" name="remember">
                            <label class="form-check-label" for="remember">Remember me</label>
                        </div>
                        <a href="${pageContext.request.contextPath}/forgot-password" class="btn-link">Forgot password?</a>
                    </div>

                    <button type="submit" class="btn btn-signin w-100 mb-4 animate__animated animate__bounceIn" style="animation-delay: 0.8s;">
                        <i class="fas fa-sign-in-alt me-2"></i>Sign In
                    </button>

                    <div class="text-center animate__animated animate__fadeIn" style="animation-delay: 1s;">
                        <p>Don't have an account? 
                            <a href="${pageContext.request.contextPath}/register" class="register-link">Register now</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Password visibility toggle script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const togglePassword = document.querySelector('.password-toggle-icon');
            const password = document.querySelector('#password');
            
            togglePassword.addEventListener('click', function() {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.querySelector('i').classList.toggle('fa-eye-slash');
                this.querySelector('i').classList.toggle('fa-eye');
            });
        });
    </script>
</body>
</html>