import { auth } from "./firebase.js";
import { signOut, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-auth.js";
onAuthStateChanged(auth,(user)=>{
    if(!user){
        location.replace("index.html")
    }else{
        document.getElementById("user").innerHTML="Hello "+user.email;
    }
})

function logout(){
    signOut(auth);
}

window.logout=logout;