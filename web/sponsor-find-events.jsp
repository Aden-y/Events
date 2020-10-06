<%@ page import="models.Sponsor" %>
<%@ page import="models.Event" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.EventDAO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/18/2020
  Time: 7:07 PM
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
    List<Event> events = EventDAO.getUpcoming();
%>
<div class="container">
    <h4 class="title orange-text strong">Available Events</h4>
    <div>
        <ul class="collection">
            <%
                for(Event event: events) {
            %>
            <li class="collection-item">
                <span class="title orange-text strong"><%=event.getEventname()%></span>
                <p>
                    <%=event.getDescription()%>
                </p>
                <div>
                    <p class="event-bottom">
                        <span><i class="fa fa-user"></i> &nbsp; <%=event.getHostName()%></span>  |
                        <span><i class="fa fa-map-marker"></i> &nbsp; <%=event.getEventlocation()%></span> |
                        <span><i class="fa fa-calendar"></i> &nbsp; <%=event.getEventdate()%></span>
                    </p>
                </div>
                <div>
<%--                    <a href="request-action?event=<%=sponsorshipRequest.getEventId()%>&sponsor=<%=sponsorshipRequest.getSponsorId()%>&action=1"--%>
<%--                       class="waves-effect waves-light btn light-blue lighten-1"></a>--%>
                   <form action="sponsor-find-events" method="post">
                        <input name="event" value="<%=event.getId()%>" hidden>
                        <input name="sponsor" value="<%=sponsor.getId()%>" hidden>
                       <button type="submit" class="waves-effect waves-light btn light-blue lighten-1">
                           Request to sponsor
                       </button>
                   </form>
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

