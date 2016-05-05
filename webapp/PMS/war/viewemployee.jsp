<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.example.pms.Employee" %>
<%@ page import="com.example.pms.SalaryEmployee" %>
<%@ page import="com.example.pms.HourlyEmployee" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Productivity Management Service</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap.min.css" rel="stylesheet">

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
          <form class="navbar-brand" action="dashboard.jsp">Home</form>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="pms.jsp">Log Out</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="form-signin-heading">View All Employees</h2>
		  <div class="table-responsive">
            <table class="table table-striped" align="center" style="width:50%">
              <thead>
              	<tr style="background-color:#fff">
              		<td><strong>Name:</strong></td>
              		<td><strong>ID:</strong></td>
              	</tr>
              </thead>
              <tbody>
					<%  
					ObjectifyService.register(Employer.class);
					Employer employer = (Employer)ObjectifyService.ofy().load().type(Employer.class).id((String)request.getSession().getAttribute("employer")).get();
					ArrayList<Employee> employees = employer.getEmployees();
					int size = employees.size();
					for(int i = 0; i < size; i++) {
					%>
					<tr>
						<td><% out.print(employees.get(i).getName()); %></td>
						<td><% out.print(employees.get(i).getID()); %></td>
					</tr> <%
					}
					%>
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