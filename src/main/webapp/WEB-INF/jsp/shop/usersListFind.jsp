<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<c:if test="${listUsers.size()==0}">
    Ничего не найдено

</c:if>
<c:if test="${listUsers.size()>0}">
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

                                <form action="/usersListEdit" method="post">
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
</c:if>
</body>
</html>
