<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 04/12/2019
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="corpus.CsvReader"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
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
            <button type ="button" name="load_data" class="btn btn-success" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="position:relative; top:30px; left:230px;">
              Generate example
            </button>
        </p>
        <% HashMap<Integer, ArrayList<HashMap<String, String>>> articles =  CsvReader.getArticles("history.csv");%>
        <div class="collapse" id="collapseExample" style="position:relative; top:30px; left:230px;">
            <div class="card card-body">
                Select one event per month in order to convert an example of a TimeMap into a calendar
            </div>

            <form name ="selectEvents" method="POST" action ="EventSelector">
             <%--January--%>
                <div class="card card-body">
                    <label for ="january">January: </label>
                    <select id ="january" name ="january">
                        <% ArrayList<HashMap<String, String>> articlesForJanuary = articles.get(1); %>
                        <% for(int i = 0; i < articlesForJanuary.size(); i+=1) { %>
                            <option value="${articlesForJanuary[i].get("id")}">${articlesForJanuary[i].get("title")}</option>
                        <% } %>
                    </select>
                </div>

           <%--February--%>
                <div class="card card-body">
                    <label for ="february">February: </label>
                    <select id ="february" name ="february">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--March--%>
                <div class="card card-body">
                    <label for ="march">March: </label>
                    <select id ="march" name ="march">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--April--%>
                <div class="card card-body">
                    <label for ="april">April: </label>
                    <select id ="april" name ="april">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>

                </div>

            <%--May--%>
                <div class="card card-body">
                    <label for ="may">May: </label>
                    <select id ="may" name ="may">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--June--%>
                <div class="card card-body">
                    <label for ="june">June: </label>
                    <select id ="june" name ="june">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--July--%>
                <div class="card card-body">
                    <label for ="july">July: </label>
                    <select id ="july" name ="july">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--August--%>
                <div class="card card-body">
                    <label for ="august">August: </label>
                    <select id ="august" name ="august">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--September--%>
                <div class="card card-body">
                    <label for ="september">September: </label>
                    <select id ="september" name ="september">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--October--%>
                <div class="card card-body">
                    <label for ="october">October: </label>
                    <select id ="october" name ="october">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--November--%>
                <div class="card card-body">
                    <label for ="november">November: </label>
                    <select id ="november" name ="november">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--December--%>
                <div class="card card-body">
                    <label for ="december">December: </label>
                    <select id ="december" name ="december">
                        <option value = "eventone">Event one</option>
                        <option value = "eventtwo">Event two</option>
                        <option value = "eventthree">Event three</option>
                    </select>
                </div>

            <%--Generate--%>
            <div class="card card-body">
               <input type ="submit" value="Generate" />
            </div>
        </form>

        </div>
        </div>
    </div>
</section>

</body>
</html>
