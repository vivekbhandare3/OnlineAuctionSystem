<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration Form</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- Animate.css for additional animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        html, body {
            height: 100%; /* Ensure full height for scrolling */
            margin: 0;
            padding: 0;
        }
        
        body {
            background: linear-gradient(135deg, #1abc9c 0%, #3498db 100%);
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Minimum height to fill viewport */
            padding-top: 60px; /* Adjusted for reduced header height */
            overflow-y: auto; /* Enable vertical scrolling */
        }
        
        .registration-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            padding: 2.5rem;
            margin: 2rem auto;
            max-width: 600px;
            animation: cardEntrance 0.8s ease-out forwards;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #1abc9c;
            box-shadow: 0 0 0 0.25rem rgba(26, 188, 156, 0.25);
        }
        
        .error {
            color: #dc3545;
            font-size: 0.875em;
            margin-top: 0.25rem;
            display: none;
        }
        
        .gender-group {
            border: 1px solid #dee2e6;
            padding: 0.75rem;
            border-radius: 0.375rem;
            background: #fff;
        }
        
        .btn-primary {
            background-color: #232f3e;
            border: none;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background-color: #1abc9c;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
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
    <%@ include file="header.jsp" %>

    <div class="container flex-grow-1"> <!-- Added flex-grow-1 to ensure content takes available space -->
        <div class="registration-card">
            <h2 class="text-center mb-4 animate__animated animate__fadeInDown">
                <i class="bi bi-person-plus-fill me-2"></i>Create Account
            </h2>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show animate__animated animate__slideInLeft" role="alert">
                    <%= request.getAttribute("errorMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post" name="registerForm" 
                  onsubmit="return validateForm()" class="needs-validation" novalidate>
                  
                <!-- Name Field -->
                <div class="mb-3 animate__animated animate__fadeIn" style="animation-delay: 0.2s;">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="userName" class="form-control" 
                           placeholder="Enter your full name" required>
                    <div id="nameError" class="error"></div>
                </div>

                <!-- Email Field -->
                <div class="mb-3 animate__animated animate__fadeIn" style="animation-delay: 0.4s;">
                    <label class="form-label">Email Address</label>
                    <input type="email" name="userEmail" class="form-control" 
                           placeholder="Enter your email" required>
                    <div id="emailError" class="error"></div>
                </div>

                <!-- Password Field -->
                <div class="mb-3 animate__animated animate__fadeIn" style="animation-delay: 0.6s;">
                    <label class="form-label">Password</label>
                    <input type="password" name="pass1" class="form-control" 
                           placeholder="Create password" required>
                    <div id="passwordError" class="error"></div>
                </div>

                <!-- Gender Field -->
                <div class="mb-3 animate__animated animate__fadeIn" style="animation-delay: 0.8s;">
                    <label class="form-label">Gender</label>
                    <div class="gender-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" 
                                   id="male" value="male" required>
                            <label class="form-check-label" for="male">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" 
                                   id="female" value="female">
                            <label class="form-check-label" for="female">Female</label>
                        </div>
                    </div>
                    <div id="genderError" class="error"></div>
                </div>

                <!-- City Field -->
                <div class="mb-4 animate__animated animate__fadeIn" style="animation-delay: 1s;">
                    <label class="form-label">City</label>
                    <select name="city" class="form-select" required>
                        <option value="" disabled selected>Select City</option>
                        <option>Pune</option>
                        <option>Mumbai</option>
                        <option>Bangalore</option>
                        <option>Chennai</option>
                        <option>Delhi</option>
                    </select>
                    <div id="cityError" class="error"></div>
                </div>

                <!-- Submit Button -->
                <div class="d-grid gap-2 animate__animated animate__bounceIn" style="animation-delay: 1.2s;">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-person-plus"></i> Register Now
                    </button>
                </div>
            </form>

            <div class="text-center mt-4 animate__animated animate__fadeIn" style="animation-delay: 1.4s;">
                <p class="mb-1">Already have an account? 
                    <a href="${pageContext.request.contextPath}/login" class="text-decoration-none text-primary">
                        Login here
                    </a>
                </p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-link">
                    <i class="bi bi-house-door"></i> Back to Home
                </a>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <!-- Bootstrap 5 JS with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function clearErrors() {
            document.querySelectorAll('.error').forEach(item => {
                item.textContent = '';
                item.style.display = 'none';
            });
            document.querySelectorAll('.is-invalid').forEach(item => {
                item.classList.remove('is-invalid');
            });
        }

        function seterror(id, error) {
            const element = document.getElementById(id);
            if (element) {
                element.textContent = error;
                element.style.display = 'block';
                const inputField = element.closest('.mb-3')?.querySelector('input, select');
                if (inputField) inputField.classList.add('is-invalid');
            }
        }

        function validateForm() {
            clearErrors();
            let isValid = true;
            const form = document.forms["registerForm"];

            if (form.userName.value.trim().length < 5) {
                seterror("nameError", "Name must be at least 5 characters");
                isValid = false;
            }

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(form.userEmail.value.trim())) {
                seterror("emailError", "Please enter a valid email address");
                isValid = false;
            }

            if (form.pass1.value.trim().length < 6) {
                seterror("passwordError", "Password must be at least 6 characters");
                isValid = false;
            }

            if (!document.querySelector('input[name="gender"]:checked')) {
                seterror("genderError", "Please select your gender");
                isValid = false;
            }

            if (form.city.value === "") {
                seterror("cityError", "Please select a city");
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>
</html>