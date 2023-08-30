<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <div class="div-account-book-list">
        <input class="btn btn-dark" type="button" name="" value="가계부 추가">
            <c:forEach var="l" items="${list}">
                    <input type="hidden" name="m_id" value="${l.m_id}">
                    <input type="button" class="btn btn-primary" name="a_code" value="${l.a_code}" onclick="location.href = `/accountbook/mt/${l.m_id}/${l.a_code}`">
            </c:forEach>
    </div>

    <h1>ACCOUNT BOOK PAGE</h1>
</section>
</body>
</html>