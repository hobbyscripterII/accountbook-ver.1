<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <c:choose>
        <c:when test="${not empty sessionScope.MEMBER_ID}">
            <h1>${name}님 환영합니다.</h1>
        </c:when>
        <c:otherwise>
            <h1>가계부에 오신 것을 환영합니다.</h1>
        </c:otherwise>
    </c:choose>
</section>
</body>
</html>