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
    <style>
        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .registration-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 600px;
        }
        
        .form-control:focus {
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
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="registration-card">
            <h2 class="text-center mb-4">Create Account</h2>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <%= request.getAttribute("errorMessage") %>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post" name="registerForm" 
                  onsubmit="return validateForm()" class="needs-validation" novalidate>
                  
                <!-- Name Field -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="userName" class="form-control" 
                           placeholder="Enter your full name" required>
                    <div id="nameError" class="error"></div>
                </div>

                <!-- Email Field -->
                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <input type="email" name="userEmail" class="form-control" 
                           placeholder="Enter your email" required>
                    <div id="emailError" class="error"></div>
                </div>

                <!-- Password Field -->
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="pass1" class="form-control" 
                           placeholder="Create password" required>
                    <div id="passwordError" class="error"></div>
                </div>

                <!-- Gender Field -->
                <div class="mb-3">
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
                <div class="mb-4">
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
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-person-plus"></i> Register Now
                    </button>
                </div>
            </form>

            <div class="text-center mt-4">
                <p class="mb-1">Already have an account? 
                    <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">
                        Login here
                    </a>
                </p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-link">
                    <i class="bi bi-house-door"></i> Back to Home
                </a>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Updated validation functions
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

            // Name validation
            if (form.userName.value.trim().length < 5) {
                seterror("nameError", "Name must be at least 5 characters");
                isValid = false;
            }

            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(form.userEmail.value.trim())) {
                seterror("emailError", "Please enter a valid email address");
                isValid = false;
            }

            // Password validation
            if (form.pass1.value.trim().length < 6) {
                seterror("passwordError", "Password must be at least 6 characters");
                isValid = false;
            }

            // Gender validation
            if (!document.querySelector('input[name="gender"]:checked')) {
                seterror("genderError", "Please select your gender");
                isValid = false;
            }

            // City validation
            if (form.city.value === "") {
                seterror("cityError", "Please select a city");
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>
</html>