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
<h2>Przepisy</h2>
<a href="/admin/recipe/">Powrót</a><br>
<form:form modelAttribute="recipe" method="post">
    Tytuł: <form:input cssClass="form-control" path="title"/><br>
    <form:errors path="title"/><br>
    <button class="btn btn-primary" type="submit">Dalej</button>
</form:form>
</body>
</html>
