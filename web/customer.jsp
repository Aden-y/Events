<%@ page import="java.util.List" %>
<%@ page import="models.Ticket" %>
<%@ page import="dao.TicketDAO" %>
<%@ page import="models.Customer" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/9/2020
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
<%
    List<Ticket> tickets = new ArrayList<>();
    try {
        Customer customer = (Customer) session.getAttribute("user");
        tickets = TicketDAO.getCustomerTickets(customer);

    }catch (Exception e) {
        response.getWriter().println(e.getMessage());
    }
%>
<div class="container">
    <h4>Customer Dashboard</h4>
    <h6 style="font-weight: bold" class="header  orange-text">My Tickets</h6>
    <div class="row">
        <table>
            <thead>
            <tr>
                <th>Ticket Number</th>
                <th>Count</th>
                <th>Event Name</th>
                <th>Total Amount</th>
            </tr>
            </thead>

            <tbody>
            <%
                for(Ticket ticket : tickets){
            %>
            <tr>
                <td><%=ticket.getTicketNumber()%></td>
                <td><%=1%></td>
                <td><%=ticket.getEventName()%></td>
                <td><%=500%></td>
            </tr>
            <%
                }
            %>
            </tbody>

        </table>

    </div>
</div>
</body>
</html>
