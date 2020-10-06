<%@ page import="java.util.List" %>
<%@ page import="models.Sponsor" %>
<%@ page import="models.Event" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/10/2020
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
<%
    List<Sponsor> sponsors = (List<Sponsor>) request.getAttribute("sponsors");
    Event event = (Event) request.getAttribute("event");
    if(sponsors == null || event == null) {
        response.sendRedirect("host.jsp");
        return;
    }
%>
    <div class="container">
        <h4 class="orange-text strong">Find Sponsors for <%=event.getEventname()%></h4>
        <table class="highlight">
            <thead>
            <tr>
                <th>Name</th>
                <th>Conditions</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Sponsor sponsor: sponsors) {
            %>
            <tr>
                <td><%=sponsor.getSponsorname()%></td>
                <td><%=sponsor.getSponsorshiprequirements()%></td>
                <td>
                    <form action="find-sponsor" method="post">
                        <input hidden name="event" value="<%=event.getId()%>" >
                        <input hidden name="sponsor" value="<%=sponsor.getId()%>" >
                        <input hidden name="by" value="H">
                        <button class="btn waves-effect waves-light light-blue lighten-1" type="submit">Request</button>
                    </form>
                    <button onclick="displayModal('<%=sponsor.getId()%>')" class="btn waves-effect waves-light light-blue lighten-1"><i class="fa fa-comment"></i></button>
                </td>
            </tr>

            <%
                }
            %>
            </tbody>
        </table>
    </div>
<%--    Modal--%>
<!-- Modal Structure -->
<button id="modalDisplay" style="display: none" data-target="modal1" class="btn modal-trigger">Modal</button>
<div id="modal1" class="modal">
    <form action="messages" method="post" onsubmit="return sendMessage()">
        <div class="modal-content">
            <h4 class="orange-text">Contact Sponsor</h4>
            <div>
                <input id="sponsorIdInp" name="sponsorId" hidden >
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
<script>
    $(document).ready(function(){
        $('.modal').modal();
    });

    function displayModal(host) {
        document.getElementById('modalDisplay').click();
        document.getElementById('sponsorIdInp').value = host;
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
</body>
</html>
