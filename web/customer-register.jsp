<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/8/2020
  Time: 5:51 PM
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
              <span>Customer Registration</span>
          </div>
          <form method="post" action="/CustomerController">
              <div class="row">
                  <div class="col-6">
                      <div class="input-field">
                          <input name="firstname"  id="firstname" type="text" class="validate" required>
                          <label for="firstname">First Name</label>
                      </div>
                  </div>
                  <div class="col-6">
                      <div class="input-field">
                          <input name="lastname"  id="lastname" type="text" class="validate" required>
                          <label for="lastname">Last Name</label>
                      </div>
                  </div>
              </div>
              <div>
                  <div class="input-field">
                      <input name="nationalid"  id="nationalid" type="number" min="0" class="validate" required>
                      <label for="nationalid">National ID</label>
                  </div>
              </div>
              <div>
                  <div class="input-field">
                      <input name="phonenumber"  id="phonenumber" type="tel" class="validate" required>
                      <label for="phonenumber">Phone Number</label>
                  </div>
              </div>
              <div>
                  <div class="input-field">
                      <input name="email"  id="email" type="email" class="validate" required>
                      <label for="email">Email Address</label>
                  </div>
              </div>

              <div>
                  <div class="input-field">
                      <input name="username"  id="username" type="text" class="validate" required>
                      <label for="username">Username</label>
                  </div>
              </div>

              <div>
                  <div class="input-field">
                      <input name="password"  id="password" type="password" class="validate" required>
                      <label for="password">Password</label>
                  </div>

              </div>

              <div>
                <input type="text" hidden class="_action-btn" name="action" value="Register">
                  <button class="btn waves-effect waves-light light-blue lighten-1" type="submit">Register
                      <i class="material-icons right">send</i>
                  </button>
              </div>

          </form>
      </div>
    </div>
</body>
</html>
