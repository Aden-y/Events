<%@ page import="java.util.List" %>
<%@ page import="models.ServiceProvider" %>
<%@ page import="dao.ServiceProviderDAO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/18/2020
  Time: 10:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
    <div class="container">
        <h4>Service Providers</h4>
        <%
            List<ServiceProvider> serviceProviders = ServiceProviderDAO.all();
            if(serviceProviders.size() > 0) {
                for (ServiceProvider serviceProvider: serviceProviders) {

        %>
        <ul class="collection">
            <li class="collection-item">
                <span class="title orange-text strong"><%=serviceProvider.getCompanyname()%></span>
                <p><%=serviceProvider.getDescription()%></p>
                <p class="event-bottom">
                    <span><i class="fa fa-map-marker"></i> &nbsp; <%=serviceProvider.getLocation()%></span> |
                    <span><i class="fa fa-phone"></i> &nbsp; <%=serviceProvider.getPhonenumber()%></span>
                </p>
                <div>
                    <button onclick="displayModal('<%=serviceProvider.getId()%>')" class="btn waves-effect waves-light light-blue lighten-1"><i class="fa fa-envelope"></i>&nbsp;Contact</button>
                    <a class="btn waves-effect waves-light light-blue lighten-1" href="services.jsp?provider=<%=serviceProvider.getId()%>">Services Offered</a>
                </div>
            </li>

        </ul>
        <%}
            } else {
        %>
        <div>
            No service providers
        </div>
        <%
            }
        %>
    </div>

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
