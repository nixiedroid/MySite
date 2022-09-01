<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/>
    <title>Title</title>
</head>
<body>
<div class="container text-center">
    <h3>Вы успешно зарегистрировались!</h3>
    <h4><a href="${pageContext.request.contextPath}/login">Нажмите сюда для перехода на страницу входа</a></h4>
    <p>Login: <input type="text" name="username" value="${username}" readonly/></p>
    <p>First Name: <input type="text" name="firstname" value="${firstname}" readonly/></p>
    <p>Last Name: <input type="text" name="lastname" value="${lastname}" readonly/></p>

</div>
</body>
</html>
