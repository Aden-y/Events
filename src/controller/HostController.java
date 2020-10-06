package controller;

import dao.HostDAO;
import models.Host;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HostController", urlPatterns = {"/HostController"})
public class HostController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.trim().equals("Register")) {
            String hostname = request.getParameter("hostname").trim(),
                    krapin = request.getParameter("krapin"),
                    phonenumber = request.getParameter("phonenumber"),
                    email = request.getParameter("email"),
                    username = request.getParameter("username"),
                    password = request.getParameter("password");

            HostDAO.add(new Host(0, hostname, krapin, email, phonenumber, username, password));
            response.sendRedirect("login.jsp?role=Host");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
