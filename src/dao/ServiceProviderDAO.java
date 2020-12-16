package dao;

import database.DB;
import models.ServiceProvider;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceProviderDAO {
    public static ServiceProvider create(ResultSet resultSet) {
        ServiceProvider serviceProvider = null;
        try {
            if (resultSet.next()) {
                serviceProvider = new ServiceProvider(
                resultSet.getInt("id") ,
                resultSet.getString("companyname") ,
                resultSet.getString("email") ,
                resultSet.getString("phonenumber") ,
                resultSet.getString("description") ,
                resultSet.getString("location") ,
                resultSet.getString("username") ,
                resultSet.getString("password") );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceProvider;
    }

    public static List<ServiceProvider> createList(ResultSet resultSet) {
        List<ServiceProvider> serviceProviders = new ArrayList<>();
        try {
            while (resultSet.next()) {
                serviceProviders.add(new ServiceProvider(
                        resultSet.getInt("id") ,
                        resultSet.getString("companyname") ,
                        resultSet.getString("email") ,
                        resultSet.getString("phonenumber") ,
                        resultSet.getString("description") ,
                        resultSet.getString("location") ,
                        resultSet.getString("username") ,
                        resultSet.getString("password") ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceProviders;
    }

    public static void update(ServiceProvider serviceProvider) {
        String sql = "update serviceprovider set ";
        sql+="companyname = '"+serviceProvider.getCompanyname()+"',";
        sql+="email = '"+serviceProvider.getEmail()+"',";
        sql+="description = '"+serviceProvider.getDescription()+"',";
        sql+="location = '"+serviceProvider.getLocation()+"',";
        sql+="username = '"+serviceProvider.getUsername()+"',";
        sql+="password = '"+serviceProvider.getPassword()+"' where id = "+serviceProvider.getId();
        DB.executeUpdate(sql);
    }

    public static void add(ServiceProvider serviceProvider) {
        String sql = "INSERT INTO serviceprovider (companyname, phonenumber, email, description, location,username, password) VALUES(";
        sql+="'"+serviceProvider.getCompanyname()+"',";
        sql+="'"+serviceProvider.getPhonenumber()+"',";
        sql+="'"+serviceProvider.getEmail()+"',";
        sql+="'"+serviceProvider.getDescription()+"',";
        sql+="'"+serviceProvider.getLocation()+"',";
        sql+="'"+serviceProvider.getUsername()+"',";
        sql+="'"+serviceProvider.getPassword()+"')";
        DB.executeUpdate(sql);
    }

    public static ServiceProvider login(String username, String password) {
        String sql = "SELECT * FROM serviceprovider WHERE username ='"+username+"' AND password ='"+password+"'";
        return create(DB.executeQuery(sql));
    }

    public static ServiceProvider get(int id) {
        return create(DB.executeQuery("select * from serviceprovider where id = "+id));
    }

    public static  List<ServiceProvider> all() {
        return createList(DB.executeQuery("select * from serviceprovider"));
    }
}
