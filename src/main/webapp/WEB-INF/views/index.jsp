<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 17691
  Date: 2019-07-14
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>index</p>
<c:forEach items="${questions}" var="i">
    <p>${i.questionContent}</p>
</c:forEach>
</body>
</html>
