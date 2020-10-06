package controller;

import dao.ServiceProviderDAO;
import models.ServiceProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServiceProviderController", urlPatterns = {"/ServiceProviderController"})
public class ServiceProviderController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action  = request.getParameter("action");
        if (action.trim().equals("Register")) {
            String companyname = request.getParameter("companyname").trim(),
                    //krapin = request.getParameter("krapin"),
                    phonenumber = request.getParameter("phonenumber"),
                    description = request.getParameter("description"),
                    email = request.getParameter("email"),
                    location = request.getParameter("location"),
                    username = request.getParameter("username"),
                    password = request.getParameter("password");

            ServiceProviderDAO.add(
                    new ServiceProvider(0, companyname, email,
                            phonenumber, description,
                            location, username, password));
            response.sendRedirect("login.jsp?role=SP");

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
