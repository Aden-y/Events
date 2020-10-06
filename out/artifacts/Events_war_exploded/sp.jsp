<%@ page import="models.ServiceProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="models.ServiceProviderService" %>
<%@ page import="dao.ServiceProviderServiceDAO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/16/2020
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
<%
    Object user = session.getAttribute("user");
    if(user  == null || !(user instanceof ServiceProvider)) {
        session.invalidate();
        response.sendRedirect("login.jsp");
        return;
    }
    ServiceProvider provider = (ServiceProvider) user;
    List<ServiceProviderService> services = ServiceProviderServiceDAO.findByProvider(provider);
%>
<div class="container">
    <h4>My Services</h4>
    <div>
        <ul class="collection">
            <%
                for (ServiceProviderService service: services){
            %>
            <li class="collection-item">
                <h6 class="orange-text title"><%=service.getServiceName()%></h6>
                <p><%=service.getDescription()%></p>
                <p  class="strong price">Ksh. <%=service.getPrice()%></p>
                <div>

                    <form action="delete-service" method="post">
                        <a href="update-service?service=<%=service.getId()%>" class="btn waves-effect waves-light light-blue lighten-1"><i class="fa fa-edit"></i>&nbsp;Manage Service</a>
                        <input value="<%=service.getId()%>" name="service" hidden>
                        <button type="submit" class="btn waves-effect  red darken-3"><i class="fa fa-trash"></i>&nbsp;Delete Service</button>
                    </form>

                </div>
            </li>
            <%
                }
            %>
        </ul>
    </div>

</div>
</body>
</html>
