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
<h2>Jednostki</h2>
<a href="/admin/">Powrót</a><br>
<a href="/admin/unit/add">Dodaj</a><br>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nazwa</th>
        <th colspan="2">Akcje</th>
    </tr>
    <c:forEach items="${units}" var="unit">
        <tr>
            <td>${unit.id}</td>
            <td>${unit.name}</td>
            <td><a href="/admin/unit/edit/${unit.id}">Edytuj</a></td>
            <td><a href="/admin/unit/delete/${unit.id}">Usuń</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
