package cn.techtutorial.model;

public class user { // <-- Class name 'User' (Capital U)
    private int id; // Added 'id' property
    private String name; // Changed from 'fullname' to 'name' to match UserDao's 'getName()'
    private String email;

    public user() {
    }

    public user(int id, String name, String email) { // Constructor with all properties
        this.id = id;
        this.name = name;
        this.email = email;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) { // Corrected setId method
        this.id = id;
    }

    public String getName() { // Changed from getFullname to getName
        return name;
    }

    public void setName(String name) { // Changed from setFullname to setName
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) { // Changed from setemail to setEmail (Capital E)
        this.email = email;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + name + ", email=" + email + "]";
    }
}