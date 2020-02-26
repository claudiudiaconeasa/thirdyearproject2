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

    PreparedStatement statementTimeMap = null;
    PreparedStatement statementTitleTimeMap = null;

    PreparedStatement statementUtility = null;
    PreparedStatement statementTitleUtility = null;

    PreparedStatement statementCalendar = null;
    PreparedStatement statementTitleCalendar= null;

    ResultSet resultSetTimeMap = null;
    ResultSet resultSetTitleTimeMap = null;

    ResultSet resultSetUtility = null;
    ResultSet resultSetTitleUtility = null;

    ResultSet resultSetCalendar = null;
    ResultSet resultSetTitleCalendar = null;

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    String id = request.getParameter("id");
    String description = request.getParameter("description");
    String title = request.getParameter("title");

    String connectionUrl = "jdbc:mysql://e7qyahb3d90mletd.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/xgzx038it07d2zer";
    String connectionUser = "hmp0dynvunwbmue5";
    String connectionPass = "jtiygydzn3h6f57k";

    connection = DriverManager.getConnection(connectionUrl,connectionUser,connectionPass);

    String sqlTimeMap = "SELECT description FROM xgzx038it07d2zer.historycorpus where id = 2";
    statementTimeMap = connection.prepareStatement(sqlTimeMap);

    String sqlTitleTimeMap =  "SELECT title FROM xgzx038it07d2zer.historycorpus where id = 2";
    statementTitleTimeMap = connection.prepareStatement(sqlTitleTimeMap);

    String sqlUtility = "SELECT description FROM xgzx038it07d2zer.historycorpus where id = 3";
    statementUtility = connection.prepareStatement(sqlUtility);

    String sqlTitleUtility =  "SELECT title FROM xgzx038it07d2zer.historycorpus where id = 3";
    statementTitleUtility = connection.prepareStatement(sqlTitleUtility);

    String sqlCalendar = "SELECT description FROM xgzx038it07d2zer.historycorpus where id = 4";
    statementCalendar = connection.prepareStatement(sqlCalendar);

    String sqlTitleCalendar =  "SELECT title FROM xgzx038it07d2zer.historycorpus where id = 4";
    statementTitleCalendar = connection.prepareStatement(sqlTitleCalendar);

    resultSetTimeMap = statementTimeMap.executeQuery(sqlTimeMap);
    resultSetTitleTimeMap = statementTitleTimeMap.executeQuery(sqlTitleTimeMap);

    resultSetUtility = statementUtility.executeQuery(sqlUtility);
    resultSetTitleUtility = statementTitleUtility.executeQuery(sqlTitleUtility);

    resultSetCalendar = statementCalendar.executeQuery(sqlCalendar);
    resultSetTitleCalendar = statementTitleCalendar.executeQuery(sqlTitleCalendar);

    while(resultSetTimeMap.next() && resultSetTitleTimeMap.next() && resultSetUtility.next() && resultSetTitleUtility.next() && resultSetCalendar.next() && resultSetTitleCalendar.next()) {

%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <title>About</title>
    <%--BootStrap--%>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="template/css/magister.css">
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
    <%--My Css--%>
    <link rel="stylesheet" href="template/css/mycss.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body style="background-color:#3F729B;">
<div class="container">
    <h2>About</h2>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">

        <!-- Wrapper for slides -->
        <div class="carousel-inner">

            <div class="item active">
                <img src="template/images/timemap.jpg" alt="Time Map" style="width:100%;">
                <h5><strong><%=resultSetTitleTimeMap.getString("title")%><br></strong></h5>
                <p style="font-size: 50px"><%=resultSetTimeMap.getString("description")%></p>
            </div>

            <div class="item">
                <img src="template/images/university.jpg" alt="Univeristy place" style="width:100%;">
                <h5><strong><%=resultSetTitleUtility.getString("title")%><br></strong></h5>
                <p style="font-size: 50px"><%=resultSetUtility.getString("description")%></p>
            </div>

            <div class="item">
                <img src="template/images/calendar.jpg" alt="Calendar" style="width:100%;">
                <h5><strong><%=resultSetTitleCalendar.getString("title")%><br></strong></h5>
                <p style="font-size: 50px"><%=resultSetCalendar.getString("description")%></p>
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

