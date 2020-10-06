<%@ page import="models.Sponsor" %>
<%@ page import="models.SponsorshipRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.SponsorshipRequestDAO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/16/2020
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
<%
    Object user = session.getAttribute("user");
    if(user  == null || !(user instanceof Sponsor)) {
        session.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }
    Sponsor sponsor = (Sponsor) user;
    List<SponsorshipRequest> requests = SponsorshipRequestDAO.getSponsorsRequests(sponsor);
%>
<div class="container">
    <h4 class="orange-text">Sponsor Dashboard</h4>
    <h6 class="strong">Available Requests</h6>
    <div>
        <ul class="collection">
           <%
               for(SponsorshipRequest sponsorshipRequest: requests) {
           %>
            <li class="collection-item">
                <span class="title orange-text strong"><%=sponsorshipRequest.getEvent().getEventname()%></span>
                <p>
                    <%=sponsorshipRequest.getEvent().getDescription()%>
                </p>
                <div>
                    <p class="event-bottom">
                        <span><i class="fa fa-user"></i> &nbsp; <%=sponsorshipRequest.getEvent().getHostName()%></span>  |
                        <span><i class="fa fa-map-marker"></i> &nbsp; <%=sponsorshipRequest.getEvent().getEventlocation()%></span> |
                        <span><i class="fa fa-calendar"></i> &nbsp; <%=sponsorshipRequest.getEvent().getEventdate()%></span>
                    </p>
                </div>
                <div>
                    <a href="request-action?event=<%=sponsorshipRequest.getEventId()%>&sponsor=<%=sponsorshipRequest.getSponsorId()%>&action=1"
                       class="waves-effect waves-light btn light-blue lighten-1">Accept</a>
                    <a href="request-action?event=<%=sponsorshipRequest.getEventId()%>&sponsor=<%=sponsorshipRequest.getSponsorId()%>&action=0"
                       class="waves-effect waves-light btn  red darken-4">Reject</a>
                </div>
            </li>

            <%
                }
            %>
        </ul>
    </div>
</div>
</body>
</html>
