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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Sergey Pozhilov (GetTemplate.com)">

    <title>Engaging History Tools for Students!</title>
    <%--BootStrap--%>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="template/css/magister.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
</head>

<body class="theme-invert">
    <nav class="mainmenu">
        <div class="container">
            <div class = "dropdown">
                <button type = "button" class = "navbar-toggle" data-toggle="dropdown">
                    <span class="icon-bar">
                        <span class="icon-bar">
                            <span class ="icon-bar">
                            </span>
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
                        <a href="#about">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<section class ="section" id="head">
    <div class ="container">
        <div class="row">
            <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">
                <h1 class="title">Engaging History Tools</h1>
                <h2 class ="subtitle">  This is aimed at all students to find out more about the history of their institution!</h2>
                <h3 class="tagline">
                    Start your journey to learn more about your academic institution and all great events in your surrounding City
                </h3>

            </div>
        </div>
    </div>
</section>

    <jsp:include page="about.jsp"></jsp:include>
    <jsp:include page="timemap.jsp"></jsp:include>
    <jsp:include page="historycorpus.jsp"></jsp:include>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="template/js/modernizr.custom.72241.js"></script>
    <!-- Custom template scripts -->
    <script src="template/js/magister.js"></script>
</body>
</html>
