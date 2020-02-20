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

    String sql = "SELECT description FROM thirdyearproject.historycorpus where id = 2";
    statement = connection.prepareStatement(sql);

    String sqlTitle =  "SELECT title FROM thirdyearproject.historycorpus where id = 2";
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

    <title>Whitworth Hall</title>
    <%--BootStrap--%>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="template/css/magister.css">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
    <%--My Css--%>
    <link rel="stylesheet" href="template/css/mycss.css">

</head>

<body class="theme-invert">
<div class ="container">
    <div class="row">
        <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">

            <h1 class="title"><%=resultSetTitle.getString("title")%></h1>
            <h3 class="tagline" style="text-align: justify"> <%=resultSet.getString("description")%>
            </h3>
            <a class ="mylink" href="https://en.wikipedia.org/wiki/Whitworth_Hall">More information here</a>
        </div>
    </div>
</div>
</body>
</html>
<%
    }
%>


