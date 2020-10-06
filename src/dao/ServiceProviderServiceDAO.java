package dao;

import database.DB;
import models.ServiceProvider;
import models.ServiceProviderService;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceProviderServiceDAO {
    public static ServiceProviderService  create(ResultSet resultSet) {
        try {
            if (resultSet.next()) {
                return  new ServiceProviderService(
                        resultSet.getInt("id"),
                        resultSet.getInt("serviceProviderId"),
                        resultSet.getDouble("price"),
                        resultSet.getString("serviceName"),
                        resultSet.getString("description")
                );
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<ServiceProviderService> createList(ResultSet resultSet) {
        List<ServiceProviderService> services = new ArrayList<>();
        try {
            while (resultSet.next()) {
                services.add(new ServiceProviderService(
                        resultSet.getInt("id"),
                        resultSet.getInt("serviceProviderId"),
                        resultSet.getDouble("price"),
                        resultSet.getString("serviceName"),
                        resultSet.getString("description")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  services;
    }

    public static void add(ServiceProviderService service ) {
        String sql = "insert into serviceproviderservice(serviceProviderId,price,serviceName,description) values(";
        sql+=service.getServiceProviderId()+",";
        sql+=service.getPrice()+",";
        sql+="'"+service.getServiceName()+"',";
        sql+="'"+service.getDescription()+"')";
        DB.executeUpdate(sql);
    }

    public static void update(ServiceProviderService service ) {
        String sql = "update serviceproviderservice set ";
        sql+="serviceProviderId = "+service.getServiceProviderId()+",";
        sql+="price = "+service.getPrice()+",";
        sql+="serviceName = '"+service.getServiceName()+"',";
        sql+="description = '"+service.getDescription()+"' where id = "+service.getId();
        DB.executeUpdate(sql);
    }

    public static List<ServiceProviderService> findByProvider(ServiceProvider provider) {
        return createList(DB.executeQuery("select * from serviceproviderservice where serviceProviderId = "+provider.getId()));
    }

    public static ServiceProviderService get(int id) {
        return create(DB.executeQuery("select * from serviceproviderservice where id = "+id));
    }

    public static void delete(int id) {
        DB.executeUpdate("delete from serviceproviderservice where id = "+id);
    }

    public static List<ServiceProviderService> all() {
        return createList(DB.executeQuery("select * from serviceproviderservice"));
    }
}
