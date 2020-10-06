package controller;

import dao.HostDAO;
import models.Host;
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
               String to = host.getHostemail();
               String from = "princejoachime@gmail.com";
               String server = "localhost";
               Properties properties = System.getProperties();
               properties.setProperty("mail.smtp.host", server);
               Session session = Session.getDefaultInstance(properties);

               try {
                   // Create a default MimeMessage object.
                   MimeMessage message = new MimeMessage(session);
                   // Set From: header field of the header.
                   message.setFrom(new InternetAddress(from));
                   // Set To: header field of the header.
                   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                   // Set Subject: header field
                   message.setSubject("Event Handler Customer Inquiry.");
                   // Now set the actual message
                  // Customer customer = (Customer) request.getSession().getAttribute("user");
                   String actualMessage = "Customer Name : "+name;
                   actualMessage+="\nEmail Address : "+email;
                   actualMessage+="\nMessage:\n"+content;
                   message.setText(actualMessage);
                   // Send message
                   Transport.send(message);
                   System.out.println("Sent message successfully....");
                   response.getWriter().println("<script>alert('Sent message successfully....')</script>");
               } catch (MessagingException mex) {
                   mex.printStackTrace();
                   response.getWriter().println("<script>alert('Could not send message'); </script>");
               }
           }catch (Exception e) {
               response.getWriter().println(e.getMessage());
               e.printStackTrace();
              // response.sendRedirect("events.jsp");
           }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
