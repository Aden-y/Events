<%@ page import="models.ServiceProvider" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/20/2020
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp"/>
<%
    Object user = session.getAttribute("user");
    if (user == null || !(user instanceof ServiceProvider)) {
        session.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }
%>
<body>
<jsp:include page="inc/nav.jsp"/>
 <div class="container">
    <div class="mx-auto _form mt-3">
        <div class="_form-header"> <span>Add Service</span></div>
        <form method="post" action="add-service">
            <div class="input-field">
                <input id="serviceName" name="serviceName" type="text" class="validate" required>
                <label for="serviceName">Service Name</label>
            </div>
            <div class="input-field">
                <textarea id="description" name="description" class="materialize-textarea validate" required>
                </textarea>
                <label for="description">Service Description</label>
            </div>
            <div class="input-field">
                <input id="price" name="price" type="number" min="0" class="validate" required>
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
