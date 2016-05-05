<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>

<head>
</head>

<body>

<%  Employer e = (Employer) ObjectifyService.ofy().load().type(Employer.class).id((String)request.getSession().getAttribute("employer")).get();
  int size = e.getEmployees().size();
  SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEE, MMMM d, yyyy");
 %>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
  google.charts.load("current", {packages:["timeline"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var container = document.getElementById('example2.1');
    var chart = new google.visualization.Timeline(container);
    var dataTable = new google.visualization.DataTable();
    var id = [<% for (int i = 0; i < e.getEmployees().size(); i++) { %>"<%= e.getEmployees().get(i).getID() %>"<%= i + 1 < e.getEmployees().size() ? ",":"" %><% } %>];
    var name = [<% for (int i = 0; i < e.getEmployees().size(); i++) { %>"<%= e.getEmployees().get(i).getName() %>"<%= i + 1 < e.getEmployees().size() ? ",":"" %><% } %>];
    var startDates = [<% for (int i = 0; i < e.getEmployees().size(); i++) { %>"<%= e.getEmployees().get(i).getStartDate() %>"<%= i + 1 < e.getEmployees().size() ? ",":"" %><% } %>];
    var dates = [<% for (int i = 0; i < e.getEmployees().size(); i++) { %>"<%= dateFormatter.format(e.getEmployees().get(i).getDates().get(0)) %>"<%= i + 1 < e.getEmployees().size() ? ",":"" %><% } %>];
    var length = "<%=size%>";
    var sillyvar = "Upcoming Payment: ";

    dataTable.addColumn({ type: 'string', id: 'ID' });
    dataTable.addColumn({ type: 'string', id: 'Name' });
    dataTable.addColumn({ type: 'string', role: 'tooltip' });
    dataTable.addColumn({ type: 'date', id: 'Start' });
    dataTable.addColumn({ type: 'date', id: 'End' });

    for(i = 0; i < length; i++) {
      dataTable.addRows([
        [ id[i], name[i], sillyvar.concat(dates[i]) , new Date(startDates[i]), new Date() ]]);
    }

    chart.draw(dataTable);
  }
</script>

<div id="example2.1" style="height:500px;"></div>

</body>

</html>