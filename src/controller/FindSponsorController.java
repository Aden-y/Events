package controller;

import dao.EventDAO;
import dao.SponsorDAO;
import dao.SponsorshipRequestDAO;
import models.Event;
import models.Host;
import models.SponsorshipRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FindSponsorController", urlPatterns = {"/find-sponsor"})
public class FindSponsorController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int eventId = Integer.parseInt(request.getParameter("event")),
                    sponsorId = Integer.parseInt(request.getParameter("sponsor"));
            String by = request.getParameter("by").trim().toUpperCase();
            SponsorshipRequest sponsorshipRequest = new SponsorshipRequest( eventId,  sponsorId,  by);
            SponsorshipRequestDAO.send(sponsorshipRequest);
            response.getWriter().println("<script>alert('Request sent successfully.'); window.location.href='find-sponsor?event="+eventId+"'</script>");
            //response.sendRedirect("find-sponsor?event="+eventId);
        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>window.history.back();</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Host host = (Host) request.getSession().getAttribute("user");
            request.setAttribute("event", EventDAO.get(Integer.parseInt(request.getParameter("event"))));
            request.setAttribute("sponsors", SponsorDAO.all());
            request.getRequestDispatcher("find-sponsor.jsp").forward(request, response);
        }catch (Exception e) {
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        }
    }
}
