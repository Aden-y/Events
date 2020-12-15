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


            <li><a href="admin.jsp">Home</a></li>
            <li><a href="reports.jsp">Reports</a></li>
            <li><a href="admin-auth.jsp?logout=1">Logout</a></li>

        </ul>
        <%--Menus--%>

        <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
    <script>
        $(document).ready(function (e) {
            $(".dropdown-trigger").dropdown();
        });

    </script>
</nav>
