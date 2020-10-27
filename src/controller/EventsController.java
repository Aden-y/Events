package controller;

import dao.EventDAO;
import models.Customer;
import models.Event;
import models.Host;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EventsController", urlPatterns = {"/events"})
public class EventsController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action  = request.getParameter("action");

        if (action.equals("Create")) {
            String eventname = request.getParameter("eventname"),
                    type = request.getParameter("eventtype"),
                    description = request.getParameter("description").trim(),
                    date = request.getParameter("eventdate"),
                    location = request.getParameter("eventlocation");
            int duration = Integer.parseInt(request.getParameter("duration"));
            Host host = (Host) request.getSession().getAttribute("user");
            double entryfee = Double.parseDouble(request.getParameter("entryfee"));

            EventDAO.add(new Event(0, host.getId(), duration, eventname,description, type, location, date, entryfee));
            response.sendRedirect("host.jsp");
            return;
        }else if(action.equals("book")) {
            Customer user = (Customer) request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("f") != null) {
            String status = request.getParameter("fs");
            if (status.equals("u")) {
                request.setAttribute("events", EventDAO.getUpcoming());
            }else if (status.equals("l")) {
                request.setAttribute("events", EventDAO.getLive());
            }else if (status.equals("p")) {
                request.setAttribute("events", EventDAO.getPast());
            }else {
                request.setAttribute("events", EventDAO.all());
            }
            request.getRequestDispatcher("events.jsp").forward(request,response);
            return;
        }
        String action = request.getParameter("a");
        if(action == null) {
            request.setAttribute("events", EventDAO.all());
            request.getRequestDispatcher("events.jsp").forward(request,response);
        }else if (action.equals("create")) {
            response.sendRedirect("create-event.jsp");
        }

    }


}
