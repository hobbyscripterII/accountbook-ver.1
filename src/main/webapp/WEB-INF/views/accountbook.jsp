<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <h1>ACCOUNT BOOK PAGE</h1>
    <jsp:include page="layout/sheet-tap.jsp">
        <jsp:param name="list" value="${list}"/>
    </jsp:include>
</section>
</body>
</html>