package controller;

import dao.ServiceProviderDAO;
import dao.ServiceProviderServiceDAO;
import models.ServiceProvider;
import models.ServiceProviderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddProviderServiceController", urlPatterns = {"/add-service"})
public class AddProviderServiceController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object user = request.getSession().getAttribute("user");
        try {
            ServiceProvider serviceProvider = (ServiceProvider) user;
            String serviceName = request.getParameter("serviceName"),
                    description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            ServiceProviderService  service = new ServiceProviderService(
                    serviceProvider.getId(),
                    price,
                    serviceName,
                    description
            );
            ServiceProviderServiceDAO.add(service);
            response.getWriter().println("<script>alert('Service added.'); window.location.href='add-service.jsp';</script>");
        }catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add-service.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("add-service.jsp");
    }
}
