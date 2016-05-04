<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="java.util.ArrayList" %>

<html>

<head>
</head>

<body>

<%  Employer e = (Employer) ObjectifyService.ofy().load().type(Employer.class).id((String)request.getSession().getAttribute("employer")).get();
  int size = e.getEmployees().size();
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
    var length = "<%=size%>";

    dataTable.addColumn({ type: 'string', id: 'Term' });
    dataTable.addColumn({ type: 'string', id: 'Name' });
    dataTable.addColumn({ type: 'date', id: 'Start' });
    dataTable.addColumn({ type: 'date', id: 'End' });

    for(i = 0; i < length; i++) {
      dataTable.addRows([
        [ id[i], name[i], new Date(1789, 3, 30), new Date(1797, 2, 4) ]]);
    }

    chart.draw(dataTable);
  }
</script>

<div id="example2.1" style="height:500px;"></div>

</body>

</html>