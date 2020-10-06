<%@ page import="java.util.List" %>
<%@ page import="models.ServiceProviderService" %>
<%@ page import="models.ServiceProvider" %>
<%@ page import="dao.ServiceProviderDAO" %>
<%@ page import="dao.ServiceProviderServiceDAO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/20/2020
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
<%

    List<ServiceProviderService> services = null;
    try {
        ServiceProvider provider = ServiceProviderDAO.get(Integer.parseInt(request.getParameter("provider")));
        services = ServiceProviderServiceDAO.findByProvider(provider);

    }catch (Exception e) {
        services = ServiceProviderServiceDAO.all();
    }
%>

<div class="container">
    <h4>Services</h4>
    <div>
        <ul class="collection">
            <%
                for (ServiceProviderService service: services){
                    ServiceProvider provider = service.getProvider();
            %>
            <li class="collection-item">
                <h6 class="orange-text title"><%=service.getServiceName()%></h6>
                <p><%=service.getDescription()%></p>
                <p  class="strong price">Ksh. <%=service.getPrice()%></p>

                <p class="event-bottom">
                    <span><i class="fa fa-user"></i> &nbsp; <%=provider.getCompanyname()%></span>  |
                    <span><i class="fa fa-map-marker"></i> &nbsp; <%=provider.getLocation()%></span> |
                    <span><i class="fa fa-phone"></i> &nbsp; <%=provider.getPhonenumber()%></span>
                </p>
                <div>
                    <button onclick="displayModal('<%=provider.getId()%>', '<%=service.getServiceName()%>')" class="btn waves-effect waves-light light-blue lighten-1"><i class="fa fa-envelope"></i>&nbsp;Contact Provider</button>
                </div>
            </li>
            <%
                }
            %>
        </ul>
    </div>
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

    function displayModal(sp, defaultMessage) {
        document.getElementById('modalDisplay').click();
        document.getElementById('spId').value = sp;
        document.getElementById('message').value = 'I am interested in your '+defaultMessage+' advertised at EventHandler.\nPlease contact me back.';
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
