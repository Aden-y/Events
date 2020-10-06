<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/8/2020
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
<div class="container">

    <div class="mx-auto _form mt-3">
        <div class="_form-header">
            <span>Host Registration</span>
        </div>
        <form method="post" action="HostController">
            <div>
                <input type="text" class="_input" name="hostname" placeholder="Host Name" required>
                <p id="hostname"></p>
            </div>
            <div>
                <input type="text" min="0" class="_input" name="krapin" placeholder="KRA Pin">
                <p id="krapin"></p>
            </div>
            <div>
                <input type="tel" class="_input" name="phonenumber" placeholder="Phone Number">
                <p id="phonenumber"></p>
            </div>
            <div>
                <input type="email"  class="_input" name="email" placeholder="Email Address">
                <p id="email"></p>
            </div>

            <div>
                <input type="text" class="_input" name="username" placeholder="Username">
                <p id="username"></p>
            </div>

            <div>
                <input type="password" class="_input" name="password" placeholder="Password">
                <p id="password"></p>
            </div>

            <div>
                <input type="text" value="Register" name="action" hidden>
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit">
                    Register as Host
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
