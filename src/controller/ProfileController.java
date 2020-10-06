package controller;

import dao.CustomerDAO;
import dao.HostDAO;
import dao.ServiceProviderDAO;
import dao.SponsorDAO;
import models.Customer;
import models.Host;
import models.ServiceProvider;
import models.Sponsor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object user = request.getSession().getAttribute("user");
        if(user instanceof Customer) {
            Customer customer = (Customer) user;
            String firstname = request.getParameter("firstname"),
                    lastname = request.getParameter("lastname"),
                    email = request.getParameter("email"),
                    username = request.getParameter("username"),
                    phonenumber = request.getParameter("phonenumber"),
                    newPassword = request.getParameter("new_password"),
                    password = request.getParameter("password");

            int nationalid = Integer.parseInt(request.getParameter("nationalid"));
            if (customer.getPassword().equals(password)) {
                customer.setFirstname(firstname);
                customer.setLastname(lastname);
                customer.setEmail(email);
                customer.setUsername(username);
                customer.setPhonenumber(phonenumber);
                customer.setNationalid(nationalid);
                if(!newPassword.trim().equals("")) {
                    customer.setPassword(newPassword);
                }
                CustomerDAO.update(customer);
                response.getWriter().println("<script>alert('Profile updated'); window.location.href='profile.jsp';</script>");
            }else {
                response.getWriter().println("<script>alert('The current password is not correct'); window.location.href='profile.jsp';</script>");
            }
        }else if (user instanceof Host) {
            Host host = (Host) user;
            String hostname = request.getParameter("hostname").trim(),
                    krapin = request.getParameter("krapin"),
                    phonenumber = request.getParameter("phonenumber"),
                    email = request.getParameter("email"),
                    newPassword = request.getParameter("new_password"),
                    username = request.getParameter("username"),
                    password = request.getParameter("password");

            if(password.equals(host.getPassword())) {
                host.setHostname(hostname);
                host.setKrapin(krapin);
                host.setPhonenumber(phonenumber);
                host.setHostemail(email);
                host.setUsername(username);
                if(!newPassword.trim().equals("")) {
                    host.setPassword(newPassword);
                }
                HostDAO.update(host);
                response.getWriter().println("<script>alert('Profile updated'); window.location.href='profile.jsp';</script>");
            }else {
                response.getWriter().println("<script>alert('The current password is not correct'); window.location.href='profile.jsp';</script>");
            }
        }else if (user instanceof ServiceProvider) {
            ServiceProvider serviceProvider = (ServiceProvider) user;
            String companyname = request.getParameter("companyname").trim(),
                    //krapin = request.getParameter("krapin"),
                    phonenumber = request.getParameter("phonenumber"),
                    description = request.getParameter("description"),
                    email = request.getParameter("email"),
                    location = request.getParameter("location"),
                    username = request.getParameter("username"),
                    newPassword = request.getParameter("new_password"),
                    password = request.getParameter("password");
            if (password.equals(serviceProvider.getPassword())) {
                serviceProvider.setCompanyname(companyname);
                serviceProvider.setPhonenumber(phonenumber);
                serviceProvider.setDescription(description);
                serviceProvider.setEmail(email);
                serviceProvider.setLocation(location);
                serviceProvider.setUsername(username);
                if (!newPassword.trim().equals("")) {
                    serviceProvider.setPassword(newPassword);
                }
                ServiceProviderDAO.update(serviceProvider);
                response.getWriter().println("<script>alert('Profile updated'); window.location.href='profile.jsp';</script>");
            }else {
                response.getWriter().println("<script>alert('The current password is not correct'); window.location.href='profile.jsp';</script>");
            }
        }else if (user instanceof Sponsor) {
            Sponsor sponsor = (Sponsor) user;
            String sponsorname = request.getParameter("sponsorname").trim(),
                    krapin = request.getParameter("krapin"),
                    requirements = request.getParameter("requirements"),
                    email = request.getParameter("email"),
                    location = request.getParameter("location"),
                    username = request.getParameter("username"),
                    newPassword = request.getParameter("new_password"),
                    password = request.getParameter("password");
            if (password.equals(sponsor.getPassword())) {
                sponsor.setSponsorname(sponsorname);
                sponsor.setKrapin(krapin);
                sponsor.setSponsorshiprequirements(requirements);
                sponsor.setEmail(email);
                sponsor.setLocation(location);
                sponsor.setUsername(username);
                if (!newPassword.trim().equals("")) {
                    sponsor.setPassword(newPassword);
                }
                SponsorDAO.update(sponsor);
                response.getWriter().println("<script>alert('Profile updated'); window.location.href='profile.jsp';</script>");
            }else {
                response.getWriter().println("<script>alert('The current password is not correct'); window.location.href='profile.jsp';</script>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("profile.jsp");
    }
}
