<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-16">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
</head>
<body>
<form action="${pageContext.request.contextPath}/" method="get">
    <input type="submit" value="Назад"/>
</form>
<c:if test="${products.size()==0}">
    Здессь пока что ничего нет

</c:if>
<c:if test="${products.size()>0}">
    Список продуктов:
    <table>
        <tr>
            <th>Название</th>
            <th>Цена</th>
            <th>Количество</th>
            <th>Заказать</th>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.amount}</td>
                <td>
                    <form action="/cartOrder" method="post">
                        <input type="submit" value="Заказать">
                        <input type="hidden" value="${product.id}" name="id">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    <form action="/userProductsListFind" method="post">
        <input type="text" placeholder="Найти" name="find" pattern="[a-zA-Zа-яА-ЯёЁ0-9 /-]{1,}"/>
        <span class="form__error" style="text-align: center">Поле поиска не может содержать спецсимволы</span>
        <input type="submit" value="Найти">
    </form>
</c:if>
</body>
</html>
