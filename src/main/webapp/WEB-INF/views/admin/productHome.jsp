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
