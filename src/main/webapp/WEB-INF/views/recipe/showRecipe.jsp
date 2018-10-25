<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: benek
  Date: 25.10.18
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CookBookApp</title>
</head>
<body>
<h3>${recipe.title}</h3>
<div class="container">
    <ul>
        <c:forEach items="${recipeIngredients}" var="ingredient">
            <li>${ingredient.product.name} - ${ingredient.quantity} ${ingredient.unit.name}</li>
        </c:forEach>
    </ul>
</div>
<div class="container">
    ${recipe.description}
</div>
</body>
</html>
