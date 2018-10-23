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
<h2>Kategorie</h2>
<a href="/admin/">Powrót</a><br>
<a href="/admin/category/add">Dodaj</a><br>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nazwa</th>
        <th colspan="2">Akcje</th>
    </tr>
    <c:forEach items="${categories}" var="category">
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td><a href="/admin/category/edit/${category.id}">Edytuj</a></td>
            <td><a href="/admin/category/delete/${category.id}">Usuń</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
