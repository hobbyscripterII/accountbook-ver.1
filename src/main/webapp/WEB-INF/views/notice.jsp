<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <h1>NOTICE LIST</h1>

    <div class="wrapper-notice-list">
        <div class="notice-list">
            <table class="table">
                <tr style="text-align: center">
                    <td>글 번호</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <td>조회수</td>
                </tr>
                <c:forEach var="l" items="${list}">
                    <tr style="text-align: center">
                        <td>${l.n_id}</td>
                        <td style="text-align: left"><a href="<c:url value="list/${l.n_id}" />">${l.n_title}</a></td>
                        <td>${l.m_name}</td>
                        <td>${l.n_create_date}</td>
                        <td>${l.n_view}</td>
                    </tr>
                </c:forEach>
            </table>

            <c:if test="${sessionScope.MEMBER_ID eq '1'}">
                <div style="text-align: right">
                    <input type="button" class="btn btn-primary" value="작성" onclick="location.href='write'">
                </div>
            </c:if>
        </div>
    </div>
</section>
</body>
</html>