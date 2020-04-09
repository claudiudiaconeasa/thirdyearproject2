<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 27/11/2019
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>

<%--Sources:
 https://www.w3schools.com/ ,
 https://www.gettemplate.com/info/magister/
 https://getbootstrap.com/
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-163250782-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-163250782-1');
    </script>

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


<body class="theme-invert">

<%--Navigator for each separate section--%>
    <nav class="mainmenu">
        <div class="container">
            <div class = "dropdown">
                <button type = "button" class = "navbar-toggle" data-toggle="dropdown">
                    <span class="icon-bar">
                        <span class="icon-bar">
                            <span class ="icon-bar"></span>
                        </span>
                    </span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                    <li>
                        <a href="#head" class="active">Home</a>
                    </li>
                    <li>
                        <a href="#contact">TimeMap</a>
                    </li>
                    <li>
                        <a href="#themes">Generate</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<%--Main description on HomePage - Home section--%>
<section class ="section" id="head">
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
                        <button name="more" value="More" class="btn btn-primary btn-lg"  data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">About</button>

                    </form>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>


    <jsp:include page="timemap.jsp"></jsp:include>
    <jsp:include page="generate.jsp"></jsp:include>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="template/js/modernizr.custom.72241.js"></script>

    <!-- Magister bootstrap template used -->
    <script src="template/js/magister.js"></script>
</body>
</html>
