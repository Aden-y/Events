<%@ page import="models.Sponsor" %>
<%@ page import="models.EventSponsor" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.EventSponsorDAO" %>
<%@ page import="models.Event" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/18/2020
  Time: 8:07 PM
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
    List<EventSponsor> eventSponsorList = EventSponsorDAO.getSponsorsEvent(sponsor);
%>
<div class="container">
    <h4 class="title orange-text">Events you are sponsoring</h4>
    <div>
        <ul class="collection">
            <%
                for(EventSponsor eventSponsor: eventSponsorList) {
                    Event event = eventSponsor.getEvent();
            %>
            <li class="collection-item">
                <span class="title orange-text strong"><%=eventSponsor.getEvent().getEventname()%></span>
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


