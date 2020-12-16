<%@ page import="controller.AdminController" %>
<%@ page import="models.*" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/9/2020
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/admin-nav.jsp" />
<div class="center">

    <%
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("admin-auth.jsp");
            return;
        }
        Users users = new Users();
    %>
    <div class="row">
        <div class="col s12">
            <ul class="tabs">
                <li class="tab col s3"><a href="#customers">Customers</a></li>
                <li class="tab col s3"><a  href="#hosts">Hosts</a></li>
                <li class="tab col s3 "><a href="#sp">Service Providers</a></li>
                <li class="tab col s3"><a href="#sponsors">Sponsors</a></li>
            </ul>
        </div>
        <div id="customers" class="col s12">
            <table>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>National Id</th>
                    <th>Email</th>
                    <th>Phone </th>
                    <th>Username</th>

                        <%
                    for (Customer user: users.customers) {
                %>
                <tr>
                    <td><%=user.getId()%></td>
                    <td><%=user.getFirstname()%></td>
                    <td><%=user.getLastname()%></td>
                    <td><%=user.getNationalid()%></td>
                    <td><%=user.getEmail()%></td>
                    <td><%=user.getPhonenumber()%></td>
                    <td><%=user.getUsername()%></td>

                </tr>
                <%
                    }
                %>
                </tr>
            </table>
        </div>
        <div id="hosts" class="col s12">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>KRA Pin</th>
                    <th>Email</th>
                    <th>Phone </th>
                    <th>Username</th>
                    <th>Approve</th>

                        <%
                    for (Host user: users.hosts) {
                %>
                <tr>
                    <td><%=user.getId()%></td>
                    <td><%=user.getHostname()%></td>
                    <td><%=user.getKrapin()%></td>
                    <td><%=user.getHostemail()%></td>
                    <td><%=user.getPhonenumber()%></td>
                    <td><%=user.getUsername()%></td>
                    <td>
                        <a class="btn-small" href="admin?approve=Customer&id=<%=user.getId()%>">
                            Approve
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tr>
            </table>
        </div>
        <div id="sp" class="col s12">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Company Name</th>
                    <th>Email</th>
                    <th>Phone </th>
                    <th>Description </th>
                    <th>Location </th>
                    <th>Username</th>
                    <th>Approve</th>

                        <%
                    for (ServiceProvider user: users.providers) {
                %>
                <tr>
                    <td><%=user.getId()%></td>
                    <td><%=user.getCompanyname()%></td>
                    <td><%=user.getEmail()%></td>
                    <td><%=user.getPhonenumber()%></td>
                    <td><%=user.getDescription()%></td>
                    <td><%=user.getLocation()%></td>
                    <td><%=user.getUsername()%></td>
                    <td>
                        <a class="btn-small" href="admin?approve=SP&id=<%=user.getId()%>">
                            Approve
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tr>
            </table>
        </div>
        <div id="sponsors" class="col s12">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Sponsor Name</th>
                    <th>KRA Pin</th>
                    <th>Email</th>
                    <th>Location </th>
                    <th>Requirements </th>
                    <th>Username</th>
                    <th>Approve</th>

                        <%
                    for (Sponsor user: users.sponsors) {
                %>
                <tr>
                    <td><%=user.getId()%></td>
                    <td><%=user.getSponsorname()%></td>
                    <td><%=user.getKrapin()%></td>
                    <td><%=user.getEmail()%></td>
                    <td><%=user.getLocation()%></td>
                    <td><%=user.getSponsorshiprequirements()%></td>
                    <td><%=user.getUsername()%></td>
                    <td>
                        <a class="btn-small" href="admin?approve=Sponsor&id=<%=user.getId()%>">
                            Approve
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tr>
            </table>
        </div>
    </div>

</div>
</body>
<script>
    $(document).ready(function(){
        $('.tabs').tabs();
    });
</script>
</html>
