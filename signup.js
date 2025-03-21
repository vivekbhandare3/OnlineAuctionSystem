import { auth, database } from "./firebase.js";
import { createUserWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-auth.js";
import { ref, set } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-database.js";

document.getElementById("signupForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent form reload

    const fullName = document.getElementById("fullName").value.trim();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const phoneNumber = document.getElementById("phoneNumber").value.trim();
    const dob = document.getElementById("dob").value;
    const gender = document.querySelector('input[name="gender"]:checked')?.value;
    const address = document.getElementById("address").value.trim();

    // Full Name Validation (Cannot be empty)
    if (fullName === "") {
        alert("Full Name is required!");
        return;
    }

    // Email Validation (Must be in correct format)
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address!");
        return;
    }

    // Phone Number Validation (Must be 10 digits)
    const phonePattern = /^[6-9]\d{9}$/; // Ensures 10-digit number starting with 6-9
    if (!phonePattern.test(phoneNumber)) {
        alert("Please enter a valid 10-digit phone number!");
        return;
    }

    // Date of Birth Validation (User must be at least 18 years old)
    const dobDate = new Date(dob);
    const today = new Date();
    const age = today.getFullYear() - dobDate.getFullYear();
    const monthDiff = today.getMonth() - dobDate.getMonth();
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dobDate.getDate())) {
        age--; // Adjust age if birthday has not occurred this year
    }
    if (age < 18) {
        alert("You must be at least 18 years old to sign up!");
        return;
    }

    // Password Matching Validation
    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return;
    }

    createUserWithEmailAndPassword(auth, email, password)
        .then((userCredential) => {
            const user = userCredential.user;

            // Store user details in Firebase Realtime Database
            return set(ref(database, 'users/' + user.uid), {
                fullName: fullName,
                email: user.email,
                phoneNumber: phoneNumber,
                dateOfBirth: dob,
                gender: gender,
                address: address
            });
        })
        .then(() => {
            alert("User Signed Up Successfully!");
            window.location.href = "auction.html"; // Redirect after signup
        })
        .catch((error) => {
            alert(error.message);
            console.error("⛔ Sign-Up Error:", error.message);
        });
});
