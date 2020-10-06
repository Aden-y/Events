<%@ page import="models.ServiceProvider" %>
<%@ page import="models.ServiceProviderService" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/20/2020
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp"/>
<body>
<%
    Object user = session.getAttribute("user");
    if (user == null || !(user instanceof ServiceProvider)) {
        session.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }
    ServiceProviderService service = (ServiceProviderService) request.getAttribute("service");
    if (service == null) {
        request.getRequestDispatcher("update-service").forward(request, response);
        return;
    }
%>
<jsp:include page="inc/nav.jsp"/>
<div class="container">
    <div class="mx-auto _form mt-3">
        <div class="_form-header"> <span>Update Service</span></div>
        <form method="post" action="update-service">
            <div class="input-field">
                <input id="serviceId" value="<%=service.getId()%>" name="serviceId" type="number" class="validate" hidden required>
                <input id="serviceName" value="<%=service.getServiceName()%>" name="serviceName" type="text" class="validate" required>
                <label for="serviceName">Service Name</label>
            </div>
            <div class="input-field">
                <textarea id="description" value="<%=service.getDescription()%>" name="description" class="materialize-textarea validate" required>
                <%=service.getDescription()%>
                </textarea>
                <label for="description">Service Description</label>
            </div>
            <div class="input-field">
                <input id="price" value="<%=service.getPrice()%>" name="price" type="number" min="0" class="validate" required>
                <label for="price">Unit Price</label>
            </div>
            <div class="input-field">
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit" >Submit
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
