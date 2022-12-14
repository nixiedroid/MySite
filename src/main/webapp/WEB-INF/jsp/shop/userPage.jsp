<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-16" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
    <meta charset="UTF-16">
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/" method="get">
    <input type="submit" value="Назад"/>
</form>
<form action="/myOrders" method="get">
    <input type="submit" value="Заказы">
</form>
Изменить пользователя:
<springForm:form method="post" action="/userEdit" modelAttribute="user">
    <div>
        <springForm:input placeholder="Логин" path="username" required="true"/>
        <springForm:errors path="username" cssClass="error"/>
    </div>
    <div>
        <springForm:password placeholder="Пароль" path="password" required="true"/>
        <springForm:errors path="password" cssClass="error"/>
    </div>
    <div>
        <springForm:input placeholder="Имя" path="firstname" required="true"/>
        <springForm:errors path="firstname" cssClass="error"/>
    </div>
    <div>
        <springForm:input placeholder="Фамилия" path="lastname" required="true"/>
        <springForm:errors path="lastname" cssClass="error"/>
    </div>
    <springForm:hidden path="id"/>
    <button type="submit">SAVE</button>
</springForm:form>
<form action="/userDelete" method="post">
    <input type="submit" value="Удалить">
    <input type="hidden" value="${user.id}" name="id">
</form>
</body>
</html>
