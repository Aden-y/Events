
<nav class="_nav">
    <div class="nav-left">
        <span class="fa fa-bars font_32 menu mr-3 color-primary"></span>&nbsp;
        <span class="_title font_32 color-primary">Event Handler</span>
    </div>
    <ul class="_nav_items">
        <li class="_nav-item">
            <a href="index.jsp">Home</a>
        </li>
        <%
            if(user == null) {
        %>
        <li class="_nav-item">
            <a href="login.jsp">Login</a>
        </li>
        <li class="_nav-item">
            <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Register
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="customer-register.jsp">Customer</a>
                <a class="dropdown-item" href="host-register.jsp">Host</a>
                <a class="dropdown-item" href="sp-register.jsp">Service Provider</a>
                <a class="dropdown-item" href="sponsor-register.jsp">Sponsor</a>
            </div>
        </li>

        <%
            }
            if (user != null && role.equals("host")) {
        %>

        <li class="_nav-item">
            <a href="events?a=create">Create Event</a>
        </li>

        <%
            }
        %>



        <li class="_nav-item">
            <a href="events">Events</a>
        </li>
        <li class="_nav-item">
            <a href="sponsors">Sponsors</a>
        </li>
        <li class="_nav-item">
            <a href="">Service Providers</a>
        </li>
    </ul>
</nav>
