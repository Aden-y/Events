package dao;

import database.DB;
import models.Sponsor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SponsorDAO {
    public static void update(Sponsor sponsor) {
        String sql = "update sponsor set ";
        sql+="sponsorname = '"+sponsor.getSponsorname()+"',";
        sql+="email = '"+sponsor.getEmail()+"',";
        sql+="location = '"+sponsor.getLocation()+"',";
        sql+="sponsorshiprequirements = '"+sponsor.getSponsorshiprequirements()+"',";
        sql+="krapin = '"+sponsor.getKrapin()+"',";
        sql+="username = '"+sponsor.getUsername()+"',";
        sql+="password = '"+sponsor.getPassword()+"' where id = "+sponsor.getId();
        DB.executeUpdate(sql);
    }
    public static void add(Sponsor sponsor) {
        String sql = "INSERT INTO sponsor(sponsorname, email, location,sponsorshiprequirements,krapin, username, password) VALUES(";
        sql+="'"+sponsor.getSponsorname()+"',";
        sql+="'"+sponsor.getEmail()+"',";
        sql+="'"+sponsor.getLocation()+"',";
        sql+="'"+sponsor.getSponsorshiprequirements()+"',";
        sql+="'"+sponsor.getKrapin()+"',";
        sql+="'"+sponsor.getUsername()+"',";
        sql+="'"+sponsor.getPassword()+"')";
        DB.executeUpdate(sql);
    }

    public static Sponsor create(ResultSet resultSet) {
        Sponsor sponsor = null;
        try {
            if(resultSet.next()) {
                sponsor = new Sponsor(
                        resultSet.getInt("id") ,
                        resultSet.getString("sponsorname") ,
                        resultSet.getString("email") ,
                        resultSet.getString("location") ,
                        resultSet.getString("sponsorshiprequirements") ,
                        resultSet.getString("krapin") ,
                        resultSet.getString("username") ,
                        resultSet.getString("password") );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sponsor;
    }

    public  static List<Sponsor> createList(ResultSet resultSet) {
        List<Sponsor> sponsors = new ArrayList<>();
        try {
            while (resultSet.next()) {
                sponsors.add(new Sponsor(
                        resultSet.getInt("id") ,
                        resultSet.getString("sponsorname") ,
                        resultSet.getString("email") ,
                        resultSet.getString("location") ,
                        resultSet.getString("sponsorshiprequirements") ,
                        resultSet.getString("krapin") ,
                        resultSet.getString("username") ,
                        resultSet.getString("password")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sponsors;
    }

    public static Sponsor login(String username, String password) {
        String sql = "SELECT * FROM sponsor WHERE username ='"+username+"' AND password ='"+password+"'";
        return create(DB.executeQuery(sql));
    }

    public static Sponsor get(int id) {
        String sql = "select * from sponsor where id = "+id;
        return create(DB.executeQuery(sql));
    }

    public static List<Sponsor> all() {
        return createList(DB.executeQuery("select * from sponsor"));
    }
}
