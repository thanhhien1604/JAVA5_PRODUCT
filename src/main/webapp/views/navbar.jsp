<%@page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head></head>
<body>

<nav class="navbar navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="">Home</a>
        <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
        <div class=" mt-2"  style="font-size: 17px" id="userNameContainer" ><span>${sessionScope.quyen}, ${userName}</span></div>
        <a href="/logout"  id="signupLink">
            <button class="btn " style="background-color: cornflowerblue" onclick="if(!(confirm('Ban co muon dang xuat khong?'))) return false">LogOut</button>
        </a>
    </div>
</nav>
</body>
</html>