<%@ page import="models.Host" %>
<%@ page import="models.Customer" %>
<%@ page import="models.Sponsor" %>
<%@ page import="models.ServiceProvider" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/8/2020
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object user = request.getSession().getAttribute("user");
    String role = (String) request.getSession().getAttribute("role");
%>
<nav class="light-blue lighten-1" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">
        Event Handler
    </a>
        <ul class="right hide-on-med-and-down">


            <%
                if(user == null) {
            %>
            <li>
                <a href="index.jsp">Home</a>
            </li>
            <li>
                <a href="events">Events</a>
            </li>
            <li>
                <a href="sponsors">Sponsors</a>
            </li>
            <li>
                <a href="service-providers.jsp">Service Providers</a>
            </li>
            <li>
                <a href="services.jsp">Services</a>
            </li>
            <li><a href="login.jsp">Login </a></li>
            <li><a class="dropdown-trigger" href="#!" data-target="registerMenu">Register<i class="material-icons right">arrow_drop_down</i></a></li>
            <%
                }else  {
                    if (user instanceof  Host) {
            %>

            <%--Menu Only Visible to the Host--%>
            <li><a href="host.jsp">Home</a></li>
            <li><a href="events?a=create">Create Event</a></li>
            <li><a href="host-events.jsp">Manage Events</a></li>
            <%
                }else if( user instanceof Customer) {
            %>
            <%-- Menu Only Visible to Customer--%>
            <li><a href="customer.jsp">Home</a></li>
            <li><a href="events">Events</a></li>

            <%
                }else if (user instanceof Sponsor) {
            %>
            <%-- Menu Only Visible to Sponsor--%>
            <li><a href="sponsor.jsp">Home</a></li>
            <li><a href="sponsor-find-events">Find Event</a></li>
            <li><a href="sponsor-events">Sponsored Events</a></li>

            <%
            }else if( user instanceof ServiceProvider) {
            %>
            <%-- Menu Only Visible to Customer--%>
            <li><a href="sp.jsp">Home</a></li>
            <li><a href="add-service">Add Service</a></li>
            <%
                }
            %>
            <li><a href="profile.jsp">Manage Profile</a></li>
            <li><a href="AuthController">Logout</a></li>
            <%
                }
            %>
        </ul>
    <%--Menus--%>
        <ul id="registerMenu" class="dropdown-content">
            <li><a  href="customer-register.jsp">Customer</a></li>
            <li><a  href="host-register.jsp">Host</a></li>
            <li><a  href="sp-register.jsp">Service Provider</a></li>
            <li><a  href="sponsor-register.jsp">Sponsor</a></li>
        </ul>
<%--        Mobile Side Nav--%>
        <ul id="registerMenu1" class="dropdown-content">
            <li><a  href="customer-register.jsp">Customer</a></li>
            <li><a  href="host-register.jsp">Host</a></li>
            <li><a  href="sp-register.jsp">Service Provider</a></li>
            <li><a  href="sponsor-register.jsp">Sponsor</a></li>
        </ul>
        <ul id="nav-mobile" class="sidenav">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a class="dropdown-trigger" href="#!" data-target="registerMenu1">Register<i class="material-icons right">arrow_drop_down</i></a></li>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
    <script>
        $(document).ready(function (e) {
            $(".dropdown-trigger").dropdown();
        });

    </script>
</nav>
