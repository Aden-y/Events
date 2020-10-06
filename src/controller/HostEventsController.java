package controller;

import dao.EventDAO;
import models.Event;
import models.Host;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HostEventsController", urlPatterns = {"/host-events"})
public class HostEventsController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Host host = (Host) request.getSession().getAttribute("user");
            request.setAttribute("events", EventDAO.findByHost(host.getId()));
            request.getRequestDispatcher("host-events.jsp").forward(request, response);
        }catch (Exception e) {
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        }
    }
}
