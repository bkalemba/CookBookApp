<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-light bg-light justify-content-between">
    <a class="nav-link" href="/">Strona główna</a>
    <a class="nav-link" href="/admin/">Panel administratora</a>
    <form class="form-inline" method="post" action="/searchByTitle">
        <input type="text" name="toSearch">
        <button class="btn btn-outline-primary" type="submit">Szukaj</button>
    </form>
</nav>