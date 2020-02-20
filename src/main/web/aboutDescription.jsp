<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 05/12/2019
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.sql.*" %>

<%
    Connection connection = null;
    PreparedStatement statement = null;
    PreparedStatement statementTitle = null;

    ResultSet resultSet = null;
    ResultSet resultSetTitle = null;

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    String id = request.getParameter("id");
    String description = request.getParameter("description");
    String title = request.getParameter("title");

    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String connectionUser = "root";
    String connectionPass = "root";

    connection = DriverManager.getConnection(connectionUrl,connectionUser,connectionPass);

    String sql = "SELECT description FROM thirdyearproject.historycorpus where id = 1";
    statement = connection.prepareStatement(sql);

    String sqlTitle =  "SELECT title FROM thirdyearproject.historycorpus where id = 1";
    statementTitle = connection.prepareStatement(sqlTitle);


    resultSet = statement.executeQuery(sql);
    resultSetTitle = statementTitle.executeQuery(sqlTitle);

    while(resultSet.next() && resultSetTitle.next()) {

%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <title>John Rylands Library</title>
    <%--BootStrap--%>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="template/css/magister.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
    <%--My Css--%>
    <link rel="stylesheet" href="template/css/mycss.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body style="background-image: url('template/images/body4.jpg');">
<div class="container">
    <h2>About</h2>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="template/images/university.jpg" alt="Univeristy place" style="width:100%;">
                <h5><strong>What's the utility of this project?<br></strong></h5>
                <p style="font-size: 30px">Students across all academic years will get the chance to explore in depth about the University they're studying at and the City of Manchester in terms of the cultural past events.</p>
            </div>

            <div class="item">
                <img src="template/images/body2.jpg" alt="Chicago" style="width:100%;">
            </div>

            <div class="item">
                <img src="template/images/body1.jpg" alt="New york" style="width:100%;">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
</body>
</html>
<%
    }
%>

