<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/resources/style/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/style/default.css" rel="stylesheet">
    <title>CookBookApp</title>
</head>
<body>
<jsp:include page="fragments/navbar.jsp"/>
<div class="container">
    <form method="post" action="/searchByProducts">
        <div class="row justify-content-md-center">
            <div class="col-2"></div>
            <div class="col">
                <h3>Mięsa</h3>
                <c:forEach items="${meats}" var="product">
                    <input type="checkbox" name="${product.name}" value="${product.id}">${product.name}<br>
                </c:forEach>
            </div>
            <div class="col">
                <h3>Owoce</h3>
                <c:forEach items="${fruits}" var="product">
                    <input type="checkbox" name="${product.name}" value="${product.id}">${product.name}<br>
                </c:forEach>
            </div>
            <div class="col">
                <h3>Warzywa</h3>
                <c:forEach items="${vegetables}" var="product">
                    <input type="checkbox" name="${product.name}" value="${product.id}">${product.name}<br>
                </c:forEach>
            </div>

        </div>
        <div class="row justify-content-md-center">
            <button type="submit">Szukaj</button>
        </div>
    </form>

</div>
</body>
</html>
