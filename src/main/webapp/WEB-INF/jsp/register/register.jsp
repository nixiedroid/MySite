<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
    <title>Title</title>

</head>

<body>
<div class="container text-center">
    <div>
        <h1>Регистрация пользователя</h1>
    </div>
    <springForm:form method="post" action="/registerProcess" modelAttribute="user" cssClass="form">
        <div class="form__field">
            <springForm:input placeholder="Логин" path="username" required="true"/>
            <springForm:errors path="username" cssClass="error"/>
        </div>
        <div class="form__field">
            <springForm:password placeholder="Пароль" path="password" required="true"/>
            <springForm:errors path="password" cssClass="error"/>
        </div>
        <div class="form__field">
            <springForm:input placeholder="Имя" path="firstname" required="true"/>
            <springForm:errors path="firstname" cssClass="error"/>
        </div>
        <div class="form__field">
            <springForm:input placeholder="Фамилия" path="lastname" required="true"/>
            <springForm:errors path="lastname" cssClass="error"/>
        </div>
        <div>
            <button type="submit">Зарегистрироваться</button>
        </div>
    </springForm:form>
</div>
</body>
</html>
