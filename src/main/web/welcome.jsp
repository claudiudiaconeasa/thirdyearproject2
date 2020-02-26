<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 27/11/2019
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
                        <a href="#themes">History Corpus</a>
                    </li>
                    <li>
                        <a href="#about">Contact</a>
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
<%--                <h1 class="title">Engaging History Tools</h1>--%>
<%--                <h2 class ="subtitle"> Aimed at all students in order to find out more about History Facts inside their academic institution!</h2>--%>
<%--                <h3 class="tagline">--%>
<%--                    Start your journey by learning more about the past your University has been through and all great events in your surrounding City!--%>
<%--                </h3>--%>

<%--                <div class="card w-90" style ="text-align: center">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title">About</h5>--%>
<%--                        <p class="card-text">Find out what all this project is about in the following section</p>--%>
<%--                        <form action ="About" method ="post">--%>
<%--                            <button name="more" value="More" class="btn btn-default">More</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="jumbotron" style="background-color:#007E33; position:relative; top:100px;">
                    <h1 class="display-4">Engaging History Tools</h1>
                    <p class="lead">Aimed at all students in order to find out more about History Facts inside their academic institution!</p>
                    <hr class="my-4">
                    <p>Start your journey by learning more about the past your University has been through and all great events in your surrounding City!</p>
                    <p class="lead">
<%--                        <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>--%>
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
    <jsp:include page="historycorpus.jsp"></jsp:include>
    <jsp:include page="contact.jsp"></jsp:include>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="template/js/modernizr.custom.72241.js"></script>

    <!-- Magister bootstrap template used -->
    <script src="template/js/magister.js"></script>
</body>
</html>
