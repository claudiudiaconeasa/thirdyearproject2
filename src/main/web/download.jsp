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
    <%--My Css--%>
    <link rel="stylesheet" href="template/css/mycss.css">
    <script>
        function waiting(){
            alert("Your calendar will get downloaded in a few moments, please wait")
        }
    </script>

</head>

<body class="theme-invert">
<div class ="container">
    <div class="row" style="position:relative; top:400px;">
        <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">
            <h1 class="title"> Your file has been uploaded</h1>
            <form action ="Downloader" method ="post" style="text-align:center" onsubmit="waiting()">
                <input class ="btn btn-default" type ="submit" value="Download calendar" name ="download" id="download"/>
            </form>
        </div>
    </div>
</div>
</body>
</html>