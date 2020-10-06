package dao;

import database.DB;
import models.Host;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HostDAO {
    public static Host create(ResultSet resultSet) {
        Host host = null;
        try {
            if (resultSet.next()){
                host = new Host(resultSet.getInt("id"),
                 resultSet.getString("hostname"),
                        resultSet.getString("krapin"),
                        resultSet.getString("hostemail"),
                        resultSet.getString("phonenumber"),
                        resultSet.getString("username"),
                        resultSet.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return host;
    }

    public static List<Host> createList(ResultSet resultSet) {
        List<Host> hosts = new ArrayList<>();
        try {
            while (resultSet.next()) {
                hosts.add(new Host(resultSet.getInt("id"),
                        resultSet.getString("hostname"),
                        resultSet.getString("krapin"),
                        resultSet.getString("hostemail"),
                        resultSet.getString("phonenumber"),
                        resultSet.getString("username"),
                        resultSet.getString("password")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hosts;
    }

    public static void add(Host host) {
        String  sql = "INSERT INTO host (hostname, krapin, hostemail, phonenumber, username, password) VALUES (";
        sql+="'"+host.getHostname()+"',";
        sql+="'"+host.getKrapin()+"',";
        sql+="'"+host.getHostemail()+"',";
        sql+="'"+host.getPhonenumber()+"',";
        sql+="'"+host.getUsername()+"',";
        sql+="'"+host.getPassword()+"')";
        DB.executeUpdate(sql);
    }

    public static void update(Host host) {
        String sql ="update host set ";
        sql+="hostname = '"+host.getHostname()+"',";
        sql+="krapin = '"+host.getKrapin()+"',";
        sql+="hostemail = '"+host.getHostemail()+"',";
        sql+="phonenumber = '"+host.getPhonenumber()+"',";
        sql+="username = '"+host.getUsername()+"',";
        sql+="password = '"+host.getPassword()+"' where id = "+host.getId();
        DB.executeUpdate(sql);
    }

    public static Host login(String username, String password) {
        String sql = "SELECT * FROM host WHERE username ='"+username+"' AND password ='"+password+"'";
        return create(DB.executeQuery(sql));
    }

    public static Host get(int id) {
        return create(DB.executeQuery("select * from host where id="+id));
    }


}
