<%--
  Created by IntelliJ IDEA.
  User: claudiudiaconeasa
  Date: 16/03/2020
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%--Sources:
 https://www.w3schools.com/ ,
 https://www.gettemplate.com/info/magister/ ,
 https://www.w3schools.com/bootstrap/bootstrap_carousel.asp
 https://getbootstrap.com/
 https://www.w3schools.com/howto/howto_css_loader.asp--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Awaiting Download</title>
    <style>

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        /* Safari */
        @-webkit-keyframes spin {
            0% { -webkit-transform: rotate(0deg); }
            100% { -webkit-transform: rotate(360deg); }
        }
    .loading
    {
        width: 120px;
        border: 16px solid #f3f3f3;
        height: 120px;
        -webkit-animation: spin 2s linear infinite; /* Safari */
        animation: spin 2s linear infinite;
        border-radius: 50%;
        border-top: 16px solid #000000;
        margin-left:auto;
        margin-right:auto;
    }

</style>

</head>
<body>

<div style="text-align: center;">
    <h1>Preparing your calendar, please wait for a couple of minutes and the download will start!</h1><br>
    <div class="loading"></div>

    <h2 id="status">Status: Currently generating...</h2>
</div>

<script>
    poll();
    var inter = setInterval(poll, 5000);

    function stopPolling() {
        clearInterval(inter);
    }

    function poll()
    {
        var urlParams = new URLSearchParams(window.location.search);
        var calendarId = urlParams.get('id');

        fetch(window.location.protocol + "//" + window.location.host + "/poll?idname=" + calendarId)
            .then(function(response) {
                var contentType = response.headers.get('Content-Type');
                if (contentType == 'application/pdf')
                {
                    stopPolling();
                    document.getElementById("status").textContent = "Status: PDF generated, currently downloading...";
                    return response.blob();
                } else {
                    return;
                }
            })
            .then(function(value)
            {
                if (value)
                {
                    var pdf = window.URL.createObjectURL(value);
                    window.location.assign(pdf);
                }
            });
    }
</script>

</body>
</html>
