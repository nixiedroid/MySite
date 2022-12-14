<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-16">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
</head>
<body>
<form action="${pageContext.request.contextPath}/usersList" method="get">
    <input type="submit" value="Назад"/>
</form>
<c:if test="${orders.size()==0}">
    Пользователь ничего не заказывал

</c:if>
<c:if test="${orders.size()>0}">
    Список заказов:
    <table>
        <tr>
            <th>Название</th>
            <th>Количество</th>
            <th>Общая цена</th>
            <th>Дата</th>
        </tr>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.productName}</td>
                <td>${order.amount}</td>
                <td>${order.totalPrice}</td>
                <td>
                        ${order.orderDate}
                </td>
                <td>
                    <form action="/orderDelete" method="post">
                        <input type="submit" value="Удалить">
                        <input type="hidden" value="${order.id}" name="orderId">
                        <input type="hidden" value="${userId}" name="userId">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>