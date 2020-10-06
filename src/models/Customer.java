package models;

public class Customer {
    private int id;
    private long nationalid;
    private String firstname, lastname,
            email, phonenumber, username, password;

    public int getId() {
        return id;
    }

    public Customer(int id,
                    long nationalid,
                    String firstname,
                    String lastname,
                    String email,
                    String phonenumber,
                    String username,
                    String password) {
        this.id = id;
        this.nationalid = nationalid;
        this.firstname = firstname;
        this.lastname = lastname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.username = username;
        this.password = password;
    }

    public long getNationalid() {
        return nationalid;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public String getEmail() {
        return email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNationalid(long nationalid) {
        this.nationalid = nationalid;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
