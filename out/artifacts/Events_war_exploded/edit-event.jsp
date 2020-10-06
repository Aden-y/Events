<%@ page import="models.Event" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/10/2020
  Time: 8:04 PM
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
        Event event = (Event) request.getAttribute("event");
    %>
    <div class="mx-auto _form mt-3">
        <div class="_form-header">
            <span>Update Event</span>
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

        <form method="post" action="edit-event">
            <div class="input-field ">
                <input id="eventname" value="<%=event.getEventname()%>" name="eventname" type="text" class="validate" required>
                <label for="eventname">Event Name</label>
            </div>

            <div class="input-field ">
                <input id="eventtype" value="<%=event.getEventtype()%>" name="eventtype" type="text" class="validate" required>
                <label for="eventtype">Event Type</label>
            </div>

            <div class="input-field ">
                <textarea value="<%=event.getDescription()%>" class="materialize-textarea" id="description" name="description" required>
                    <%=event.getDescription()%>
                </textarea>
                <label for="description">Description</label>
            </div>

            <div class="input-field ">
                <input value="<%=event.getDuration()%>" id="duration" name="duration" type="number" class="validate" required>
                <label for="duration">Event Duration</label>
            </div>

            <div class="input-field ">

                <input type="date" value="<%=event.getEventdate()%>" class="validate" id="eventdate" name="eventdate" required>
                <label for="eventdate">Event Date</label>
            </div>


            <div class="input-field ">
                <input value="<%=event.getEventlocation()%>" type="text" class="validate" id="eventlocation" name="eventlocation"  required>
                <label for="eventlocation">Event Location</label>
            </div>

            <div class="input-field">
                <input type="number" value="<%=event.getEvententryfee()%>" class="validate" id="entryfee" name="entryfee" required min="0">
                <label for="entryfee">Entry Fee</label>
            </div>

            <div>
                <button type="submit" class="btn waves-effect waves-light light-blue lighten-1">
                    Update
                </button>
            </div>

        </form>
    </div>
</div>
</body>

