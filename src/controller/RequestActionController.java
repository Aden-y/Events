package controller;

import dao.EventDAO;
import dao.SponsorDAO;
import dao.SponsorshipRequestDAO;
import models.Event;
import models.Sponsor;
import models.SponsorshipRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RequestActionController", urlPatterns = {"/request-action"})
public class RequestActionController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Object user = request.getSession().getAttribute("user");
            int action = Integer.parseInt(request.getParameter("action"));
            Event event = EventDAO.get(Integer.parseInt(request.getParameter("event")));
            Sponsor sponsor = SponsorDAO.get(Integer.parseInt(request.getParameter("sponsor")));
            SponsorshipRequest sponsorshipRequest = new SponsorshipRequest(event.getId(), sponsor.getId());
            if(action == 1) {
                SponsorshipRequestDAO.accept(sponsorshipRequest);
            }else if (action == 0){
                SponsorshipRequestDAO.reject(sponsorshipRequest);
            }
            if(user instanceof  Sponsor) {
                response.sendRedirect("sponsor.jsp");
            }else {

            }
           // response.getWriter().println("<script>window.history.back();</script>");

        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>window.history.back();</script>");
        }
    }
}
