<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 17/04/2020
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">

    <%--    <meta name="description" content="">--%>
    <%--    <meta name="author" content="Sergey Pozhilov (GetTemplate.com)">--%>

    <title>Engaging History Tools for Students!</title>
    <%--BootStrap from Magister--%>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <%--Bootstrap fonts--%>
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>

    <%-- Css--%>
    <link rel="stylesheet" href="template/css/magister.css">
    <link rel="stylesheet" href="template/css/mycss.css">
</head>
<body>


<section class ="section" id="contact">
    <div class ="container">
        <div class="row">
            <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">
                <div class="jumbotron" style="background-color:#007E33; position:relative; top:50px;">
                    <h1 class="display-4">Engaging History Tools</h1>
                    <p class="lead">Aimed at all students in order to find out more about History Facts!</p>
                    <hr class="my-4">
                    <p>Start your journey by learning more about the past greatest events in computing, what your University has been through and all great events in your surrounding City!</p>
                    <p class="lead">
                    <form action ="About" method ="post">
                        <button name="more" id="about" value="More" class="btn btn-primary btn-lg"  data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">About</button>

                    </form>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
