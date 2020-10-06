package controller;

import dao.SponsorDAO;
import models.Sponsor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SponsorController", urlPatterns = {"/sponsors"})
public class SponsorController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("Register")) {
            String sponsorname = request.getParameter("sponsorname").trim(),
                    krapin = request.getParameter("krapin"),
                    requirements = request.getParameter("requirements"),
                    email = request.getParameter("email"),
                    location = request.getParameter("location"),
                    username = request.getParameter("username"),
                    password = request.getParameter("password");
            SponsorDAO.add(new Sponsor(0, sponsorname, email, location, requirements, krapin, username, password));
            response.sendRedirect("login.jsp?role=Sponsor");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a");
        if (action == null) {
            request.setAttribute("sponsors", SponsorDAO.all());
            request.getRequestDispatcher("sponsors.jsp").forward(request, response);
        }
    }
}
