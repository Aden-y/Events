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

<div class="container">

    <div class="mdl-cell mdl-cell--12-col card-lesson mdl-card  mdl-shadow--2dp" >
        <div class="mdl-card__title mdl-color--deep-purple mdl-color-text--white">
            <h4 class="mdl-card__title-text">User Registration Reports</h4>
        </div>
        <div class="mdl-card__supporting-text">
            <div id="chart" ></div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ["User Type", "Number Registered", { role: "style" } ],
            ["Hosts", 10, "red"],
            ["Service Provider", 25, "silver"],
            ["Sponsor", 19.30, "gold"],
            ["Customers", 21.45, "color: #e5e4e2"]
        ]);

        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
            { calc: "stringify",
                sourceColumn: 1,
                type: "string",
                role: "annotation" },
            2]);

        var options = {
            title: "User Statistics",
            width: 600,
            height: 400,
            bar: {groupWidth: "95%"},
            legend: { position: "none" },
        };
        var chart = new google.visualization.ColumnChart(document.getElementById("chart"));
        chart.draw(view, options);
    }
</script>
</html>
