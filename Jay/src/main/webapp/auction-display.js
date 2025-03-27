import { database } from "./firebase.js";
import { ref, onValue, update, runTransaction, off } from "https://www.gstatic.com/firebasejs/11.4.0/firebase-database.js";

// Load and Display Live Auctions
export function loadAuctions() {
    const auctionsDiv = document.getElementById('auctions');
    const auctionRef = ref(database, "auctions");

    // Remove previous listener to avoid duplicates
    off(auctionRef);

    onValue(auctionRef, (snapshot) => {
        auctionsDiv.innerHTML = ''; // Clear previous items

        snapshot.forEach(child => {
            const data = child.val();
            const currentTime = new Date().getTime();
            const auctionTime = data.auctionTime;

            // Activate auction if time has reached
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

// Place Bid Function
export function placeBid(id, currentPrice) {
    const priceRef = ref(database, `auctions/${id}/currentPrice`);
    runTransaction(priceRef, (price) => {
        if (!price) return price;
        return price + price * 0.05; // Increase by 5%
    }).then(() => {
        // Bid placed successfully, UI updates automatically via onValue
    }).catch(error => {
        alert("Error placing bid: " + error.message);
    });
}

// Make functions globally accessible
window.placeBid = placeBid;

// Load auctions when the script runs
loadAuctions();