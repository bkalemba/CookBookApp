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
<h2>Jednostki</h2>
<a href="/admin/unit/">Powrót</a><br>
<form:form modelAttribute="unit" method="post">
    Nazwa: <form:input path="name"/><br>
    <form:errors path="name"/><br>
    <button type="submit">Zapisz</button>
</form:form>
</body>
</html>
