<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
	<title>Spring MVC 国际化</title>
    <link rel="stylesheet" href="/resources/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery-1.9.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
</head>
<body onload="updateTime()">
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div id="time"></div>

<h1>Spring MVC 国际化</h1>

Language : <a href="?language=en">English</a>|<a href="?language=zh_CN">Chinese</a>

<h2>
    您的语言: <spring:message code="index.language"></spring:message>
</h2>
Current Locale : ${pageContext.response.locale}

<script type="text/javascript">
    function updateTime() {
        $.ajax({
            url: '/updateTime',
            type: "post",
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            //data: ({name : "me"}),
            success: function(data) {
                $('#time').html(data);
            }
        });
        setTimeout("updateTime()", 500);
    }
</script>

</body>
</html>
