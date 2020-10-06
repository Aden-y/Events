<%@ page import="models.Customer" %>
<%@ page import="models.Host" %>
<%@ page import="models.ServiceProvider" %>
<%@ page import="models.Sponsor" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/18/2020
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
</body>
<div class="container">

    <div class="mx-auto _form mt-3" >
        <div class="_form-header"><span>Manage Profile</span></div>
    <%
        Object user = session.getAttribute("user");
        if(user instanceof Customer) {
            Customer customer = (Customer) user;
    %>
        <form method="post" action="profile">
            <div class="row">
                <div class="col-6">
                    <div class="input-field">
                        <input name="firstname" value="<%=customer.getFirstname()%>"  id="firstname" type="text" class="validate" required>
                        <label for="firstname">First Name</label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="input-field">
                        <input name="lastname" value="<%=customer.getLastname()%>"   id="lastname" type="text" class="validate" required>
                        <label for="lastname">Last Name</label>
                    </div>
                </div>
            </div>
            <div>
                <div class="input-field">
                    <input name="nationalid" value="<%=customer.getNationalid()%>"  id="nationalid" type="number" min="0" class="validate" required>
                    <label for="nationalid">National ID</label>
                </div>
            </div>
            <div>
                <div class="input-field">
                    <input name="phonenumber" value="<%=customer.getPhonenumber()%>"   id="phonenumber" type="tel" class="validate" required>
                    <label for="phonenumber">Phone Number</label>
                </div>
            </div>
            <div>
                <div class="input-field">
                    <input name="email" value="<%=customer.getEmail()%>"   id="email" type="email" class="validate" required>
                    <label for="email">Email Address</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input name="username" value="<%=customer.getUsername()%>"   id="username" type="text" class="validate" required>
                    <label for="username">Username</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input name="password"  id="password" type="password" class="validate" required>
                    <label for="password">Current Password</label>
                </div>
                <div class="input-field">
                    <input type="password" id="new_password" class="_input" name="new_password">
                    <label for="new_password">Change Password (optional)</label>
                </div>
            </div>

            <div>
                <%--                  <input type="submit" class="_action-btn" name="action" value="Register">--%>
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit" name="action">Update Profile
                    <i class="material-icons right">send</i>
                </button>
            </div>

        </form>

    <%
        } else if (user instanceof Host) {
            Host host = (Host) user;
    %>
        <form method="post" action="profile">
            <div>
                <input type="text" value="<%=host.getHostname()%>" class="_input" name="hostname" placeholder="Host Name" required>
                <p id="hostname" ></p>
            </div>
            <div>
                <input type="text" value="<%=host.getKrapin()%>" class="_input" name="krapin" placeholder="KRA Pin">
                <p id="krapin"></p>
            </div>
            <div>
                <input type="tel" class="_input" value="<%=host.getPhonenumber()%>"  name="phonenumber" placeholder="Phone Number">
                <p id="phonenumber"></p>
            </div>
            <div>
                <input type="email"  class="_input" value="<%=host.getHostemail()%>"  name="email" placeholder="Email Address">
                <p id="email"></p>
            </div>

            <div>
                <input type="text" value="<%=host.getUsername()%>"  class="_input" name="username" placeholder="Username">
                <p id="username"></p>
            </div>

            <div>
                <input type="password" class="_input" name="password" placeholder="Enter Current Password">
                <p id="password"></p>
            </div>

            <div>
                <input type="password" class="_input" name="new_password" placeholder="Change Password (optional)">
            </div>

            <div>
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit">
                    Update Profile
                </button>
            </div>
        </form>
    <%
        } else  if (user instanceof ServiceProvider) {
            ServiceProvider serviceProvider = (ServiceProvider)user;
    %>
        <form method="post" action="profile">
            <div>
                <input type="text" value="<%=serviceProvider.getCompanyname()%>" class="_input" name="companyname" placeholder="Company Name" required>
                <p id="companyname"></p>
            </div>
<%--            <div>--%>
<%--                <input type="text" min="0"--%>

<%--                       class="_input" name="krapin" placeholder="KRA Pin">--%>
<%--                <p id="krapin"></p>--%>
<%--            </div>--%>
            <div class="input-field">
                <input type="tel" class="_input"
                       value="<%=serviceProvider.getPhonenumber()%>"
                       name="phonenumber" id="phonenumber" >
                <label for="phonenumber">Phone Number</label>
            </div>
            <div class="input-field">
                <input type="email"
                       value="<%=serviceProvider.getEmail()%>"
                       class="_input" name="email" id="email">
                <label for="email">Email Address</label>
            </div>
            <div class="input-field">
                <input type="text"
                       value="<%=serviceProvider.getLocation()%>"
                       name="location" id="location">
                <label for="location">Located At</label>
            </div>
            <div class="input-field">
                <textarea class="materialize-textarea" value="<%=serviceProvider.getCompanyname()%>"
                          name="description"  id="description">
                        <%=serviceProvider.getDescription()%>
                </textarea>
                <label for="description">Description of service offered.</label>
            </div>

            <div class="input-field">
                <input type="text" id="username" name="username" value="<%=serviceProvider.getUsername()%>">
                <label for="username">Username</label>
            </div>

            <div>
                <div class="input-field">
                    <input name="password"  id="password" type="password" class="validate" required>
                    <label for="password">Current Password</label>
                </div>
                <div class="input-field">
                    <input type="password" id="new_password" class="_input" name="new_password">
                    <label for="new_password">Change Password (optional)</label>
                </div>
            </div>

            <div>
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit">
                    Update Profile
                </button>
            </div>
        </form>

    <%
    } else  if (user instanceof Sponsor) {
            Sponsor sponsor = (Sponsor) user;

    %>
        <form method="post" action="profile">
            <div>
                <div class="input-field">
                    <input id="sponsorname" value="<%=sponsor.getSponsorname()%>" type="text" name="sponsorname"  class="validate" required>
                    <label for="sponsorname">Sponsor Name</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input id="location" value="<%=sponsor.getLocation()%>"  type="text" name="location"  class="validate" required>
                    <label for="location">Location</label>
                </div>
            </div>

            <div>

                <div class="input-field">
                    <input id="krapin" type="text"  value="<%=sponsor.getKrapin()%>"  name="krapin"  class="validate" required>
                    <label for="krapin">KRA Pin</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input id="email" type="email" value="<%=sponsor.getEmail()%>" name="email"  class="validate" required>
                    <label for="email">Email Address</label>
                </div>
            </div>
            <div>
                <textarea name="requirements" id="requirements" value="<%=sponsor.getSponsorshiprequirements()%>"
                          class="materialize-textarea"><%=sponsor.getSponsorshiprequirements().trim()%></textarea>
                <label>Sponsorship Requirements</label>
            </div>

            <div>
                <div class="input-field">
                    <input id="username" value="<%=sponsor.getUsername()%>" type="text" name="username"  class="validate" required>
                    <label for="username">Username</label>
                </div>
            </div>


            <div>
                <div class="input-field">
                    <input name="password"  id="password" type="password" class="validate" required>
                    <label for="password">Current Password</label>
                </div>
                <div class="input-field">
                    <input type="password" id="new_password" class="_input" name="new_password">
                    <label for="new_password">Change Password (optional)</label>
                </div>
            </div>

            <div>
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit" name="action" value="Register">Update Profile
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form>

    <%
        } else {
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
    %>
</div>
</div>
</html>
