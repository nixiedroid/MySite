<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
    <meta charset="UTF-16">
    <title>Title</title>
</head>
<body>
<div>
    <form action="${pageContext.request.contextPath}/" method="get">
        <input type="submit" value="Назад"/>
    </form>
</div>
<div>
    <h1>Список пользователей</h1>
</div>

<div>
    <table>
        <tr>
            <th>ID</th>
            <th>Логин</th>
            <th>Имя</th>
            <th>Фамилия</th>
            <th>Включен</th>
            <th>Редактор</th>
            <th>Заказы</th>
            <th>Удалить</th>
            <th>Изменить</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.firstname}</td>
                <td>${user.lastname}</td>
                <td>
                    <form>
                        <c:choose>
                            <c:when test="${user.enabled}">
                                <input type="checkbox" onclick="return false;" checked>
                            </c:when>
                            <c:when test="${!user.enabled}">
                                <input type="checkbox" onclick="return false;">
                            </c:when>
                        </c:choose>
                    </form>
                </td>
                <td>
                    <form>
                        <c:choose>
                            <c:when test="${user.roleEditor}">
                                <input type="checkbox" onclick="return false;" checked>
                            </c:when>
                            <c:when test="${!user.roleEditor}">
                                <input type="checkbox" onclick="return false;">
                            </c:when>
                        </c:choose>
                    </form>
                </td>

                <sec:authorize access="not hasRole('ROLE_ADMIN')">
                    <c:if test="${!user.roleEditor}">
                        <td>
                            <form action="/orders" method="post">
                                <input type="submit" value="Заказы">
                                <input type="hidden" value="${user.id}" name="id">
                            </form>
                        </td>
                        <td>
                            <c:if test="${loggedUserId != user.id}">
                                <form action="/usersListDelete" method="post">
                                    <input type="submit" value="Удалить">
                                    <input type="hidden" value="${user.id}" name="id">
                                </form>
                            </c:if>
                        </td>
                        <td>
                            <form action="/usersListSave" method="post">
                                <input type="submit" value="Изменить">
                                <input type="hidden" value="${user.id}" name="id">
                            </form>
                        </td>
                    </c:if>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <td>
                        <form action="/orders" method="post">
                            <input type="submit" value="Заказы">
                            <input type="hidden" value="${user.id}" name="id">
                        </form>
                    </td>
                    <td>
                        <c:if test="${loggedUserId != user.id}">
                            <form action="/usersListDelete" method="post">
                                <input type="submit" value="Удалить">
                                <input type="hidden" value="${user.id}" name="id">
                            </form>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${loggedUserId != user.id}">
                            <form action="/usersListSave" method="post">
                                <input type="submit" value="Изменить">
                                <input type="hidden" value="${user.id}" name="id">
                            </form>
                        </c:if>
                    </td>
                </sec:authorize>
            </tr>
        </c:forEach>
    </table>
</div>
<c:if test="${user.id == 0}"> Добавить пользователя: </c:if>
<c:if test="${user.id != 0}"> Изменить пользователя: </c:if>
<springForm:form method="post" action="/usersListSaveProcess" modelAttribute="user">
    <div>
        <springForm:input placeholder="Логин" path="username" required="true"/></div>
    <div><springForm:errors path="username" cssClass="error"/></div>

    <div><springForm:password placeholder="Пароль" path="password" required="true"/></div>
    <div><springForm:errors path="password" cssClass="error"/></div>

    <div><springForm:input placeholder="Имя" path="firstname" required="true"/></div>
    <div><springForm:errors path="firstname" cssClass="error"/></div>

    <div><springForm:input placeholder="Фамилия" path="lastname" required="true"/></div>
    <div><springForm:errors path="lastname" cssClass="error"/></div>

    <c:if test="${loggedUserId != user.id}">
        <div> Включен:
            <springForm:checkbox path="enabled"/></div>
        <div><springForm:errors path="enabled" cssClass="error"/></div>
    </c:if>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <c:if test="${loggedUserId != user.id}">
            <div>Редактор:</div>
            <div><springForm:checkbox path="roleEditor"/></div>
            <div><springForm:errors path="roleEditor" cssClass="error"/>
            </div>
        </c:if>
    </sec:authorize>
    <springForm:hidden path="id"/>
    <button type="submit">Сохранить</button>
</springForm:form>
<form action="/usersListFind" method="post">
    <input type="text" placeholder="Найти" name="find" pattern="[a-zA-Zа-яА-ЯёЁ]+"/>
    <span class="form__error" style="text-align: center">Поле поиcка не может содержать спецсимволы</span>
    <div><input type="submit" value="Найти"></div>
</form>
</body>
</html>
