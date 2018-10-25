<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<a href="/admin/product/">Powrót</a><br>
<form:form modelAttribute="product" method="post">
    Nazwa: <form:input path="name"/><br>
    <form:errors path="name"/><br>
    Kategoria: <form:select path="category" items="${categories}" itemLabel="name" itemValue="id"/><br>
    <form:errors path="name"/><br>
    <button type="submit">Zapisz</button>
</form:form>
</body>
</html>
