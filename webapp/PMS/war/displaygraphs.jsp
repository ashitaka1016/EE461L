<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.SalaryEmployee" %>
<%@ page import="com.example.pms.CommissionEmployee" %>
<%@ page import="com.example.pms.HourlyEmployee" %>
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
  ArrayList<SalaryEmployee> salary = new ArrayList<SalaryEmployee>();
  ArrayList<HourlyEmployee> hourly = new ArrayList<HourlyEmployee>();
  ArrayList<CommissionEmployee> commission = new ArrayList<CommissionEmployee>();

  for(int i = 0; i < e.getEmployees().size(); i += 1) {
    if(e.getEmployees().get(i) instanceof SalaryEmployee) {
      salary.add((SalaryEmployee)e.getEmployees().get(i));
    } else if(e.getEmployees().get(i) instanceof HourlyEmployee) {
      hourly.add((HourlyEmployee)e.getEmployees().get(i));
    } else {
      commission.add((CommissionEmployee)e.getEmployees().get(i));
    }
  }
 %>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
  google.charts.load('current', { packages: ['corechart', 'bar'] });
  google.charts.setOnLoadCallback(drawBasic);

  function drawBasic() {
    var name = [<% for (int i = 0; i < commission.size(); i++) { %>"<%= commission.get(i).getName() %>"<%= i + 1 < commission.size() ? ",":"" %><% } %>];
    var sales = [<% for (int i = 0; i < commission.size(); i++) { %><%= commission.get(i).getSales() %><%= i + 1 < commission.size() ? ",":"" %><% } %>];
    var length = sales.length;
    var array = [['Name', '']];

    for(i = 0; i < length; i++) {
      array.push([name[i], sales[i]]);
    }

    var data = google.visualization.arrayToDataTable(array);
    

    var options = {
      title: "",
      chartArea: {
        width: '50%'
      },
      hAxis: {
        title: 'Sales (in currency)',
        minValue: 0
      },
      vAxis: {
        title: 'Name'
      },
      legend: { position: "none" }
    };

    var chart = new google.visualization.BarChart(document.getElementById('example2.1'));

    if(length < 0) { chart.draw(data, options); }
  }
</script>

<script type="text/javascript">
  google.charts.load('current', { packages: ['corechart', 'bar'] });
  google.charts.setOnLoadCallback(drawBasic);

  function drawBasic() {
    var name = [<% for (int i = 0; i < hourly.size(); i++) { %>"<%= hourly.get(i).getName() %>"<%= i + 1 < hourly.size() ? ",":"" %><% } %>];
    var hours = [<% for (int i = 0; i < hourly.size(); i++) { %><%= hourly.get(i).getHours() %><%= i + 1 < hourly.size() ? ",":"" %><% } %>];
    var length = hours.length;
    var array = [['Name', 'Hours']];

    for(i = 0; i < length; i++) {
      array.push([name[i], hours[i]]);
    }

    var data = google.visualization.arrayToDataTable(array);
    

    var options = {
      title: "",
      chartArea: {
        width: '50%'
      },
      hAxis: {
        title: 'Hours Worked',
        minValue: 0
      },
      vAxis: {
        title: 'Name'
      },
      legend: { position: "none" }
    };

    var chart = new google.visualization.BarChart(document.getElementById('example2.2'));

    if(length < 0) { chart.draw(data, options); }
  }
</script>

<script type="text/javascript">
  google.charts.load('current', { packages: ['corechart', 'bar'] });
  google.charts.setOnLoadCallback(drawBasic);

  function drawBasic() {
    var name = [<% for (int i = 0; i < salary.size(); i++) { %>"<%= salary.get(i).getName() %>"<%= i + 1 < salary.size() ? ",":"" %><% } %>];
    var salaries = [<% for (int i = 0; i < salary.size(); i++) { %><%= salary.get(i).getSalary() %><%= i + 1 < salary.size() ? ",":"" %><% } %>];
    var length = salaries.length;
    var array = [['Name', 'Salary']];

    for(i = 0; i < length; i++) {
      array.push([name[i], salaries[i]]);
    }

    var data = google.visualization.arrayToDataTable(array);
    

    var options = {
      title: "",
      chartArea: {
        width: '50%'
      },
      hAxis: {
        title: 'Salary (in currency)',
        minValue: 0
      },
      vAxis: {
        title: 'Name'
      },
      legend: { position: "none" }
    };

    var chart = new google.visualization.BarChart(document.getElementById('example2.3'));

    if(length < 0) { chart.draw(data, options); }
  }
</script>

  <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="form-signin-heading">Commission Graphical Comparisons</h2>
    <div id="example2.1" style="height: 250px;"></div>
  </div>

  <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="form-signin-heading">Hourly Graphical Comparisons</h2>
    <div id="example2.2" style="height: 250px;"></div>
  </div>

  <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="form-signin-heading">Salary Graphical Comparisons</h2>
    <div id="example2.3" style="height: 250px;"></div>
  </div>

</body>

</html>
