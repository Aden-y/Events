<%@ page import="java.util.List" %>
<%@ page import="models.SponsorshipRequest" %>
<%@ page import="dao.SponsorshipRequestDAO" %>
<%@ page import="models.Host" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/9/2020
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<%
    Object user = session.getAttribute("user");
    if (!(user instanceof Host)) {
        session.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }

    Host host = (Host) user;

%>
<jsp:include page="inc/nav.jsp" />
    <div class="container">
        <%
            List<SponsorshipRequest> requests = SponsorshipRequestDAO.getRequestsToHost(host);
            if (requests.size() > 0) {
        %>
        <div>
            <h4>Sponsorship Requests</h4>
            <table>
                <thead>
                <tr>
                    <th>Sponsor Name</th>
                    <th>Event Name</th>
                    <th>Action</th>
                </tr>
                </thead>

                <tbody>
                <%
                    for (SponsorshipRequest sponsorshipRequest: requests) {
                %>
                <tr>
                    <td><%=sponsorshipRequest.getSponsor().getSponsorname()%></td>
                    <td><%=sponsorshipRequest.getEvent().getEventname()%></td>
                    <td>
                        <a href="request-action?event=<%=sponsorshipRequest.getEventId()%>&sponsor=<%=sponsorshipRequest.getSponsorId()%>&action=1"
                           class="waves-effect waves-light btn light-blue lighten-1">Accept</a>
                        <a href="request-action?event=<%=sponsorshipRequest.getEventId()%>&sponsor=<%=sponsorshipRequest.getSponsorId()%>&action=0"
                           class="waves-effect waves-light btn  red darken-4">Reject</a>
                    </td>
                </tr>
                <%
                    }
                %>

                </tbody>
            </table>
        </div>
        <%
            }
        %>
    </div>
</body>
</html>
