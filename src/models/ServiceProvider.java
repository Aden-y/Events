package models;

public class ServiceProvider {
    private  int id;
    private String companyname,
                email,
                phonenumber,
                description,
                location,
                username,
                password;


    public ServiceProvider( int id,
                            String companyname,
                           String email,
                           String phonenumber,
                           String description,
                           String location,
                           String username,
                           String password) {
        this.id = id;
        this.companyname = companyname;
        this.email = email;
        this.phonenumber = phonenumber;
        this.description = description;
        this.location = location;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
