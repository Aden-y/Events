package models;

public class Host {
    private int id;
    private String hostname,
            krapin, hostemail,
            phonenumber, username,
            password;

    public Host(int id, String hostname, String krapin, String hostemail, String phonenumber, String username, String password) {
        this.id = id;
        this.hostname = hostname;
        this.krapin = krapin;
        this.hostemail = hostemail;
        this.phonenumber = phonenumber;
        this.username = username;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String getKrapin() {
        return krapin;
    }

    public void setKrapin(String krapin) {
        this.krapin = krapin;
    }

    public String getHostemail() {
        return hostemail;
    }

    public void setHostemail(String hostemail) {
        this.hostemail = hostemail;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
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
