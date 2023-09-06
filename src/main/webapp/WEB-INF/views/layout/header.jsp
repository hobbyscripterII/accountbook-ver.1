<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <p>가계부 프로젝트</p>
</header>
<nav>
    <a href="<c:url value="/" />">홈</a>
    <a href="<c:url value="/notice/list" />">공지사항</a>
    <a href="<c:url value="/ac/home"/>">가계부</a>

    <c:choose>
        <c:when test="${sessionScope.MEMBER_ID eq null}">
            <a href="<c:url value="/login"/>">로그인</a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value="/logout"/>">로그아웃</a>
        </c:otherwise>
    </c:choose>
</nav>