<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 05/12/2019
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">

    <meta http-equiv="Content-Type" content="text/html: charset=UTF-8">

    <title>Generate</title>

    <%--BootStrap from Magister--%>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <%--Bootstrap fonts--%>
    <link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
    <%--Css from Magister--%>
    <link rel="stylesheet" href="template/css/magister.css">
    <%--My css--%>
    <link rel ="stylesheet" href="template/css/mycss.css">

<%--    <script>--%>
<%--        var fileExtension = [".csv"];--%>

<%--        function Validate(formInput)--%>
<%--        {--%>
<%--            var input = formInput.getElementsByTagName("input");--%>
<%--            var i = 0;--%>
<%--            // for (var i = 0; i < input.length; i++)--%>
<%--            while(i < input.length)--%>
<%--            {--%>
<%--                if (input[i].type == "file")--%>
<%--                {--%>
<%--                    var name = input[i].value;--%>

<%--                    if (name.length > 0)--%>
<%--                    {--%>
<%--                        var flag = false;--%>
<%--                        var k = 0;--%>
<%--                        while (k < fileExtension.length)--%>
<%--                        {--%>
<%--                            var extension = fileExtension[k];--%>
<%--                            if (extension.toLowerCase() == name.substr(name.length - extension.length, extension.length).toLowerCase())--%>
<%--                            {flag = true;}--%>
<%--                            k++;--%>
<%--                        }--%>
<%--                        if (!flag) { alert("The allowed extension is only .csv");--%>
<%--                            return false;--%>
<%--                        }--%>
<%--                    }--%>
<%--                }--%>
<%--                i++;--%>
<%--            }--%>
<%--            return true;--%>
<%--        }--%>
<%--    </script>--%>

</head>

<body class="theme-invert">
<section class="section" id="themes">
    <div class="container">
        <h2 style ="text-align:center">Generate your own TimeMap with at least 12 events, 1 for each month</h2>
        <h3 style ="text-align:center">Use the following format for generation: </h3>
        <form action ="DownloadExample" style ="position:relative; text-align:center;" method ="post" enctype ="multipart/form-data">
            <input class ="btn btn-default" type ="submit" value="Download Example" name ="downloadExample" id="downloadExample"/>
        </form>
        <div class="jumbotron" style="background-color:#007E33; position:relative; top:50px;">
        <div class="card w-90" style ="text-align:center;">
            <div class="card-body">
                <form action ="Uploader" method ="post" enctype="multipart/form-data">
                    <input style="position:relative; left:375px;" type="file" name="file" /><br>
                    <input class ="btn btn-default" type ="submit" value="Upload" name ="upload" id="upload"/>
                </form>
                <br>
            </div>
        </div>
        </div>
        <br>
    </div>
</section>
</body>
</html>


