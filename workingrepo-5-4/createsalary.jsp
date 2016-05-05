<<<<<<< Updated upstream
﻿
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
	body {
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #eee;
	}
	
	.form-signin {
	  max-width: 400px;
	  padding: 15px;
	  margin: 0 auto;
	}
	.form-signin .form-signin-heading,
	.form-signin .checkbox {
	  margin-bottom: 10px;
	}
	.form-signin .checkbox {
	  font-weight: normal;
	}
	.form-signin .form-control {
	  position: relative;
	  height: auto;
	  -webkit-box-sizing: border-box;
	     -moz-box-sizing: border-box;
	          box-sizing: border-box;
	  padding: 10px;
	  font-size: 16px;
	}
	.form-signin .form-control:focus {
	  z-index: 2;
	}
	.form-signin input[type=email] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	.form-signin input[type=password] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
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
	    
    <div class="container">

      <form class="form-signin" action="/createsalary" method="post">
        <h2 class="form-signin-heading">Salary Employee</h2>
        <label for="inputEmail" class="sr-only">Salary</label>
        <input name="salary" type="text" id="inputEmail" class="form-control" placeholder="Salary" required autofocus>
        <label for="inputEmail" class="sr-only">Overtime</label>
        <input name="overtime" type="text" id="inputEmail" class="form-control" placeholder="Overtime" required autofocus>
        <label for="inputEmail" class="sr-only">OvertimeRate</label>
        <input name="overtimeRate" type="text" id="inputEmail" class="form-control" placeholder="Overtime Rate (per hour)" required autofocus>
        <label for="inputEmail" class="sr-only">YearsWorked</label>
        <input name="yearsWorked" type="text" id="inputEmail" class="form-control" placeholder="Years Worked" required autofocus>
        <label for="inputEmail" class="sr-only">SickDays</label>
        <input name="sickDays" type="text" id="inputEmail" class="form-control" placeholder="Sick Days" required autofocus>
        <label for="inputEmail" class="sr-only">SickDaysTaken</label>
        <input name="sickDaysTaken" type="text" id="inputEmail" class="form-control" placeholder="Sick Days Taken" required autofocus>
       	<label for="inputEmail" class="sr-only">VacationDays</label>
        <input name="vacationDays" type="text" id="inputEmail" class="form-control" placeholder="Vacation Days" required autofocus>
        <label for="inputEmail" class="sr-only">Bonus</label>
        <input name="bonus" type="text" id="inputEmail" class="form-control" style="margin-bottom:15px" placeholder="Bonus" required autofocus>

        
		<button class="btn btn-lg btn-primary btn-block" type="submit">Create</button>
      </form>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
=======
<!DOCTYPE html>
<html>

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>CreateSalary</title>
<style type="text/css">
.auto-style1 {
	text-align: center;
	font-size: x-large;
}

.wrapper {
    text-align: center;
}

.Create {
    position: absolute;
    top: 50%;
}
</style>

</head>

<body style="height: 451px">

<form action ="dashboard.jsp">
	<div>
		<input height="38" name="Image1" src="images/HomeButton.png" type="image" width="57">
	</div>
</form>

<p class="auto-style1"><strong>Salary Employee</strong></p>

<form action="/createsalary" method="post">

	<table style="width: 100%">
		<tr>
			<td style="width: 432px">Salary: </td>
			<td><input name="salary" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Overtime: </td>
			<td><input name="overtime" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Overtime Rate (per hour): </td>
			<td><input name="overtimeRate" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Years Worked: </td>
			<td><input name="yearsWorked" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Sick Days: </td>
			<td><input name="sickDays" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Sick Days Taken: </td>
			<td><input name="sickDaysTaken" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Vacation Days: </td>
			<td><input name="vacationDays" style="width:100%" type="text" /></td>
		</tr>
		<tr>
			<td style="width: 432px">Bonus: </td>
			<td><input name="bonus" style="width:100%" type="text" /></td>
		</tr>
	</table>

	<div class="wrapper">
		<button name="Create">Create</button>
	</div>

</form>

</body>

</html>
>>>>>>> Stashed changes
