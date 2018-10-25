<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: benek
  Date: 23.10.18
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CookBookApp</title>
</head>
<body>
<h2>Przepisy</h2>
<a href="/admin/recipe/">Powrót</a><br>
<form:form modelAttribute="recipe" method="post">
    Tytuł: <form:input path="title"/><br>
    <form:errors path="title"/><br>
    <button type="submit">Dalej</button>
</form:form>
</body>
</html>
