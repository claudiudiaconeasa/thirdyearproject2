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
    Statement statement = null;

    ResultSet resultSet = null;

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        String id = request.getParameter("id");
        String description = request.getParameter("description");

        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String connectionUser = "root";
        String connectionPass = "root";

        connection = DriverManager.getConnection(connectionUrl,connectionUser,connectionPass);
        statement = connection.createStatement();

        String sql = "SELECT description FROM thirdyearproject.historycorpus where id = 1";

        resultSet = statement.executeQuery(sql);

        while(resultSet.next()) {

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
</head>


<body class="theme-invert">
<div class ="container">
    <div class="row">
        <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center">

            <h1 class="title">The John Rylands Library</h1>
            <h3 class="tagline"> <%=resultSet.getString("description")%>
            </h3>
        </div>
    </div>
</div>
</body>
</html>
<%
    }
%>


