package controller;

import dao.ServiceProviderServiceDAO;
import models.ServiceProvider;
import models.ServiceProviderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteServiceController", urlPatterns = {"/delete-service"})
public class DeleteServiceController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServiceProviderServiceDAO.delete(Integer.parseInt(request.getParameter("service")));
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.sendRedirect("sp.jsp");
    }
}
