<%@ page import="models.Customer" %>
<%@ page import="models.Event" %><%--
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
<jsp:include page="inc/nav.jsp" />
<div class="container">
    <%
        Event event = null;
        Customer customer = null;
        try{
             customer = (Customer) session.getAttribute("user");
             try {
                 event = (Event) request.getAttribute("event");
             }catch (Exception e) {
                 response.sendRedirect("events.jsp");
             }

        }catch (Exception e) {
            session.invalidate();
            response.sendRedirect("login.jsp?u=c");
        }
        String err = (String) request.getAttribute("err");
    %>
    <div class="mx-auto _form mt-3">
        <div class="_form-header">
            <span>Book Ticket(s)</span>
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

        <form method="post" action="TicketBookingController">
            <div class="input-field">
                <input id="event" type="text" name="event" value="<%=event.getId()%>" hidden>
                <input id="eventName" name="count" type="text" disabled value="<%=event.getEventname()%>" class="validate" required>
                <label for="count">Event Name</label>
            </div>
            <div class="input-field">
                <input id="count" name="count" type="number" min="1" value="1" class="validate" required>
                <label for="count">Number of Tickets</label>
            </div>
            <div>
                <div class="input-field">
                    <input id="number" name="number" type="tel" class="validate" required value="<%=customer.getPhonenumber()%>">
                    <label for="number">Payment Number</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input id="entryFee" name="entryFee" type="text" disabled value="<%=event.getEvententryfee()%>">
                    <label for="entryFee">Entry Fee</label>
                </div>
            </div>

            <div>
                <div class="input-field">
                    <input id="amount" name="amount" type="text"  disabled value="Ksh. <%=event.getEvententryfee()%>">
                    <label for="amount">Total Amount</label>
                </div>
            </div>

            <div>
                <button class="btn waves-effect waves-light light-blue lighten-1" type="submit" name="action">Book
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function (e) {
        $('select').formSelect();
    });

    $("#count").keydown(function (e) {
        const count =   document.getElementById("count").value;
        console.log(count)
        const entryFee = document.getElementById("entryFee").value;
        console.log(entryFee)
        const amount = count * entryFee;
        document.getElementById("amount").value = amount;

    })

    $("#count").keyup(function (e) {
        const count =   document.getElementById("count").value;
        const entryFee = document.getElementById("entryFee").value;
        const amount = count * entryFee;
        document.getElementById("amount").value = amount;
    })
</script>
</body>
</html>
