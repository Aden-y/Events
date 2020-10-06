<%@ page import="models.Sponsor" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/11/2020
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
<div class="container">
    <h3>Sponsors</h3>
    <%
        List<Sponsor> sponsors = (List<Sponsor>) request.getAttribute("sponsors");
        if(sponsors == null){
            response.sendRedirect("./sponsors");
        }else{
            for(Sponsor s: sponsors) {
    %>
    <div class="event-display card">
        <div>
            <h6 class="orange-text"><%=s.getSponsorname()%></h6>
            <strong>Conditions.</strong><br>
            <p class="description"><%=s.getSponsorshiprequirements()%></p>
            <p class="event-bottom">
                <span><i class="fa fa-map-marker"></i> &nbsp; <%=s.getLocation()%></span> |
                <span><i class="fas fa-envelope-square"></i> &nbsp; <%=s.getEmail()%></span>
            </p>
            <button class="modal-close waves-effect waves-green btn-flat" type="button" onclick="displayModal('<%=s.getId()%>')" >
                <i class="fa fa-envelope"></i>&nbsp;
                <a href="#">Contact</a>
            </button>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
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
</body>
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
</html>
