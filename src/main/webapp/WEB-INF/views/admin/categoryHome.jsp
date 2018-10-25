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
