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

@WebServlet(name = "AuthController", urlPatterns = {"/AuthController"})
public class AuthController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        if(role == null) {
            request.setAttribute("err", "Please choose role.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password");
        if(role.equals("Customer")) {
            Customer customer = CustomerDAO.login(username, password);
            if (customer == null) {
                request.setAttribute("err", "Incorrect username or password. Or check the role and try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                request.getSession().setAttribute("user", customer);
                request.getSession().setAttribute("role", "customer");
                response.sendRedirect("customer.jsp");
            }
        }else if (role.equals("Service Provider")) {
            ServiceProvider serviceProvider = ServiceProviderDAO.login(username, password);
            if (serviceProvider == null) {
                request.setAttribute("err", "Incorrect username or password. Or check the role and try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                request.getSession().setAttribute("user", serviceProvider);
                request.getSession().setAttribute("role", "sp");
                response.sendRedirect("sp.jsp");
            }
        }else if(role.equals("Sponsor")) {
            Sponsor sponsor = SponsorDAO.login(username, password);
            if (sponsor == null) {
                request.setAttribute("err", "Incorrect username or password. Or check the role and try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                request.getSession().setAttribute("user", sponsor);
                request.getSession().setAttribute("role", "sponsor");
                response.sendRedirect("sponsor.jsp");
            }
        }else if(role.equals("Host")) {
            Host host = HostDAO.login(username, password);
            if (host == null) {
                request.setAttribute("err", "Incorrect username or password. Or check the role and try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                request.getSession().setAttribute("user", host);
                request.getSession().setAttribute("role", "host");
                response.sendRedirect("host.jsp");
            }
        }else{
            request.setAttribute("err", "Unknown role");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect("login.jsp");
    }
}
