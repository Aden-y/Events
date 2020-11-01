package models;

import dao.CustomerDAO;
import dao.HostDAO;
import dao.ServiceProviderDAO;
import dao.SponsorDAO;

import java.util.List;

public class Users{
    public List<Customer> customers ;
    public List<ServiceProvider> providers ;
    public List<Host> hosts ;
    public List<Sponsor> sponsors ;
    public Users() {
        customers = CustomerDAO.all();
        providers = ServiceProviderDAO.all();
        hosts = HostDAO.all();
        sponsors = SponsorDAO.all();

    }
}
