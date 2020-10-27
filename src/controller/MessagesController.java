package controller;

import dao.HostDAO;
import models.Host;
import services.MailerService;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

@WebServlet(name = "MessagesController", urlPatterns = {"/messages"})
public class MessagesController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").trim();
        String email = request.getParameter("email");
        String content = request.getParameter("message");

        if(request.getParameter("hostId") != null) {
           try {
               int hostId = Integer.parseInt(request.getParameter("hostId"));
               Host host = HostDAO.get(hostId);
               MailerService.sendMessage(host.getHostemail(), "Event Inquiry", content);
           }catch (Exception e) {
               response.getWriter().println(e.getMessage());
               e.printStackTrace();
               response.getWriter().println("<script>alert('Could not send message'); </script>");
              response.sendRedirect("events.jsp");
           }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
