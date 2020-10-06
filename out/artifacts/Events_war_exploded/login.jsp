<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/8/2020
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp"/>
<body>
<%
    Object user = session.getAttribute("user");
    if (user != null) {
        session.invalidate();
    }
%>
<jsp:include page="inc/nav.jsp" />
<div class="container">
    <%

        String err = (String) request.getAttribute("err");
    %>
    <div class="mx-auto _form mt-3">
        <div class="_form-header">
            <span>Sign In</span>
        </div>
        <%
            if(err != null) {
        %>
        <div class="alert alert-danger text-center">
                <%=err%>
        </div>
        <%
            }
        %>

        <form method="post" action="AuthController">
            <div class="input-field">
                <select name="role">
                    <option value="" disabled selected>Choose your role</option>
                    <option value="Customer">Customer</option>
                    <option value="Host">Host</option>
                    <option value="Service Provider">Service Provider</option>
                    <option value="Sponsor">Sponsor</option>
                </select>
                <label>Select role</label>
            </div>
            <div>
                <div class="input-field">
                    <input id="username" name="username" type="text" class="validate">
                    <label for="username">Username</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input id="password" name="password" type="password" class="validate">
                    <label for="password">Password</label>
                </div>
            </div>

            <div>
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit" name="action">Login
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function (e) {
        $('select').formSelect();
    });
</script>
</body>
</html>
