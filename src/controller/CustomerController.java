package controller;

import dao.CustomerDAO;
import models.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerController"})
public class CustomerController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.trim().equals("Register")) {
            String firstname = request.getParameter("firstname"),
                    lastname = request.getParameter("lastname"),
                    email = request.getParameter("email"),
                    username = request.getParameter("username"),
                    phonenumber = request.getParameter("phonenumber"),
                    password = request.getParameter("password");
            int nationalid = Integer.parseInt(request.getParameter("nationalid"));
            CustomerDAO.add(
                    new Customer(0, nationalid, firstname, lastname, email, phonenumber, username, password)
            );
            response.sendRedirect("login.jsp?role=customer");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
