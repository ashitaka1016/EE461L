<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        
            <div class="col-md-12">
               <div><h1 style="text-align:center">Sign Up</h1></div>
            </div>

            <div class="">
                <form action="/signup" method="post">
                  Name: <input id="name" name="name" class="input_text" type="text" />
                  Username: <input id="username" name="username" class="input_text" type="text" />
                  Password: <input id="password" name="password" class="input_text" type="password" />
                  <input type="submit" value="Create New Account">
                </form>
    </div>

</body>
</html>

