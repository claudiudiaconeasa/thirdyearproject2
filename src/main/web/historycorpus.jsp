<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 05/12/2019
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <title>History Corpus</title>
    <%--BootStrap from Magister--%>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <%--Bootstrap fonts--%>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
    <%-- Css--%>
    <link rel="stylesheet" href="template/css/magister.css">

</head>

<body class="theme-invert">

<%--Each article presented from the TimeMap - Corpus section--%>
<section class="section" id="themes">

<%--John Rylands Library--%>
    <div class="container">
        <h2 style ="text-align:center">History Corpus</h2>
        <br>

        <div class="card w-90" style ="text-align: center">
            <div class="card-body">
                <h5 class="card-title">John Rylands Library</h5>
                <p class="card-text">John Rylands Library was opened in 1920...</p>
                <form action ="JohnRylands" method ="post">
                    <button name="more" value="More" class="btn btn-default">More</button>
                </form>
            </div>
        </div>
        <br>

        <div class="card w-90" style ="text-align: center">
            <div class="card-body">
                <h5 class="card-title">Whitworth Hall</h5>
                <p class="card-text">The Whitworth Hall is opened by the Prince of Wales...</p>
                <form action ="WhitworthHall" method ="post">
                    <button name="more" value="More" class="btn btn-default">More</button>
                </form>
            </div>
        </div>
        <br>
    </div>

</section>

</body>
</html>
