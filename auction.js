import { database } from "./firebase.js";
import { ref, set, push, onValue, update, runTransaction, off } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-database.js";

// 🔹 Add Product to Auction
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
    }).catch(error => {
        alert("Error adding product: " + error.message);
    });
}

// 🔹 Load Live Auctions (Fix: Prevent Duplicates)
export function loadAuctions() {
    const auctionsDiv = document.getElementById('auctions');
    const auctionRef = ref(database, "auctions");

    // Remove previous listener to avoid duplicate entries
    off(auctionRef);

    onValue(auctionRef, (snapshot) => {
        auctionsDiv.innerHTML = ''; // Clear previous items to prevent duplicates

        snapshot.forEach(child => {
            const data = child.val();
            const currentTime = new Date().getTime();
            const auctionTime = data.auctionTime;

            if (currentTime >= auctionTime && !data.isActive) {
                update(ref(database, `auctions/${child.key}`), { isActive: true });
            }

            auctionsDiv.innerHTML += `
                <div class="product">
                    <h4>${data.productName}</h4>
                    <p>${data.description}</p>
                    <p>Current Price: ₹${data.currentPrice}</p>
                    <p>Auction Time: ${new Date(data.auctionTime).toLocaleString()}</p>
                    <button onclick="placeBid('${child.key}', ${data.currentPrice})" ${!data.isActive ? 'disabled' : ''}>Place Bid</button>
                </div>
            `;
        });
    });
}

// 🔹 Place Bid Function
export function placeBid(id, currentPrice) {
    const priceRef = ref(database, `auctions/${id}/currentPrice`);
    runTransaction(priceRef, (price) => {
        if (!price) return price;
        return price + price * 0.05; // Increase by 5%
    }).then(() => {
    }).catch(error => {
        alert("Error placing bid: " + error.message);
    });
}

// 🔹 Make functions globally accessible
window.addProduct = addProduct;
window.placeBid = placeBid;

// 🔹 Load auctions when page loads
loadAuctions();
