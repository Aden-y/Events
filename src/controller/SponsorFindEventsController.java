package controller;

import dao.SponsorshipRequestDAO;
import models.Sponsor;
import models.SponsorshipRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SponsorFindEventsController", urlPatterns = {"/sponsor-find-events"})
public class SponsorFindEventsController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("event")),
                    sponsorId = Integer.parseInt(request.getParameter("sponsor"));
            SponsorshipRequest sponsorshipRequest = new SponsorshipRequest(eventId, sponsorId, "S");
            SponsorshipRequestDAO.send(sponsorshipRequest);
            response.getWriter().println("<script>alert('Request sent. The host will respond.');window.location.href = 'sponsor-find-events.jsp';</script>");
        }catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("sponsor-find-events");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Sponsor sponsor = (Sponsor) request.getSession().getAttribute("user");
            response.sendRedirect("sponsor-find-events.jsp");
        }catch (Exception e) {
            e.printStackTrace();
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        }
    }
}
