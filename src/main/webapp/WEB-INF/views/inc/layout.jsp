<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no">
    <title>동행복권</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/styles.css?ver=1">
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.9.1.min.js"></script>

</head>

<body>
	<tiles:insertAttribute name="header" />
	
    <tiles:insertAttribute name="main" />
    
    <tiles:insertAttribute name="quick" />

    <tiles:insertAttribute name="footer"/>
</body>

</html>