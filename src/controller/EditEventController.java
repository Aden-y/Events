package controller;

import dao.EventDAO;
import models.Event;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditEventController", urlPatterns = {"/edit-event"})
public class EditEventController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("event"));
            request.setAttribute("event", EventDAO.get(eventId));
            request.getRequestDispatcher("edit-event.jsp").forward(request, response);
        }catch (Exception e) {
            response.sendRedirect("host.jsp");
        }
    }
}
