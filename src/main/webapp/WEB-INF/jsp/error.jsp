<%@ page import="com.hypnotoid.MySite.HttpStatusCode" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-16" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-16">
    <title>
        <%=response.getStatus()%>
    </title>
</head>
<body>
<h2>
    <%=response.getStatus()%>
</h2>
<%=HttpStatusCode.getByValue(response.getStatus())%>
</body>
</html>
