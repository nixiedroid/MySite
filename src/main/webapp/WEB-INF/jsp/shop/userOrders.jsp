<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-16">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
</head>
<body>
<form action="${pageContext.request.contextPath}/user" method="get">
    <input type="submit" value="Назад"/>
</form>
<c:if test="${orders.size()==0}">
    Здессь пока что ничего нет

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
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>