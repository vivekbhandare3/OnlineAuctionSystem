import { auth, database } from "./firebase.js";
import { 
    signInWithEmailAndPassword, 
    createUserWithEmailAndPassword, 
    onAuthStateChanged 
} from "https://www.gstatic.com/firebasejs/11.4.0/firebase-auth.js";
import { ref, set } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-database.js";

// 🔹 Check Authentication State
onAuthStateChanged(auth, (user) => {
    if (user) {
        console.log("✅ User is authenticated:", user);
        window.location.href = "welcome.html"; // Redirect logged-in users
    }
});

// 🔹 Login Function
function login(event) {
    event.preventDefault(); // Prevents form reload

    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    signInWithEmailAndPassword(auth, email, password)
        .then((userCredential) => {
            console.log("✅ Login Successful:", userCredential.user);
            window.location.href = "auction.html"; // Redirect after login
        })
        .catch((error) => {
            document.getElementById("error").innerHTML = error.message;
            console.error("⛔ Login Error:", error.message);
        });
}
function signUp(){
    window.location.href="signUp.html";
}


// 🔹 Attach function to form submission
document.getElementById("loginform").addEventListener("submit", login);

// 🔹 Expose functions globally
window.signUp = signUp;
