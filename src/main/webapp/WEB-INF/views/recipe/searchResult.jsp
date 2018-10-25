<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: benek
  Date: 25.10.18
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CookBookApp</title>
</head>
<body>
<h2>Wyniki wyszukiwania</h2>
<c:forEach items="${searchResult}" var="recipe">
    <a href="/recipe/${recipe.id}">${recipe.title}</a><br>
</c:forEach>
</body>
</html>
