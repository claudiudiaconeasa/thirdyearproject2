<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 05/03/2020
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <title>John Rylands Library</title>
    <%--BootStrap--%>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="template/css/magister.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
    <%--Css from Magister--%>
    <link rel="stylesheet" href="template/css/magister.css">
    <%--My Css--%>
    <link rel="stylesheet" href="template/css/mycss.css">
    <%--TimeLine Css--%>
    <link title="timeline-styles" rel="stylesheet" href="https://cdn.knightlab.com/libs/timeline3/latest/css/timeline.css">

    <script>
        function waiting(){
            alert("Your calendar will get downloaded in a few moments, please wait")
        }
    </script>

    <script src="https://cdn.knightlab.com/libs/timeline3/latest/js/timeline.js"></script>

    <script type="text/javascript">
        <% String jsonId = (String) request.getAttribute("jsonId"); %>

        fetch("http://localhost:8080/thirdyearproject_war_exploded/json-files/<% out.print(jsonId); %>")
            .then(function(response) { return response.json() })
            .then(function(value) {
                console.log(value);
                timeline = new TL.Timeline('timeline-embed',  value);
            });
    </script>

</head>

<body class="theme-invert">
<section class="section" id="themes">
<div class ="container">
    <div class="row" style="position:relative; top:400px;">
        <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">
            <h1 class="title"> Your file has been uploaded</h1>
            <div id='timeline-embed' style="width: 100%; height: 600px">
                <iframe src='https://cdn.knightlab.com/libs/timeline3/latest/embed/index.html?source=1cWqQBZCkX9GpzFtxCWHoqFXCHg-ylTVUWlnrdYMzKUI&font=Default&lang=en&initial_zoom=2&height=650' width='100%' height='650' webkitallowfullscreen mozallowfullscreen allowfullscreen frameborder='0'></iframe>
            </div>
            <form action="/thirdyearproject_war_exploded/Downloader" method="POST" style="text-align:center; position:relative; top:50px;" onsubmit="waiting()">
                <input type="hidden" value="<% out.print(jsonId); %>" name="jsonId" id="jsonId"/>
                <input class="btn btn-default" type="submit" value="Download" name="Download" id="download"/>
            </form>
        </div>
    </div>
</div>
</section>
</body>
</html>




