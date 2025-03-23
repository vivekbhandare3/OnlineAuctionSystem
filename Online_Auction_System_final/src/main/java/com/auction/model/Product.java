package com.auction.model;

import java.sql.Date;
import java.sql.Time;

public class Product {
    private String sellerName;
    private String sellerEmail;
    private String sellerPhone;
    private String productName;
    private double startingPrice;
    private Date auctionDate;
    private Time startingTime;
    private Time endingTime;
    private String productDescription;
    private String productImage;

    public Product() {}
    public Product(String sellerName, String sellerEmail, String sellerPhone, String productName, double startingPrice,
                   Date auctionDate, Time startingTime, Time endingTime, String productDescription, String productImage) {
        this.sellerName = sellerName;
        this.sellerEmail = sellerEmail;
        this.sellerPhone = sellerPhone;
        this.productName = productName;
        this.startingPrice = startingPrice;
        this.auctionDate = auctionDate;
        this.startingTime = startingTime;
        this.endingTime = endingTime;
        this.productDescription = productDescription;
        this.productImage = productImage;
    }

    public String getSellerName() { return sellerName; }
    public void setSellerName(String sellerName) { this.sellerName = sellerName; }
    public String getSellerEmail() { return sellerEmail; }
    public void setSellerEmail(String sellerEmail) { this.sellerEmail = sellerEmail; }
    public String getSellerPhone() { return sellerPhone; }
    public void setSellerPhone(String sellerPhone) { this.sellerPhone = sellerPhone; }
    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }
    public double getStartingPrice() { return startingPrice; }
    public void setStartingPrice(double startingPrice) { this.startingPrice = startingPrice; }
    public Date getAuctionDate() { return auctionDate; }
    public void setAuctionDate(Date auctionDate) { this.auctionDate = auctionDate; }
    public Time getStartingTime() { return startingTime; }
    public void setStartingTime(Time startingTime) { this.startingTime = startingTime; }
    public Time getEndingTime() { return endingTime; }
    public void setEndingTime(Time endingTime) { this.endingTime = endingTime; }
    public String getProductDescription() { return productDescription; }
    public void setProductDescription(String productDescription) { this.productDescription = productDescription; }
    public String getProductImage() { return productImage; }
    public void setProductImage(String productImage) { this.productImage = productImage; }
}