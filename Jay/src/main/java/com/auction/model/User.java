package com.auction.model;

public class User {
    private String name;
    private String email;
    private String password;
    private String gender;
    private String city;

    public User() {}
    public User(String name, String email, String password, String gender, String city) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.city = city;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
}