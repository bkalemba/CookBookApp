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
<h2>Produkty</h2>
<a href="/admin/">Powrót</a><br>
<a href="/admin/product/add">Dodaj</a><br>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nazwa</th>
        <th>Kategoria</th>
        <th colspan="2">Akcje</th>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.category.name}</td>
            <td><a href="/admin/product/edit/${product.id}">Edytuj</a></td>
            <td><a href="/admin/product/delete/${product.id}">Usuń</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
