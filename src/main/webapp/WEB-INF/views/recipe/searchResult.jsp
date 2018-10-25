<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/resources/style/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/style/default.css" rel="stylesheet">
    <title>CookBookApp</title>
</head>
<body>
<jsp:include page="../fragments/navbar.jsp"/>
<div class="container">
    <div class="row justify-content-md-center">

        <h2>Wyniki wyszukiwania</h2>
    </div>
    <div class="row justify-content-md-center">
        <ol>
        <c:forEach items="${searchResult}" var="recipe">
            <li><a href="/recipe/${recipe.id}">${recipe.title}</a></li>
        </c:forEach>
        </ol>
    </div>
</div>
</body>
</html>
