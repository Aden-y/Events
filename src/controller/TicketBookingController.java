package controller;

import dao.EventDAO;
import dao.TicketDAO;
import models.Customer;
import models.Event;
import models.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TicketBookingController", urlPatterns = {"/TicketBookingController"})
public class TicketBookingController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Customer customer = (Customer) request.getSession().getAttribute("user");
            int eventId = Integer.parseInt(request.getParameter("event"));
            Event event = EventDAO.get(eventId);
            int count = Integer.parseInt(request.getParameter("count"));
            double amount = count * event.getEvententryfee();
            //*****************//
            //Send Payment Request //
            //*******************///

            Ticket ticket = new Ticket(customer.getId(), event.getId() );
            TicketDAO.book(ticket);
            response.sendRedirect("customer.jsp");
        }catch (Exception e) {
          //  response.getWriter().println(e.getStackTrace());
            e.printStackTrace();
            response.sendRedirect("events.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object user = request.getSession().getAttribute("user");
        if( user == null ) {
            response.sendRedirect("login.jsp");
        }else if(user instanceof Customer) {
            try {
                int eventId = Integer.parseInt(request.getParameter("event"));
                Event event = EventDAO.get(eventId);
                request.setAttribute("event", event);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            }catch (Exception e) {
                response.sendRedirect("events.jsp");
            }
        }else {
            response.sendRedirect("events.jsp");
        }
     }
}
