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
<%@ page import="com.opencsv.CSVReader"%>
<%@ page import="corpus.Article" %>
<%@ page import="corpus.CsvReader" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


    <script>
        function getSelection(selection)
        {
            var firstIframeWindow = document.getElementById("timemapper1").contentWindow;
            firstIframeWindow.goToEvent(articleIdMapper[selection.target.value]);
        }

        function getSelectionComputing(selection)
        {
            var secondIframeWindow = document.getElementById("timemapper2").contentWindow;
            secondIframeWindow.goToEvent(articleIdMapperComputing[selection.target.value]);
        }
    </script>

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
                        <a href="#head" class="active">TimeMap</a>
                    </li>
                    <li>
                        <a href="#themes">Generator</a>
                    </li>
                    <li>
                        <a href="#contact">About</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<%--Main description on HomePage - Home section--%>
<section class ="section" id="head">
<%--    <div class ="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">--%>
<%--                <div class="jumbotron" style="background-color:#007E33; position:relative; top:50px;">--%>
<%--                    <h1 class="display-4">Engaging History Tools</h1>--%>
<%--                    <p class="lead">Aimed at all students in order to find out more about History Facts!</p>--%>
<%--                    <hr class="my-4">--%>
<%--                    <p>Start your journey by learning more about the past greatest events in computing, what your University has been through and all great events in your surrounding City!</p>--%>
<%--                    <p class="lead">--%>
<%--                    <form action ="About" method ="post">--%>
<%--                        <button name="more" id="about" value="More" class="btn btn-primary btn-lg"  data-toggle="popover" title="Popover title" data-content="And here's some amazing content. It's very engaging. Right?">About</button>--%>

<%--                    </form>--%>
<%--                    </p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="container">

        <h2 class="text-center title" style="position:relative; left: 135px;">Chronology of Events</h2>
        <div class="row">
            <iframe id="timemapper1" src="template/timemap/timemapframe.jsp" scrolling ="yes" frameborder="0" style="border: none; position:relative; left:250px;" width="80%" height="80%"></iframe>
        </div>

        <p>
            <button type ="button" name="load_data" class="btn btn-success" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:30px; left:230px;">
                Generate example
            </button>
        </p>
        <div class="collapse" id="collapseExample" style="position:relative; top:30px; left:230px;">
            <div class="card card-body" style="font-size: 20px;">
                Select one event per month in order to convert an example of a TimeMap into a calendar:
            </div>
            <br>

            <% CSVReader reader =  CsvReader.getReader("historyCorpus.csv", false); %>
            <% HashMap<Integer, ArrayList<Article>> articles =  CsvReader.getArticlesForForm(reader); %>

            <form name ="selectEvents" method="POST" action ="EventSelector">
                <%--January--%>
                <% request.setAttribute("articlesForJanuary", articles.get(1)); %>
                <div class="card card-body">
                    <label for ="january">January: </label>
                    <select id ="january" name ="january" onchange="getSelection(this)">
                        <c:forEach items="${articlesForJanuary}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--February--%>
                <% request.setAttribute("articlesForFebruary", articles.get(2)); %>
                <div class="card card-body">
                    <label for ="february">February: </label>
                    <select id ="february" name ="february" onchange="getSelection(this)">
                        <c:forEach items="${articlesForFebruary}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--March--%>
                <% request.setAttribute("articlesForMarch", articles.get(3)); %>
                <div class="card card-body">
                    <label for ="march">March: </label>
                    <select id ="march" name ="march" onchange="getSelection(this)">
                        <c:forEach items="${articlesForMarch}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--April--%>
                <% request.setAttribute("articlesForApril", articles.get(4)); %>
                <div class="card card-body">
                    <label for ="april">April: </label>
                    <select id ="april" name ="april" onchange="getSelection(this)">
                        <c:forEach items="${articlesForApril}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>

                </div>

                <%--May--%>
                <% request.setAttribute("articlesForMay", articles.get(5)); %>
                <div class="card card-body">
                    <label for ="may">May: </label>
                    <select id ="may" name ="may" onchange="getSelection(this)">
                        <c:forEach items="${articlesForMay}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--June--%>
                <% request.setAttribute("articlesForJune", articles.get(6)); %>
                <div class="card card-body">
                    <label for ="june">June: </label>
                    <select id ="june" name ="june" onchange="getSelection(this)">
                        <c:forEach items="${articlesForJune}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--July--%>
                <% request.setAttribute("articlesForJuly", articles.get(7)); %>
                <div class="card card-body">
                    <label for ="july">July: </label>
                    <select id ="july" name ="july" onchange="getSelection(this)">
                        <c:forEach items="${articlesForJuly}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--August--%>
                <% request.setAttribute("articlesForAugust", articles.get(8)); %>
                <div class="card card-body">
                    <label for ="august">August: </label>
                    <select id ="august" name ="august" onchange="getSelection(this)">
                        <c:forEach items="${articlesForAugust}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--September--%>
                <% request.setAttribute("articlesForSeptember", articles.get(9)); %>
                <div class="card card-body">
                    <label for ="september">September: </label>
                    <select id ="september" name ="september" onchange="getSelection(this)">
                        <c:forEach items="${articlesForSeptember}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--October--%>
                <% request.setAttribute("articlesForOctober", articles.get(10)); %>
                <div class="card card-body">
                    <label for ="october">October: </label>
                    <select id ="october" name ="october" onchange="getSelection(this)">
                        <c:forEach items="${articlesForOctober}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--November--%>
                <% request.setAttribute("articlesForNovember", articles.get(11)); %>
                <div class="card card-body">
                    <label for ="november">November: </label>
                    <select id ="november" name ="november" onchange="getSelection(this)">
                        <c:forEach items="${articlesForNovember}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--December--%>
                <% request.setAttribute("articlesForDecember", articles.get(12)); %>
                <div class="card card-body">
                    <label for ="december">December: </label>
                    <select id ="december" name ="december" onchange="getSelection(this)">
                        <c:forEach items="${articlesForDecember}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--Generate--%>
                <div class="card card-body">
                    <input class="btn btn-success" id="generateHistory" type ="submit" value="Generate calendar" />
                </div>
            </form>

        </div>

        <div class="row">
            <iframe id="timemapper2" src="template/timemap/timemapframecomputing.jsp" scrolling ="yes" frameborder="0" style="border: none; position:relative; left:250px; top:40px;" width="80%" height="80%"></iframe>
        </div>

        <p>
            <button type ="button" name="load_data" class="btn btn-success" data-toggle="collapse" href="#collapseExampleTwo" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:60px; left:230px;">
                Generate example
            </button>
        </p>

        <div class = "collapse" id="collapseExampleTwo" style="position:relative; top:65px; left:230px;">
            <div class="card card-body" style="font-size: 20px;">
                Select one event per month in order to convert an example of a TimeMap into a calendar:
            </div>
            <br>

            <% CSVReader readerComputing =  CsvReader.getReader("historyComputing.csv", false); %>
            <% HashMap<Integer, ArrayList<Article>> articlesComputing =  CsvReader.getArticlesForForm(readerComputing); %>

            <form name ="selectEventsComputing" method="POST" action ="EventSelectorComputing">
                <%--January--%>
                <% request.setAttribute("articlesForJanuaryComputing", articlesComputing.get(1)); %>
                <div class="card card-body">
                    <label for ="january">January: </label>
                    <select id ="januaryComputing" name ="januaryComputing">
                        <c:forEach items="${articlesForJanuaryComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--February--%>
                <% request.setAttribute("articlesForFebruaryComputing", articlesComputing.get(2)); %>
                <div class="card card-body">
                    <label for ="february">February: </label>
                    <select id ="februaryComputing" name ="februaryComputing">
                        <c:forEach items="${articlesForFebruaryComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--March--%>
                <% request.setAttribute("articlesForMarchComputing", articlesComputing.get(3)); %>
                <div class="card card-body">
                    <label for ="march">March: </label>
                    <select id ="marchComputing" name ="marchComputing">
                        <c:forEach items="${articlesForMarchComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--April--%>
                <% request.setAttribute("articlesForAprilComputing", articlesComputing.get(4)); %>
                <div class="card card-body">
                    <label for ="april">April: </label>
                    <select id ="aprilComputing" name ="aprilComputing">
                        <c:forEach items="${articlesForAprilComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>

                </div>

                <%--May--%>
                <% request.setAttribute("articlesForMayComputing", articlesComputing.get(5)); %>
                <div class="card card-body">
                    <label for ="may">May: </label>
                    <select id ="mayComputing" name ="mayComputing">
                        <c:forEach items="${articlesForMayComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--June--%>
                <% request.setAttribute("articlesForJuneComputing", articlesComputing.get(6)); %>
                <div class="card card-body">
                    <label for ="june">June: </label>
                    <select id ="juneComputing" name ="juneComputing">
                        <c:forEach items="${articlesForJuneComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--July--%>
                <% request.setAttribute("articlesForJulyComputing", articlesComputing.get(7)); %>
                <div class="card card-body">
                    <label for ="july">July: </label>
                    <select id ="julyComputing" name ="julyComputing">
                        <c:forEach items="${articlesForJulyComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--August--%>
                <% request.setAttribute("articlesForAugustComputing", articlesComputing.get(8)); %>
                <div class="card card-body">
                    <label for ="august">August: </label>
                    <select id ="augustComputing" name ="augustComputing">
                        <c:forEach items="${articlesForAugustComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--September--%>
                <% request.setAttribute("articlesForSeptemberComputing", articlesComputing.get(9)); %>
                <div class="card card-body">
                    <label for ="september">September: </label>
                    <select id ="septemberComputing" name ="septemberComputing">
                        <c:forEach items="${articlesForSeptemberComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--October--%>
                <% request.setAttribute("articlesForOctoberComputing", articlesComputing.get(10)); %>
                <div class="card card-body">
                    <label for ="october">October: </label>
                    <select id ="octoberComputing" name ="octoberComputing">
                        <c:forEach items="${articlesForOctoberComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--November--%>
                <% request.setAttribute("articlesForNovemberComputing", articlesComputing.get(11)); %>
                <div class="card card-body">
                    <label for ="november">November: </label>
                    <select id ="novemberComputing" name ="novemberComputing">
                        <c:forEach items="${articlesForNovemberComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--December--%>
                <% request.setAttribute("articlesForDecemberComputing", articlesComputing.get(12)); %>
                <div class="card card-body">
                    <label for ="december">December: </label>
                    <select id ="decemberComputing" name ="decemberComputing">
                        <c:forEach items="${articlesForDecemberComputing}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

                <%--Generate--%>
                <div class="card card-body">
                    <input class="btn btn-success" id="generateComputing" type ="submit"  value="Generate calendar" />
                </div>
            </form>

        </div>



    </div>

</section>

<script>
    function compare(a, b) {
        if (a.date < b.date){
            return -1;
        }
        if (a.date > b.date){
            return 1;
        }
        return 0;
    }

    function addToAllArticles(allArticlesList, date, id) {
        var splitDate = date.split("/");
        allArticlesList.push({
            id: id,
            date: splitDate[2] + "/" + splitDate[1] + "/" + splitDate[0],
        });
    }

    var allArticles = [];
    var allArticlesComputing = [];

    <c:forEach items="${articlesForJanuary}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForFebruary}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForMarch}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForApril}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForMay}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForJune}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForJuly}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForAugust}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForSeptember}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForOctober}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForNovember}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForDecember}" var="article">
    addToAllArticles(allArticles, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForJanuaryComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForFebruaryComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForMarchComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForAprilComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForMayComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForJuneComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForJulyComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForAugustComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForSeptemberComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForOctoberComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForNovemberComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    <c:forEach items="${articlesForDecemberComputing}" var="article">
    addToAllArticles(allArticlesComputing, "${article.date}", ${article.id});
    </c:forEach>

    allArticles.sort(compare);
    allArticlesComputing.sort(compare);

    var articleIdMapper = {};
    var articleIdMapperComputing = {};

    allArticles.forEach(function(value, index) {
        articleIdMapper[value.id] = index;
    });

    allArticlesComputing.forEach(function(value, index) {
        articleIdMapperComputing[value.id] = index;
    });

    document.getElementById('january').addEventListener('change', getSelection);
    document.getElementById('february').addEventListener('change', getSelection);
    document.getElementById('march').addEventListener('change', getSelection);
    document.getElementById('april').addEventListener('change', getSelection);
    document.getElementById('may').addEventListener('change', getSelection);
    document.getElementById('june').addEventListener('change', getSelection);
    document.getElementById('july').addEventListener('change', getSelection);
    document.getElementById('august').addEventListener('change', getSelection);
    document.getElementById('september').addEventListener('change', getSelection);
    document.getElementById('october').addEventListener('change', getSelection);
    document.getElementById('november').addEventListener('change', getSelection);
    document.getElementById('december').addEventListener('change', getSelection);

    document.getElementById('januaryComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('februaryComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('marchComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('aprilComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('mayComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('juneComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('julyComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('augustComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('septemberComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('octoberComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('novemberComputing').addEventListener('change', getSelectionComputing);
    document.getElementById('decemberComputing').addEventListener('change', getSelectionComputing);

    var urlParams = new URLSearchParams(window.location.search);
    var calendarId = urlParams.get('calendar_id');
    var eventId = urlParams.get('event_id');

    var initialSelection = {
        target: {
            value: eventId,
        }
    }

    if (calendarId == '1') {
        var firstIframeWindow = document.getElementById("timemapper1").contentWindow;
        scrollToInitialSelection(firstIframeWindow, getSelection, initialSelection);
    } else if (calendarId == '2') {
        var secondIframeWindow = document.getElementById("timemapper2").contentWindow;
        scrollToInitialSelection(secondIframeWindow, getSelectionComputing, initialSelection);
    }

    function scrollToInitialSelection(iframeWindow, selectionFunction, initialSelection) {
        if (!iframeWindow.goToEvent) {
            setTimeout(scrollToInitialSelection, 1000, iframeWindow, selectionFunction, initialSelection);
        } else {
            selectionFunction(initialSelection);
        }
    }
</script>


    <jsp:include page="about.jsp"></jsp:include>
    <jsp:include page="generate.jsp"></jsp:include>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="template/js/modernizr.custom.72241.js"></script>

    <!-- Magister bootstrap template used -->
    <script src="template/js/magister.js"></script>
</body>
</html>
