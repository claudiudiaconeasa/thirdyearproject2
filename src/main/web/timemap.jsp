<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 04/12/2019
  Time: 16:16
  To change this template use File | Settings | File Templates.
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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0">
    <meta name="description" content="">

    <title>TimeMap</title>
    <%--BootStrap--%>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="template/css/magister.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>

    <script>
        function waiting(){
          alert("Your calendar will get downloaded in a few moments, please wait")
        }
    </script>

</head>
<body class="theme-invert">
<section class="section" id="contact">
    <div class="container">

        <h2 class="text-center title" style="position:relative; left: 135px;">Chronology of Events</h2>
        <div class="row">
            <iframe id="timemapper1" src="https://timemapper.okfnlabs.org/anon/hbz420-third-year-project?embed=1" scrolling ="yes" frameborder="0" style="border: none; position:relative; left:250px;" width="80%" height="80%"></iframe>
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

            <form name ="selectEvents" method="POST" action ="EventSelector" onsubmit="waiting()">
             <%--January--%>
                 <% request.setAttribute("articlesForJanuary", articles.get(1)); %>
                 <div class="card card-body">
                    <label for ="january">January: </label>
                    <select id ="january" name ="january">
                        <c:forEach items="${articlesForJanuary}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

           <%--February--%>
                 <% request.setAttribute("articlesForFebruary", articles.get(2)); %>
                <div class="card card-body">
                    <label for ="february">February: </label>
                    <select id ="february" name ="february">
                        <c:forEach items="${articlesForFebruary}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--March--%>
                 <% request.setAttribute("articlesForMarch", articles.get(3)); %>
                <div class="card card-body">
                    <label for ="march">March: </label>
                    <select id ="march" name ="march">
                        <c:forEach items="${articlesForMarch}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--April--%>
                 <% request.setAttribute("articlesForApril", articles.get(4)); %>
                <div class="card card-body">
                    <label for ="april">April: </label>
                    <select id ="april" name ="april">
                        <c:forEach items="${articlesForApril}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>

                </div>

            <%--May--%>
                 <% request.setAttribute("articlesForMay", articles.get(5)); %>
                <div class="card card-body">
                    <label for ="may">May: </label>
                    <select id ="may" name ="may">
                        <c:forEach items="${articlesForMay}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--June--%>
                 <% request.setAttribute("articlesForJune", articles.get(6)); %>
                <div class="card card-body">
                    <label for ="june">June: </label>
                    <select id ="june" name ="june">
                        <c:forEach items="${articlesForJune}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--July--%>
                 <% request.setAttribute("articlesForJuly", articles.get(7)); %>
                <div class="card card-body">
                    <label for ="july">July: </label>
                    <select id ="july" name ="july">
                        <c:forEach items="${articlesForJuly}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--August--%>
                 <% request.setAttribute("articlesForAugust", articles.get(8)); %>
                <div class="card card-body">
                    <label for ="august">August: </label>
                    <select id ="august" name ="august">
                        <c:forEach items="${articlesForAugust}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--September--%>
                 <% request.setAttribute("articlesForSeptember", articles.get(9)); %>
                <div class="card card-body">
                    <label for ="september">September: </label>
                    <select id ="september" name ="september">
                        <c:forEach items="${articlesForSeptember}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--October--%>
                 <% request.setAttribute("articlesForOctober", articles.get(10)); %>
                <div class="card card-body">
                    <label for ="october">October: </label>
                    <select id ="october" name ="october">
                        <c:forEach items="${articlesForOctober}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--November--%>
                 <% request.setAttribute("articlesForNovember", articles.get(11)); %>
                <div class="card card-body">
                    <label for ="november">November: </label>
                    <select id ="november" name ="november">
                        <c:forEach items="${articlesForNovember}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--December--%>
                 <% request.setAttribute("articlesForDecember", articles.get(12)); %>
                <div class="card card-body">
                    <label for ="december">December: </label>
                    <select id ="december" name ="december">
                        <c:forEach items="${articlesForDecember}" var="article">
                            <option value="${article.id}">${article.title}</option>
                        </c:forEach>
                    </select>
                </div>

            <%--Generate--%>
            <div class="card card-body">
               <input class="btn btn-success" type ="submit" value="Generate" />
            </div>
        </form>

        </div>

        <div class="row">
            <iframe id="timemapper1" src="https://timemapper.okfnlabs.org/anon/uf3spi-history-of-computing?embed=1" scrolling ="yes" frameborder="0" style="border: none; position:relative; left:250px; top:40px;" width="80%" height="80%"></iframe>
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

            <form name ="selectEventsComputing" method="POST" action ="EventSelectorComputing" onsubmit="waiting()">
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
                        <input class="btn btn-success" type ="submit"  value="Generate" />
                    </div>
            </form>

        </div>



    </div>

<%--    </div>--%>

</section>

</body>
</html>
