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
<h2>Jednostki</h2>
<a href="/admin/unit/">Powrót</a><br>
<form:form modelAttribute="unit" method="post">
    Nazwa: <form:input path="name"/><br>
    <form:errors path="name"/><br>
    <button type="submit">Zapisz</button>
</form:form>
</body>
</html>
