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
    <h2>Admin Panel</h2>
    <a href="/admin/category/">Kategorie</a><br>
    <a href="/admin/product/">Produkty</a><br>
    <a href="/admin/unit/">Jednostki</a><br>
    <a href="/admin/recipe/">Przepisy</a><br>
</div>
</body>
</html>
