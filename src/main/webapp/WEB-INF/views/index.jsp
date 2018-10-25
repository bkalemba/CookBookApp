<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CookBookApp</title>
</head>
<body>
<div class="container">
    <form method="post" action="/searchByTitle">
        <input type="text" name="toSearch"><button type="submit">Szukaj</button>
    </form>
</div>
<form method="post" action="/searchByProducts">
    <div class="container">
        <h3>Mięsa</h3>
        <c:forEach items="${meats}" var="product">
            <input type="checkbox" name="${product.name}" value="${product.id}">${product.name}<br>
        </c:forEach>
    </div>
    <div class="container">
        <h3>Owoce</h3>
        <c:forEach items="${fruits}" var="product">
            <input type="checkbox" name="${product.name}" value="${product.id}">${product.name}<br>
        </c:forEach>
    </div>
    <div class="container">
        <h3>Warzywa</h3>
        <c:forEach items="${vegetables}" var="product">
            <input type="checkbox" name="${product.name}" value="${product.id}">${product.name}<br>
        </c:forEach>
    </div>
    <button type="submit">Szukaj</button>
</form>
</body>
</html>
