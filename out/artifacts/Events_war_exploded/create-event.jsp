<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/9/2020
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
    <div class="container">
        <%
            String err = (String) request.getAttribute("err");
        %>
        <div class="mx-auto _form mt-3">
            <div class="_form-header">
                <span>Create Event</span>
            </div>
            <%
                if(err != null) {
            %>
            <div class="alert alert-danger text-center">
                <%=err%>
            </div>
            <%
                }
            %>

            <form method="post" action="events">
                <div class="input-field ">
                    <input id="eventname"  name="eventname" type="text" class="validate" required>
                    <label for="eventname">Event Name</label>
                </div>

                <div class="input-field ">
                    <input id="eventtype"  name="eventtype" type="text" class="validate" required>
                    <label for="eventtype">Event Type</label>
                </div>

                <div class="input-field ">
                    <textarea class="materialize-textarea" id="description" name="description" required>

                </textarea>
                    <label for="description">Description</label>
                </div>

                <div class="input-field ">
                    <input  id="duration" name="duration" type="number" class="validate" required>
                    <label for="duration">Event Duration</label>
                </div>

                <div class="input-field ">

                    <input type="date"  class="validate" id="eventdate" name="eventdate" required>
                    <label for="eventdate">Event Date</label>
                </div>


                <div class="input-field ">
                    <input  type="text" class="validate" id="eventlocation" name="eventlocation"  required>
                    <label for="eventlocation">Event Location</label>
                </div>

                <div class="input-field">
                    <input type="number" class="validate" id="entryfee" name="entryfee" required min="0">
                    <label for="entryfee">Entry Fee</label>
                </div>
                    <input name="action" value="Create" type="text" hidden>
                <button type="submit" class="btn waves-effect waves-light light-blue lighten-1">
                    Create
                </button>
            </form>
        </div>
    </div>
</body>
</html>
