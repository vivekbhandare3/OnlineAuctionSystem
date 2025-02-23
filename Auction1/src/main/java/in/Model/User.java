package in.Model;

public class User {
    private String name, email, password, birth, address, mobile;
    
    public User(String name, String email, String password, String birth, String address, String mobile) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.birth = birth;
        this.address = address;
        this.mobile = mobile;
    }
    
    // Getters
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getBirth() { return birth; }
    public String getAddress() { return address; }
    public String getMobile() { return mobile; }
}
