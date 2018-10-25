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
<div class="container">
    <h2>Przepisy</h2>
    <a href="/admin/recipe/">Powrót</a><br>
    <h3>Składniki:</h3>
    <table border="1">
        <c:forEach items="${recipeIngredients}" var="ingr">
            <tr>
                <td>${ingr.product.name}</td>
                <td>${ingr.quantity}</td>
                <td>${ingr.unit.name}</td>
                <td><a href="/admin/recipe/add/${recipe.id}/ingredient/${ingr.id}">Usuń</a></td>
            </tr>
        </c:forEach>
    </table>

    <form:form modelAttribute="ingredient" method="post" action="/admin/recipe/add/${recipe.id}/ingredient">
        Produkt: <form:select path="product" items="${products}" itemLabel="name" itemValue="id"/><br>
        Ilość: <form:input path="quantity"/><br>
        Jednostka: <form:select path="unit" items="${units}" itemLabel="name" itemValue="id"/><br>
        <button type="submit">Dodaj składnik</button>
        <br>
    </form:form>
    <form:form modelAttribute="recipe" method="post">
        <h3>Tytuł:</h3><br>
        <form:input cssClass="form-control" path="title"/><br>
        <h3>Przepis:</h3><br>
        <form:textarea cssClass="form-control" path="description" rows="6"/><br>
        <button class="btn btn-primary" type="submit">Zapisz</button>
    </form:form>
</div>

</body>
</html>
