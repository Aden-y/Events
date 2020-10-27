<%@ page import="models.Event" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/9/2020
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="inc/header.jsp" />
<body>
<jsp:include page="inc/nav.jsp" />
    <div class="container">
        <h4>Events</h4>
        <div>
            <p>Filter Events by status</p>
            <form action="events" method="get">
                <select id="StatusFilter" name="fs" class="browser-default">
                    <option value=""  >All </option>
                    <option value="u">Upcoming</option>
                    <option value="l">Live</option>
                    <option value="p">Past</option>
                </select>
                <input type="submit" name="f" value="1" id="Filter" hidden>
            </form>
        </div>
        <%
            List<Event> events = (List<Event>) request.getAttribute("events");
            if(events == null){
                response.sendRedirect("events");
            }else{
               for(Event e: events) {
        %>

        <div class="event-display card">
            <div>
                <%
                    if (e.status().equals("Live")) {
                %>
                <span class="new badge red " data-badge-caption="<%=e.status()%> event"></span>
                <%
                    }else if (e.status().equals("Past")) {
                %>
                <span class="new badge grey" data-badge-caption="<%=e.status()%> event"></span>
                <%
                    }else{
                %>
                <span class="new badge " data-badge-caption="<%=e.status()%> event"></span>
                <%
                    }
                %>
                <h6><%=e.getEventname()%></h6>
                <p class="event-type"><%=e.getEventtype()%></p>
                <p class="description"><%=e.getDescription()%></p>
                <p class="event-bottom">
                    <span><i class="fa fa-user"></i> &nbsp; <%=e.getHostName()%></span>  |
                    <span><i class="fa fa-map-marker"></i> &nbsp; <%=e.getEventlocation()%></span> |
                    <span><i class="fa fa-calendar"></i> &nbsp; <%=e.getEventdate()%></span>
                </p>
                    <%
                        if(e.getEvententryfee() <= 0) {
                    %>
<%--                        <button data-target="modal1" class="btn modal-trigger">Modal</button>--%>
                        <button  class="btn waves-effect waves-light light-blue lighten-1">Free Entry&nbsp;<i class="fas fa-smile emoji"></i></button>
                    <%
                    }else{
                    %>
                        <button  class="btn waves-effect waves-light light-blue lighten-1">
                            <a class="btn-link" href="TicketBookingController?event=<%=e.getId()%>">Book Ticket >> Ksh.<%=e.getEvententryfee()%></a>
                        </button>
                    <%
                        }
                    %>
                        <button onclick="displayModal('<%=e.getEventhost()%>')" class="btn waves-effect waves-light light-blue lighten-1" >Contact Host</button>

            </div>
        </div>
        <%
                }
            }
        %>
    </div>

    <!-- Modal Structure -->
    <button id="modalDisplay" style="display: none" data-target="modal1" class="btn modal-trigger">Modal</button>
    <div id="modal1" class="modal">
       <form action="messages" method="post" onsubmit="return sendMessage()">
           <div class="modal-content">
               <h6>Contact  Event Host</h6>
               <div>
                   <input id="hostIdInp" name="hostId" hidden >
               </div>
               <div class="input-field">
                   <input id="name" name="name" type="text" class="validate" required>
                   <label for="name">Full Name</label>
               </div>

               <div class="input-field">
                   <input id="email" name="email" type="email" class="validate" required>
                   <label for="email">Email Address</label>
               </div>
               <div class="input-field">
                   <textarea name="message" id="message" class="materialize-textarea validate" required></textarea>
                   <label for="message">Message</label>
               </div>
           </div>
           <div class="modal-footer">
               <button  class="modal-close waves-effect waves-green btn-flat" type="button">Cancel</button>
               <button class="btn waves-effect waves-light light-blue lighten-1" type="submit" name="action">Send
                   <i class="material-icons right">send</i>
               </button>
           </div>
       </form>
    </div>


</body>
<script>
    $(document).ready(function(){
        $('select').formSelect();
    });
    $(document).ready(function(){
        $('.modal').modal();
    });

    function displayModal(host) {
        document.getElementById('modalDisplay').click();
        document.getElementById('hostIdInp').value = host;
    }
    
    function sendMessage() {
        var name = document.getElementById('name').value.trim();
        if(name == '' ) {
            alert('Name is required');
            return false;
        }
        var email = document.getElementById('email').value.trim();
        if(email == '' ) {
            alert('Email can not be empty');
            return  false;
        }
        var message = document.getElementById('message').value.trim();
        if(message == '') {
            alert('Message is required');
            return false;
        }
        return true;
    }
    
    $('#StatusFilter').change(function () {
        document.getElementById("Filter").click();
    })
</script>
</html>
