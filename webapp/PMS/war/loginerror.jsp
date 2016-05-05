<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.googlecode.objectify.*" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Productivity Management Service</title>

        <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="http://getbootstrap.com/examples/jumbotron/jumbotron.css" rel="stylesheet">
        
    </head>

<body>

    <% request.getSession().setAttribute("employer", null); %>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form action="/signup.jsp" class="navbar-form navbar-right">
            <button type="submit" class="btn btn-info">Sign up</button>
          </form>
          <form action="/login" method="get" class="navbar-form navbar-right">
            <div class="form-group">
              <input id="username" name="username" type="text" placeholder="Username" class="form-control">
            </div>
            <div class="form-group">
              <input id="password" name="password" type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
          <p class="navbar-form navbar-right" style="color:red;padding-top:7px">Invalid username or password</p>
        </div>
      </div>
    </nav>

    <div class="jumbotron">
      <div class="container">
        <h1 style="text-align:center">Productivity Management Service</h1>
        <img class="img-responsive" align="center" src="images/shutterstock_73512394.jpg" alt=""/>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-12" style="padding-bottom:50px">
          <h2>About Our Service</h2>
          <p>Small businesses are often forced to commit unnecessary time and energy to manage payroll. Furthermore, without a payroll management service, small businesses cannot analyze company practices or evaluate employee performance. This service provides a free payroll management tool for small businesses. With an easy-to-use payment tool, small businesses will be able to efficiently compensate employees and have a complete record of transactions. Additionally, our application will provide meaningful information for budgetary purposes. By using our application, companies can spend more time on other business operations. </p>
        </div>
      </div>

      <footer>
        <p>&copy; 2016 PMS, Inc.</p>
      </footer>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="http://getbootstrap.com/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>

</html>

