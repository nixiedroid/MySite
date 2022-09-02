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
<h1> Привет Админ</h1>
Зашифровать пароль:
<form action="/adminEncrypt" method="post">
    <p>Пароль: <label>
        <input type="text" name="password"/>
    </label></p>
    <p><input type="submit"/></p>
</form>
<c:if test="${encoded != null}">
    Вывод: ${encoded}
</c:if>
</body>
</html>
