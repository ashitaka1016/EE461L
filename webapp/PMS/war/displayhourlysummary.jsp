<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.pms.Employer" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.HourlyEmployee" %>

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
    <link href="http://getbootstrap.com/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <!--link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet"-->
    <link href="http://getbootstrap.com/examples/dashboard/dashboard.css" rel="stylesheet">
    
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

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="form-signin-heading">Summary for Hourly Employee</h2>
		<div class="table-responsive">
		<%	
		HourlyEmployee e = (HourlyEmployee)request.getSession().getAttribute("currentEmployee");
		%>
            <table class="table table-striped">
              <tbody>
				<tr>
					<td>Name: </td>
					<td><% out.print(e.getName()); %></td>
				</tr>
				<tr>
					<td>ID: </td>
					<td><% out.print(e.getID()); %></td>
				</tr>
				<tr>
					<td>Expected Hours: </td>
					<td><% out.print(e.getExpectedHours()); %></td>
				</tr>
				<tr>
					<td>Hours Worked: </td>
					<td><% out.print(e.getHours()); %></td>
				</tr>
				<tr>
					<td>Pay Rate (per hour): </td>
					<td><% out.print(e.getPayRate()); %></td>
				</tr>
				<tr>
					<td>Years Worked: </td>
					<td><% out.print(e.getYearsWorked()); %></td>
				</tr>
				<tr>
					<td>Sick Days: </td>
					<td><% out.print(e.getSickDays()); %></td>
				</tr>
				<tr>
					<td>Bonus: </td>
					<td><% out.print(e.getBonus()); %></td>
				</tr>
				<tr>
					<td>Total Compensation: </td>
					<td><% out.print(e.calcCompensation()); %></td>
				</tr>
				<tr>
					<td><strong>Rating: </strong> </td>
					<td><font color="red"><strong><% 
					int rating = e.analyzeProductivity(e.calcContribution());
					switch(rating){
						case 1: out.print("F"); break;
						case 2: out.print("D"); break;
						case 3: out.print("C"); break;
						case 4: out.print("B"); break;
						case 5: out.print("A"); break;
					}
					%> </strong></font></td>
				</tr>

           	  </tbody>
            </table>
          </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="http://getbootstrap.com/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="bootstrap.min.js"></script>
  </body>
</html>