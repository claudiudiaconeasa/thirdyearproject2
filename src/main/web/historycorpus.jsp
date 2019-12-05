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
    <%--BootStrap--%>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="template/css/magister.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
</head>

<body class="theme-invert">
<section class="section" id="themes">

<%--John Rylands Library--%>
    <div class="container">
        <h2 class="text-center title">History Corpus</h2>
        <div class="row">
            <div class="col-sm-4 col-sm-offset-2">
                <div class="thumbnail">
                    <img src="template/images/johnrylands.jpg" alt="">
                    <div class="caption">
                        <h1>The John Rylands Library</h1>
                        <p>The John Rylands Library is a late-Victorianneo-Gothic building on Deansgate in Manchester, England. The library, which opened to the public in 1900, was founded by Enriqueta Augustina Rylands in memory of her husband, John Rylands.</p>
                        <form action ="JohnRylands" method ="post">
                            <button name="more" value="More" class="btn btn-default">More</button>
                        </form>
                    </div>
                </div>
            </div>



<%--WhitWorthHall--%>

            <div class="col-sm-4">
                <div class="thumbnail">
                    <img src="template/images/johnrylands.jpg" alt="">
                    <div class="caption">
                        <h1>Whitworth Hall</h1>
                        <p>Opened by Prince Charles, Whitworth Hall on Oxford Road and Burlington Street in Chorlton-on-Medlock, Manchester, England, is part of the University of Manchester</p>
                        <form action ="WhitworthHall" method ="post">
                            <button name="more" value="More" class="btn btn-default">More</button>
                        </form>
                    </div>
                </div>
            </div>
<%--Another topic--%>
            <div class="col-sm-4 col-sm-offset-2">
                <div class="thumbnail">
                    <img src="template/images/johnrylands.jpg" alt="">
                    <div class="caption">
                        <h1>Whitworth Hall</h1>
                        <p>Opened by Prince Charles, Whitworth Hall on Oxford Road and Burlington Street in Chorlton-on-Medlock, Manchester, England, is part of the University of Manchester</p>
                        <form action ="WhitworthHall" method ="post">
                            <button name="more" value="More" class="btn btn-default">More</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

</body>
</html>
