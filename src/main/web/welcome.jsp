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
    <link rel="stylesheet" href="assets/css/magister.css">
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
<%--<nav class="mainmenu">--%>
<%--    <div class="container">--%>
<%--        <div class="dropdown">--%>
<%--            <button type="button" class="navbar-toggle" data-toggle="dropdown"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>--%>
<%--            <!-- <a data-toggle="dropdown" href="#">Dropdown trigger</a> -->--%>
<%--            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">--%>
<%--                <li><a href="#head" class="active">Hello</a></li>--%>
<%--                <li><a href="#about">About me</a></li>--%>
<%--                <li><a href="#themes">Themes</a></li>--%>
<%--                <li><a href="#contact">Get in touch</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>


<section class ="section" id="head">
    <div class ="container">
        <div class="row">
            <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">
                <h1 class="title">Engaging History Tools</h1>
                <h2 class ="subtitle">Start your journey to learn more about you academic institution and all great events in your surrounding City</h2>
                <h3 class="tagline">
                    This is aimed at all students to find out more about the history of their institution!
                </h3>

            </div>
        </div>
    </div>
</section>

    <jsp:include page="about.jsp"></jsp:include>

    <jsp:include page="timemap.jsp"></jsp:include>

<%--<section class="section" id="about">--%>
<%--    <div class="container">--%>

<%--        <h2 class="text-center title">About Engaging History Tools</h2>--%>
<%--        <div class="row">--%>
<%--            <div class="col-sm-4 col-sm-offset-2">--%>
<%--                <h5><strong>Where's my lorem ipsum?<br></strong></h5>--%>
<%--                <p>Well, here it is: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum, ullam, ducimus, eaque, ex autem est dolore illo similique quasi unde sint rerum magnam quod amet iste dolorem ad laudantium molestias enim quibusdam inventore totam fugit eum iusto ratione alias deleniti suscipit modi quis nostrum veniam fugiat debitis officiis impedit ipsum natus ipsa. Doloremque, id, at, corporis, libero laborum architecto mollitia molestiae maxime aut deserunt sed perspiciatis quibusdam praesentium consectetur in sint impedit voluptates! Deleniti, sequi voluptate recusandae facere nostrum?</p>--%>
<%--            </div>--%>
<%--            <div class="col-sm-4">--%>
<%--                <h5><strong>More, more lipsum!<br></strong></h5>--%>
<%--                <p>Tempore, eos, voluptatem minus commodi error aut eaque neque consequuntur optio nesciunt quod quibusdam. Ipsum, voluptatibus, totam, modi perspiciatis repudiandae odio ad possimus molestias culpa optio eaque itaque dicta quod cupiditate reiciendis illo illum aspernatur ducimus praesentium quae porro alias repellat quasi cum fugiat accusamus molestiae exercitationem amet fugit sint eligendi omnis adipisci corrupti. Aspernatur.</p>--%>
<%--                <h5><strong>Author links<br></strong></h5>--%>
<%--                <p><a href="http://be.net/pozhilov9409">Behance</a> / <a href="https://twitter.com/serggg">Twitter</a> / <a href="http://linkedin.com/pozhilov">LinkedIn</a> / <a href="https://www.facebook.com/pozhilov">Facebook</a></p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>


<%--<h1>Welcome, you logged in</h1>--%>
<%--<p> Dear: ${username}</p>--%>
<%--<p>Your password is: ${password}</p>--%>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="assets/js/modernizr.custom.72241.js"></script>
    <!-- Custom template scripts -->
    <script src="assets/js/magister.js"></script>
</body>
</html>
