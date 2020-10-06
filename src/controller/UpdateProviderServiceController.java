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

@WebServlet(name = "UpdateProviderServiceController", urlPatterns = {"/update-service"})
public class UpdateProviderServiceController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       Object user = request.getSession().getAttribute("user");

        try {
            ServiceProvider serviceProvider = (ServiceProvider) user;
            int serviceId = Integer.parseInt(request.getParameter("serviceId"));
            ServiceProviderService service = ServiceProviderServiceDAO.get(serviceId);
            String serviceName = request.getParameter("serviceName"),
                    description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            service.setServiceName(serviceName);
            service.setDescription(description);
            service.setPrice(price);
            ServiceProviderServiceDAO.update(service);
            response.sendRedirect("sp.jsp");
        }catch (Exception e) {
            response.sendRedirect("sp.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            int serviceId = Integer.parseInt(request.getParameter("service"));
            ServiceProviderService service = ServiceProviderServiceDAO.get(serviceId);
            if(service == null) {
                response.sendRedirect("sp.jsp");
            }else {
                request.setAttribute("service", service);
                request.getRequestDispatcher("update-service.jsp").forward(request, response);
            }
        }catch (Exception e) {
            response.sendRedirect("sp.jsp");
        }
    }
}
