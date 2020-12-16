<%@ page import="models.Sponsor" %>
<%@ page import="models.SponsorshipRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.SponsorshipRequestDAO" %>
<%@ page import="dao.ServiceProviderDAO" %><%--
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
                    <div>
                        <button onclick="displayModal('<%=ServiceProviderDAO.get(sponsorshipRequest.getEvent().getEventhost()).getId()%>')" class="btn waves-effect waves-light light-blue lighten-1"><i class="fa fa-envelope"></i>&nbsp;Contact</button>
                        <a class="btn waves-effect waves-light light-blue lighten-1" href="services.jsp?provider=<%=ServiceProviderDAO.get(sponsorshipRequest.getEvent().getEventhost()).getId()%>">Services Offered</a>
                    </div>
                </div>
            </li>

            <%
                }
            %>
        </ul>
    </div>
</div>
</body>

<!-- Modal Structure -->
<button id="modalDisplay" style="display: none" data-target="modal1" class="btn modal-trigger">Modal</button>
<div id="modal1" class="modal">
    <form action="messages" method="post" onsubmit="return sendMessage()">
        <div class="modal-content">
            <h6>Contact Service Provider</h6>
            <div>
                <input id="spId" name="hostId" hidden >
            </div>
            <div class="input-field">
                <input id="name" name="name" type="text" class="validate" required>
                <label for="name">Full Name</label>
            </div>

            <div class="input-field">
                <input id="email" name="email" type="email" class="validate" required>
                <label for="email">Email Address</label>
            </div>
            <div class="input-field">
                <textarea name="message" id="message" class="materialize-textarea validate" required></textarea>
                <label for="message">Message</label>
            </div>
        </div>
        <div class="modal-footer">
            <button  class="modal-close waves-effect waves-green btn-flat" type="button">Cancel</button>
            <button class="btn waves-effect waves-light light-blue lighten-1" type="submit" name="action">Send
                <i class="material-icons right">send</i>
            </button>
        </div>
    </form>
</div>
</body>
<script>
    $(document).ready(function(){
        $('.modal').modal();
    });

    function displayModal(sp) {
        document.getElementById('modalDisplay').click();
        document.getElementById('spId').value = sp;
    }

    function sendMessage() {
        var name = document.getElementById('name').value.trim();
        if(name == '' ) {
            alert('Name is required');
            return false;
        }
        var email = document.getElementById('email').value.trim();
        if(email == '' ) {
            alert('Email can not be empty');
            return  false;
        }
        var message = document.getElementById('message').value.trim();
        if(message == '') {
            alert('Message is required');
            return false;
        }
        return true;
    }
</script>
</html>
