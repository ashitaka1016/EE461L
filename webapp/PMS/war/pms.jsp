<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.googlecode.objectify.*" %>

<html>
    <head>
        <title>Productivity Management Service</title>
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,800,700,900' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
        
        <link href="stylesheets/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div id="top" class="container">
        <div class="row" style="margin-top:15px">
            <div class="col-md-3 pull-right" style="text-align:right">
                <form action="/login" method="get">
                    Username: <input id="username" name="username" class="input_text" type="text" />
                    Password: <input id="password" name="password" class="input_text" type="password" />
                    <input type="submit" value="Login">
                </form>
            </div>
        </div>
        <div class="row" style="margin-top:15px">
            <div class="col-md-3 pull-right" style="text-align:right">
                <p>New User? <a class="signin-link" href="/signup.jsp">Sign Up</a></p>
            </div>
        </div>
          <div class="row">
            <div class="col-md-12 logo" align="center">
                <div class="content-logo" align="center"><img src="images/shutterstock_73512394.jpg" alt="" style="width:1000px;height:500px;"/></div>
            </div>
            <div class="col-md-12">
               <div><h1 style="text-align:center">Productivity Management Service</h1></div>
            </div>
            <div class="col-md-10 col-md-offset-1">
                <div class="box-startup" style="height:250px">
                    <h2><a href="http://accordionhealth.com">About Us</a></h2>
                    <div class="row">
                      <div class="col-md-12">
                        <textarea style="height:150px;width:100%;border-color:#d0d0d0">
                            Small businesses are often forced to commit unnecessary time and energy to manage payroll.
                            Furthermore, without a payroll management service, small businesses cannot analyze company practices or evaluate employee performance.
                            This service provides a free payroll management tool for small businesses.
                            With an easy-to-use payment tool, small businesses will be able to efficiently compensate employees and have a complete record of transactions.
                            Additionally, our application will provide meaningful information for budgetary purposes.
                            By using our application, companies can spend more time on other business operations.
                        </textarea>
                      </div>
                    </div>
                </div>
            </div>
          </div>
    </div>

</body>
</html>

