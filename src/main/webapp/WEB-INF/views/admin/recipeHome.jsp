<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: benek
  Date: 23.10.18
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CookBookApp</title>
</head>
<body>
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
