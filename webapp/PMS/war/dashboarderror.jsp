﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="http://getbootstrap.com/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

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
          <form action="/create" method="get" class="navbar-form navbar-right">
            <input name="EmployeeSearch" type="text" class="form-control" placeholder="Enter Employee ID...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="create.jsp">Create Employee</a></li>
            <li><a href="viewemployee.jsp">View All Employees</a></li>
            <li style="padding-bottom:20px"><a href="testtimeline.jsp">View Timeline</a></li>
          </ul>
          <ul class="nav nav-sidebar">
          	<li style="padding-left:20px;padding-right:20px;padding-bottom:10px"><strong>Current Employee</strong></li>
            <li><% if(request.getSession().getAttribute("currentEmployee") instanceof HourlyEmployee) {
				%> <a href="edithourlyemployee.jsp">Edit Information</a> <%
			} else if(request.getSession().getAttribute("currentEmployee") instanceof SalaryEmployee) {
				%> <a href="editsalaryemployee.jsp">Edit Information</a> <%
			} else if(request.getSession().getAttribute("currentEmployee") != null) {
				%> <a href="editcommissionemployee.jsp">Edit Information</a> <%
			} %></li>
            <li><% if(request.getSession().getAttribute("currentEmployee") != null) { %>
            	<a href="editpayroll.jsp">Edit Payroll</a>
            	<% } %>
            </li>
            <li><% if(request.getSession().getAttribute("currentEmployee") instanceof HourlyEmployee) {
				%> <a href="displayhourlysummary.jsp">Display Summary</a> <%
			} else if(request.getSession().getAttribute("currentEmployee") instanceof SalaryEmployee) {
				%> <a href="displaysalarysummary.jsp">Display Summary</a> <%
			} else if(request.getSession().getAttribute("currentEmployee") != null) {
				%> <a href="displaycommissionsummary.jsp">Display Summary</a> <%
			} %></li>
          </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <% String name = (String) request.getSession().getAttribute("employerName"); 
		if((name == null) || (name.equals(""))) {
		%>
          <h1 class="page-header">Welcome Back!</h1>
        <% } else { %>
          <h1 class="page-header">Welcome back, <% out.print(name); %>!</h1>
		<% } %>
		  <div class="table-responsive">
            <table class="table table-striped" align="center" style="width:50%">
              <thead>
              	<tr style="background-color:#fff">
              		<td><strong>Currently Selected Employee <font color="red">Invalid ID</font></strong></td>
              	</tr>
              </thead>
              <tbody>
                <tr style="background-color:#f9f9f9">
                  <td>Name:</td>
                  <td style="text-align:right"><%if(request.getSession().getAttribute("currentEmployee") != null) { out.print(((Employee)request.getSession().getAttribute("currentEmployee")).getName()); }%></td>
                </tr>
                <tr style="background-color:#fff">
                  <td>ID:</td>
                  <td style="text-align:right"><%if(request.getSession().getAttribute("currentEmployee") != null) { out.print(((Employee)request.getSession().getAttribute("currentEmployee")).getID()); }%></td>
                </tr>
                <tr style="background-color:#f9f9f9">
                  <td>Last Paid On:</td>
                  <td></td>
                </tr>
                <tr style="background-color:#fff">
                  <td>Upcoming Payment Date:</td>
                  <td></td>
                </tr>
               </tbody>
            </table>
            <%if(request.getSession().getAttribute("currentEmployee") != null) { %>
            <form action="/remove" method="post" style="max-width: 330px;padding: 15px;margin: 0 auto;">
            	<button class="btn btn-lg btn-primary btn-block" type="submit">Remove Employee</button>
            </form>
            <% } %>
          </div>
        </div>
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