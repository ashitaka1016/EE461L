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
	          <a class="navbar-brand" href="dashboard.jsp">Home</a>
	        </div>
	        <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav navbar-right">
	            <li><a href="pms.jsp">Log Out</a></li>
	          </ul>
	        </div>
	      </div>
	 </nav>
	    
    <div class="container">

      <form class="form-signin" action="/create" method="post">
        <h2 class="form-signin-heading">Create New Employee</h2>
        <label for="inputEmail" class="sr-only">Name</label>
        <input name="name" type="text" id="inputEmail" class="form-control" placeholder="Name" required autofocus>
        <label for="inputEmail" class="sr-only">ID</label>
        <input name="id" type="text" id="inputEmail" class="form-control" placeholder="ID" required autofocus>
        <label for="inputEmail" class="sr-only">StartDate</label>
        <input name="startDate" type="text" id="inputEmail" class="form-control" placeholder="Start Date (YYYY/MM/DD)" required autofocus>
        <label for="inputPassword" class="sr-only">Type</label>
        <select name="type" class="form-control" style="margin-bottom:15px">
					<option value="Salary">Salary</option>
					<option value="Hourly">Hourly</option>
					<option value="Commission">Commission</option>
				</select>
		<button class="btn btn-lg btn-primary btn-block" type="submit" style="margin-bottom:15px">Create</button>
		<div><p><font color="red">Invalid Field Entry</font></p></div>
      </form>	
    </div> <!-- /container -->

	

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="ie10-viewport-bug-workaround.js"></script>
  </body>
</html>