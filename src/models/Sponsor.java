package models;

public class Sponsor {

    private int id;
    private String sponsorname,
            email,
            location,
            sponsorshiprequirements,
            krapin,
            username,
            password;

    public Sponsor(int id,
                   String sponsorname,
                   String email,
                   String location,
                   String sponsorshiprequirements,
                   String krapin,
                   String username,
                   String password) {
        this.id = id;
        this.sponsorname = sponsorname;
        this.email = email;
        this.location = location;
        this.sponsorshiprequirements = sponsorshiprequirements;
        this.krapin = krapin;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSponsorname() {
        return sponsorname;
    }

    public void setSponsorname(String sponsorname) {
        this.sponsorname = sponsorname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSponsorshiprequirements() {
        return sponsorshiprequirements;
    }

    public void setSponsorshiprequirements(String sponsorshiprequirements) {
        this.sponsorshiprequirements = sponsorshiprequirements;
    }

    public String getKrapin() {
        return krapin;
    }

    public void setKrapin(String krapin) {
        this.krapin = krapin;
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
