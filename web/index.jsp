<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/8/2020
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <jsp:include page="inc/header.jsp" />
  <body>
  <jsp:include page="inc/nav.jsp" />
  <div class="section no-pad-bot" id="index-banner" style="
          background-image: url('img/bg.jpg');
          height: 100%;
          background-position: center;
          background-repeat: no-repeat;
          background-size: cover;
  ">
    <div class="container">
      <br><br>
      <h1 class="header center orange-text">Event Handler</h1>
      <div class="row center">
        <h5 class="header col s12 light white-text">The best free event management platform</h5>
      </div>v

      <br><br>

      <div id="get-started" class="row">
<%--        <div class="col s12 center white-text">--%>
<%--          <h5>Who am I</h5>--%>
<%--        </div>--%>
          <div class="col s12 m3 l3 card">
            <h6 class="title center"><strong>Customer</strong></h6>
            <div class="center pb-1">
              <p>
                Anyone who wishes to attend an event hosted by a host.
                Register today to book tickets.
              </p>
              <a class="btn-small light-blue lighten-1" href="customer-register.jsp">Register</a>
            </div>
          </div>

        <div class="col s12 m3 l3 card">
          <h6 class="title center"><strong>Host</strong></h6>
          <div class="center pb-1">
            <p>
              Anyone willing and able to organize and host an event. Must be registered organization
            </p>
            <a class="btn-small light-blue lighten-1" href="host-register.jsp">Register</a>
          </div>
        </div>

        <div class="col s12 m3 l3 card">
          <h6 class="title center"><strong>Service Provider</strong></h6>
          <div class="center pb-1">
            <p>
              Are you a company or an individual who supplies materials for big events ?
              Register here to find clients
            </p>
            <a class="btn-small light-blue lighten-1" href="sp-register.jsp">Register</a>
          </div>
        </div>

        <div class="col s12 m3 l3 card">
          <h6 class="title center"><strong>Sponsor</strong></h6>
          <div class="center pb-1">
            <p>
              Are you a company that for any reason would be interested in sponsoring an event.
              Register today.
            </p>
            <a class="btn-small light-blue lighten-1" href="sponsor-register.jsp">Register</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="inc/scripts.html" />
  </body>
</html>
