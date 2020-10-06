package models;

import dao.ServiceProviderDAO;

public class ServiceProviderService {
    private int id, serviceProviderId;
    private double price;
    private String serviceName, description;

    public ServiceProviderService(int id, int serviceProviderId, double price, String serviceName, String description) {
        this.id = id;
        this.serviceProviderId = serviceProviderId;
        this.price = price;
        this.serviceName = serviceName;
        this.description = description;
    }

    public ServiceProviderService(int serviceProviderId, double price, String serviceName, String description) {
        this.serviceProviderId = serviceProviderId;
        this.price = price;
        this.serviceName = serviceName;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getServiceProviderId() {
        return serviceProviderId;
    }

    public void setServiceProviderId(int serviceProviderId) {
        this.serviceProviderId = serviceProviderId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ServiceProvider getProvider() {
        return ServiceProviderDAO.get(serviceProviderId);
    }
}

