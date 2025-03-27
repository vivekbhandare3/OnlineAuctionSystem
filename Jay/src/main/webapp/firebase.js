import { initializeApp } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-app.js";
import { getAuth } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-auth.js";
import { getDatabase } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-database.js";

const firebaseConfig = {
    apiKey: "AIzaSyD2aGGO4VFHnBgBkODU4jhk8cLS7A9lRdA",
    authDomain: "auction-71577.firebaseapp.com",
    databaseURL: "https://auction-71577-default-rtdb.firebaseio.com",
    projectId: "auction-71577",
    storageBucket: "auction-71577.firebasestorage.app",
    messagingSenderId: "825142032729",
    appId: "1:825142032729:web:82c1a9e8cac45fd0127448",
    measurementId: "G-EL8J6M4VRW"
};

const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const database = getDatabase(app);

export { auth, database };