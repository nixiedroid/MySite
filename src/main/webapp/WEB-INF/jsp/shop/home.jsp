<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
    <meta charset="UTF-16">
    <title>Title</title>
</head>
<body>
<div class="container text-center">
    <sec:authorize access="isAuthenticated()">
        <h3>Привет ${username}</h3>
        <sec:authorize access="hasAnyRole('ROLE_EDITOR')">
            <form action="/usersList" method="get">
                <input type="submit" value="Список пользователей">
            </form>
            <form action="/productsList" method="get">
                <input type="submit" value="Каталог продуктов">
            </form>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_USER')">
            <form action="/userProductsList" method="get">
                <input type="submit" value="Каталог продуктов">
            </form>
            <form action="/cart" method="get">
                <input type="submit" value="Корзина">
            </form>
            <form action="/user" method="get">
                <input type="submit" value="Страница пользователя">
            </form>
        </sec:authorize>
        <form action="${pageContext.request.contextPath}/logout" method="post">
            <input type="submit" value="Logout"/>
        </form>
    </sec:authorize>

    <sec:authorize access="!isAuthenticated()">
        <h3>Добро пожаловать! <br> Вам необходимо войти в аккаунт или зарегистрироваться</h3>
        <div>
            <a href="${pageContext.request.contextPath}/register">Регистрация</a>
            <a href="${pageContext.request.contextPath}/login">Вход</a>
        </div>
    </sec:authorize>

</div>
<c:if test="${products.size()>0}">
    Наиболее часто заказываемые продукты:
    <table>
        <tr>
            <th>Название</th>
            <th>Цена</th>
            <sec:authorize access="isAuthenticated()">
                <th>Количество</th>
                <sec:authorize access="hasAnyRole('ROLE_USER')">
                    <th>Заказать</th>
                </sec:authorize>
            </sec:authorize>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <sec:authorize access="isAuthenticated()">
                    <td>${product.amount}</td>
                    <sec:authorize access="hasAnyRole('ROLE_USER')">
                        <td>
                            <form action="/cartOrder" method="post">
                                <input type="submit" value="Заказать">
                                <input type="hidden" value="${product.id}" name="id">
                            </form>
                        </td>
                    </sec:authorize>
                </sec:authorize>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>