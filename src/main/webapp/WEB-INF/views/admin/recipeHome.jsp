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
<h2>Przepisy</h2>
<a href="/admin/">Powrót</a><br>
<a href="/admin/recipe/add">Dodaj</a><br>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tytuł</th>
        <th colspan="2">Akcje</th>
    </tr>
    <c:forEach items="${recipes}" var="recipe">
        <tr>
            <td>${recipe.id}</td>
            <td>${recipe.title}</td>
            <td><a href="/admin/recipe/add/${recipe.id}">Edytuj</a></td>
            <td><a href="/admin/recipe/delete/${recipe.id}">Usuń</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
