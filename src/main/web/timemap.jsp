<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 04/12/2019
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
    <meta name="description" content="">

    <title>TimeMap</title>
    <%--BootStrap--%>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="template/css/magister.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
</head>
<body class="theme-invert">
<section class="section" id="contact">
    <div class="container">

        <h2 class="text-center title" style="position:relative; left: 135px;">Chronology of Events</h2>
        <div class="row">
            <iframe src="https://timemapper.okfnlabs.org/anon/hbz420-third-year-project?embed=1" scrolling ="yes" frameborder="0" style="border: none; position:relative; left:250px;" width="80%" height="80%"></iframe>
        </div>

        <p>
            <a class="btn btn-success" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:30px; left:230px;">
              Generated example
            </a>
        </p>
        <div class="collapse" id="collapseExample" style="position:relative; top:30px; left:230px;">
            <div class="card card-body">
                Select one event per month in order to convert an example of a TimeMap into a calendar
            </div>

             <%--January--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleJanuary" role="button" aria-expanded="false" aria-controls="collapseExample"  style="position:relative; top:10px;">
                    January
                </a>
                <div class="collapse" id="collapseExampleJanuary">
                    <div class="card card-body" style="position:relative; top:12px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleJanuary">
                        <div class="card card-body" style="position:relative; top:14px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

           <%--February--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleFebruary" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:15px;">
                   February
                </a>
                <div class="collapse" id="collapseExampleFebruary">
                    <div class="card card-body" style="position:relative; top:17px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleFebruary">
                        <div class="card card-body" style="position:relative; top:19px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--March--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleMarch" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:20px;">
                    March
                </a>
                <div class="collapse" id="collapseExampleMarch">
                    <div class="card card-body" style="position:relative; top:22px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleMarch">
                        <div class="card card-body" style="position:relative; top:24px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--April--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleApril" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:25px;">
                    April
                </a>
                <div class="collapse" id="collapseExampleApril">
                    <div class="card card-body" style="position:relative; top:27px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleApril">
                        <div class="card card-body" style="position:relative; top:29px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>
                </div>
            </div>

            <%--May--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleMay" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:30px;">
                    May
                </a>
                <div class="collapse" id="collapseExampleMay">
                    <div class="card card-body" style="position:relative; top:32px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleMay">
                        <div class="card card-body" style="position:relative; top:34px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--June--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleJune" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:35px;">
                    June
                </a>
                <div class="collapse" id="collapseExampleJune">
                    <div class="card card-body" style="position:relative; top:37px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleJune">
                        <div class="card card-body" style="position:relative; top:39px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--July--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleJuly" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:40px;">
                    July
                </a>
                <div class="collapse" id="collapseExampleJuly">
                    <div class="card card-body" style="position:relative; top:42px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleJuly">
                        <div class="card card-body" style="position:relative; top:44px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--August--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleAugust" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:50px;">
                    August
                </a>
                <div class="collapse" id="collapseExampleAugust">
                    <div class="card card-body" style="position:relative; top:47px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleAugust">
                        <div class="card card-body" style="position:relative; top:49px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--September--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleSeptember" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:55px;">
                    September
                </a>
                <div class="collapse" id="collapseExampleSeptember">
                    <div class="card card-body" style="position:relative; top:57px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleSeptember">
                        <div class="card card-body" style="position:relative; top:59px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--October--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleOctober" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:60px;">
                    October
                </a>
                <div class="collapse" id="collapseExampleOctober">
                    <div class="card card-body" style="position:relative; top:62px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleOctober">
                        <div class="card card-body" style="position:relative; top:64px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--November--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleNovember" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:65px;">
                    November
                </a>
                <div class="collapse" id="collapseExampleNovember">
                    <div class="card card-body" style="position:relative; top:67px;">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleNovember">
                        <div class="card card-body" style="position:relative; top:69px; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>

                </div>
            </div>

            <%--December--%>
            <div class="card card-body">
                <a class="btn btn-default" data-toggle="collapse" href="#collapseExampleDecember" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:70px;">
                    December
                </a>
                <div class="collapse" id="collapseExampleDecember" style="position:relative; top:72px;">
                    <div class="card card-body">
                        Which events do you want to choose?
                    </div

                    <div class="collapse" id="collapseExampleDecember">
                        <div class="card card-body" style="position:relative; left:50px;">
                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">First event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Second event</label><br>

                            <input type="radio" id="this" name="event" value="this">
                            <label for="this">Third event</label><br>
                        </div
                    </div>
                </div>
            </div>

            <%--Generate--%>
            <div class="card card-body">
                <a class="btn btn-success" role="button" style="position:relative; top:74px;">
                    Create
                </a>
            </div>

        </div>
        </div>
    </div>
</section>

</body>
</html>
