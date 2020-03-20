<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 05/03/2020
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%-- Sources: https://www.w3schools.com/
  https://www.gettemplate.com/info/magister/
  https://timeline.knightlab.com/
  https://getbootstrap.com/--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <title>TimeLine</title>

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

    <script src="https://cdn.knightlab.com/libs/timeline3/latest/js/timeline.js"></script>

    <script type="text/javascript">
        <% String jsonId = (String) request.getAttribute("jsonId"); %>

        fetch(window.location.protocol + "//" + document.location.host + "/json-files/<% out.print(jsonId); %>")
            .then(function(response) { return response.json() })
            .then(function(value) {
                console.log(value);
                timeline = new TL.Timeline('timeline-embed',  value);
            });
    </script>

</head>

<body class="theme-invert" style="background-color:#3F729B;">
<section class="section" id="themes">
<div class ="container">
    <div class="row" style="position:relative; top:400px;">
        <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">
            <h1 class="title"  style="position:relative; top:-350px;">Your Timeline has been generated</h1>
            <div id='timeline-embed' style="position:relative; top:-350px; width: 100%; height: 600px">
                <iframe src='https://cdn.knightlab.com/libs/timeline3/latest/embed/index.html?source=1cWqQBZCkX9GpzFtxCWHoqFXCHg-ylTVUWlnrdYMzKUI&font=Default&lang=en&initial_zoom=2&height=650'  width='100%' height='650' webkitallowfullscreen mozallowfullscreen allowfullscreen frameborder='0'></iframe>
            </div>
            <form action="/Downloader" method="POST" style="text-align:center; position:relative; top:-330px;">
                <%--Redirecting using that particular json created file upon upload--%>
                <input type="hidden" value="<% out.print(jsonId); %>" name="jsonId" id="jsonId"/>
                <input class="btn btn-success" type="submit" value="Download Calendar" name="Download" id="download"/>
            </form>
        </div>
    </div>
</div>
</section>
</body>
</html>




