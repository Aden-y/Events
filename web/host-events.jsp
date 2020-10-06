<%@ page import="models.Event" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/10/2020
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
<div class="container">
    <h4 class="header orange-text">My Events</h4>
    <%
        List<Event> events = (List<Event>) request.getAttribute("events");
        if(events == null){
            response.sendRedirect("./host-events");
        }else{
            for(Event e: events) {
    %>
    <div class="event-display card">
        <div>
            <span class="badge badge-danger">LIVE</span>
            <h6><%=e.getEventname()%></h6>
            <p class="event-type"><%=e.getEventtype()%></p>
            <p class="description"><%=e.getDescription()%></p>
            <p class="event-bottom">
                <span><i class="fa fa-user"></i> &nbsp; <%=e.getHostName()%></span>  |
                <span><i class="fa fa-map-marker"></i> &nbsp; <%=e.getEventlocation()%></span> |
                <span><i class="fa fa-calendar"></i> &nbsp; <%=e.getEventdate()%></span>
            </p>
            <h6 class="header center orange-text">Ksh.<%=e.getEvententryfee()%></h6>
            <div class="row">
                <div>
                    <button class="btn waves-effect waves-light light-blue lighten-1" >
                        <a class="btn-link" href="find-sponsor?event=<%=e.getId()%>">Find Sponsors</a>
                    </button>
                    <button class="btn waves-effect waves-light light-blue lighten-1" >
                        <a class="btn-link" href="edit-event?event=<%=e.getId()%>"><i class="fa fa-edit"></i>&nbsp;Edit</a>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
</body>
</html>
