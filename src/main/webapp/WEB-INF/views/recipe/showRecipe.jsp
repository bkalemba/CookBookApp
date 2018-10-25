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
    <div class="row justify-content-md-center">
        <h3>${recipe.title}</h3>
    </div>
    <div class="row justify-content-md-center">
        <div class="col-4">
            <ul>
                <c:forEach items="${recipeIngredients}" var="ingredient">
                    <li>${ingredient.product.name} - ${ingredient.quantity} ${ingredient.unit.name}</li>
                </c:forEach>
            </ul>
        </div>
        <div class="col recipeDesc">
            ${recipe.description}
        </div>
    </div>
</div>
</body>
</html>
