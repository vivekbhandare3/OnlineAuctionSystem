import { database } from "./firebase.js";
import { ref, set, push } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-database.js";

// Add Product to Auction
export function addProduct() {
    const name = document.getElementById('productName').value;
    const desc = document.getElementById('productDesc').value;
    const price = document.getElementById('startingPrice').value;
    const auctionTime = document.getElementById('auctionTime').value;

    if (!name || !desc || !price || !auctionTime) {
        alert("Please fill all fields!");
        return;
    }

    const newRef = push(ref(database, "auctions"));
    set(newRef, {
        productName: name,
        description: desc,
        startingPrice: parseFloat(price),
        currentPrice: parseFloat(price),
        highestBidder: null,
        auctionTime: new Date(auctionTime).getTime(),
        isActive: false
    }).then(() => {
        alert("Product added successfully!");
        // Clear form fields
        document.getElementById('productName').value = '';
        document.getElementById('productDesc').value = '';
        document.getElementById('startingPrice').value = '';
        document.getElementById('auctionTime').value = '';
    }).catch(error => {
        alert("Error adding product: " + error.message);
    });
}

// Make function globally accessible
window.addProduct = addProduct;