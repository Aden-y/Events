<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/9/2020
  Time: 12:22 AM
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
            <span>Sponsor Registration</span>
        </div>
        <form method="post" action="sponsors">
            <div>
                <div class="input-field">
                    <input id="sponsorname" type="text" name="sponsorname"  class="validate" required>
                    <label for="sponsorname">Sponsor Name</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input id="location" type="text" name="location"  class="validate" required>
                    <label for="location">Location</label>
                </div>
            </div>

            <div>

                <div class="input-field">
                    <input id="krapin" type="text" name="krapin"  class="validate" required>
                    <label for="krapin">KRA Pin</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input id="email" type="email" name="email"  class="validate" required>
                    <label for="email">Email Address</label>
                </div>
            </div>
            <div>
                <textarea name="requirements" id="requirements" class="materialize-textarea"></textarea>
                <label>Sponsorship Requirements</label>
            </div>

            <div>
                <div class="input-field">
                    <input id="username" type="text" name="username"  class="validate" required>
                    <label for="username">Username</label>
                </div>
            </div>


            <div>
                <div class="input-field">
                    <input id="password" type="password" name="password"  class="validate" required>
                    <label for="password">Password</label>
                </div>
            </div>

            <div>
                <input name="action" value="Register" hidden type="text">
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit" >Register
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
