﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Productivity Management Service</title>

    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <!--link href="http://getbootstrap.com/examples/dashboard/dashboard.css" rel="stylesheet"-->
    
    <style>
    /*
   * Base structure
   */
  
  /* Move down content because we have a fixed navbar that is 50px tall */
  body {
    padding-top: 50px;
  }
  
  
  /*
   * Global add-ons
   */
  
  .sub-header {
    padding-bottom: 10px;
    border-bottom: 1px solid #eee;
  }
  
  /*
   * Top navigation
   * Hide default border to remove 1px line.
   */
  .navbar-fixed-top {
    border: 0;
  }
  
  /*
   * Sidebar
   */
  
  /* Hide for mobile, show later */
  .sidebar {
    display: none;
  }
  @media (min-width: 768px) {
    .sidebar {
      position: fixed;
      top: 51px;
      bottom: 0;
      left: 0;
      z-index: 1000;
      display: block;
      padding: 20px;
      overflow-x: hidden;
      overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
      background-color: #f5f5f5;
      border-right: 1px solid #eee;
    }
  }
  
  /* Sidebar navigation */
  .nav-sidebar {
    margin-right: -21px; /* 20px padding + 1px border */
    margin-bottom: 20px;
    margin-left: -20px;
  }
  .nav-sidebar > li > a {
    padding-right: 20px;
    padding-left: 20px;
  }
  .nav-sidebar > .active > a,
  .nav-sidebar > .active > a:hover,
  .nav-sidebar > .active > a:focus {
    color: #fff;
    background-color: #428bca;
  }
  
  
  /*
   * Main content
   */
  
  .main {
    padding: 20px;
  }
  @media (min-width: 768px) {
    .main {
      padding-right: 40px;
      padding-left: 40px;
    }
  }
  .main .page-header {
    margin-top: 0;
  }
  
  
  /*
   * Placeholder dashboard ideas
   */
  
  .placeholders {
    margin-bottom: 30px;
    text-align: center;
  }
  .placeholders h4 {
    margin-bottom: 0;
  }
  .placeholder {
    margin-bottom: 20px;
  }
  .placeholder img {
    display: inline-block;
    border-radius: 50%;
  }
    </style>

  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="dashboard.jsp">Home</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="pms.jsp">Log Out</a></li>
          </ul>
        </div>
      </div>
    </nav>

<%  Employer e = (Employer) ObjectifyService.ofy().load().type(Employer.class).id((String)request.getSession().getAttribute("employer")).get();
  int size = e.getEmployees().size();
  SimpleDateFormat dateFormatter = new SimpleDateFormat("EEEE, MMMM d, yyyy");
  Date date = new Date();
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
    var dates = [<%  
          for (int i = 0; i < e.getEmployees().size(); i++) { 
            int after = -1;
            Employee e1 = e.getEmployees().get(i);
            for(int j = e1.getDates().size() - 1; j >= 0; j--) {
              if(date.compareTo(e1.getDates().get(j)) >= 0) {
                if(j == (e1.getDates().size() - 1)){ break; }
                after = j;
                break;
              }
              if(j == 0){ after = 0;}
            }
          if(after > -1){ %>  
            "<%= dateFormatter.format(e.getEmployees().get(i).getDates().get(after)) %>"
          <% } else{ %> "" <% } %>
          <%= i + 1 < e.getEmployees().size() ? ",":"" %><% } %>
    ];
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

    if(length != 0) { chart.draw(dataTable); }
  }
</script>

  <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="form-signin-heading">Employee Timeline</h2>
    <div id="example2.1" style="height: 500px;"></div>
  </div>

</body>

</html>
