<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    a:hover {
        text-decoration: none;
        color: white;
    }
</style>

<header>
    <p><a href="<c:url value="/" />">말랑이 가계부</a></p>
</header>
<nav>
    <a href="<c:url value="/" />">홈</a>
    <a href="<c:url value="/notice/list" />">공지사항</a>
    <a href="<c:url value="/free/list" />">자유 게시판</a>
    <a href="<c:url value="/question/list" />">질문 게시판</a>
    <a href="<c:url value="/suggest/list" />">건의 게시판</a>
    <a href="<c:url value="/ac/home"/>">가계부</a>

    <c:choose>
        <c:when test="${sessionScope.MEMBER_ID eq null}">
            <a href="<c:url value="/login"/>">로그인</a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value="/logout"/>">로그아웃</a>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${empty sessionScope.MEMBER_ID}">
            <div class="btn-sign-up" style="width: 200px;">
                <div class="emoji">
                    💗💗💗💗💗
                </div>
                <a href="<c:url value="/sign-up"/>">회원가입</a>
            </div>
        </c:when>
        <c:otherwise>
            <p style="width: 200px; height: 40px; font-size: 12px; cursor: default">${sessionScope.MEMBER_NAME}님💖 오늘도 좋은하루 되세요!</p>
        </c:otherwise>
    </c:choose>

</nav>