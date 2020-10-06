package dao;

import database.DB;
import models.Customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    public static List<Customer> createList(ResultSet resultSet) {
        List<Customer> customers = new ArrayList<>();
        try {
            while (resultSet.next()) {
                customers.add( new Customer(
                        resultSet.getInt("id"),
                        resultSet.getInt("nationalid"),
                        resultSet.getString("firstname"),
                        resultSet.getString("lastname"),
                        resultSet.getString("email"),
                        resultSet.getString("phonenumber"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
    public static Customer create(ResultSet resultSet) {
        Customer customer = null;
        try {
            if (resultSet.next()) {
                customer = new Customer(
                        resultSet.getInt("id"),
                        resultSet.getInt("nationalid"),
                        resultSet.getString("firstname"),
                        resultSet.getString("lastname"),
                        resultSet.getString("email"),
                        resultSet.getString("phonenumber"),
                        resultSet.getString("username"),
                        resultSet.getString("password")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
    public static Customer get(int id) {
        String sql = "SELECT * FROM customer WHERE id="+id;
        ResultSet resultSet = DB.executeQuery(sql);
        return create(resultSet);
    }
    public static void add(Customer customer) {
        String sql = "INSERT INTO customer (firstname,lastname,nationalid,email,phonenumber,username,password) VALUES(" ;
        sql+="'"+customer.getFirstname()+"',";
        sql+="'"+customer.getLastname()+"',";
        sql+="'"+customer.getNationalid()+"',";
        sql+="'"+customer.getEmail()+"',";
        sql+="'"+customer.getPhonenumber()+"',";
        sql+="'"+customer.getUsername()+"',";
        sql+="'"+customer.getPassword()+"')";
        DB.executeUpdate(sql);
    }

    public static void update(Customer customer) {
        String sql = "update customer set ";
        sql+="firstname = '"+customer.getFirstname()+"', ";
        sql+="lastname = '"+customer.getLastname()+"', ";
        sql+="nationalid = '"+customer.getNationalid()+"', ";
        sql+="email = '"+customer.getEmail()+"', ";
        sql+="phonenumber = '"+customer.getPhonenumber()+"', ";
        sql+="username = '"+customer.getUsername()+"', ";
        sql+="password = '"+customer.getPassword()+"' where id = "+customer.getId();
        //System.out.println(sql);
        DB.executeUpdate(sql);
    }
    public static Customer login(String username, String password) {
        String sql = "SELECT * FROM customer WHERE username ='"+username+"' AND password ='"+password+"'";
        return create(DB.executeQuery(sql));
    }
}
