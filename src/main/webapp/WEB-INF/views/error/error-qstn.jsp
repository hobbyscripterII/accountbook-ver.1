<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="../layout/head.jsp"/>
<jsp:include page="../layout/header.jsp"/>

<style>
    section {
        text-align: center;
        padding-top: 200px;
    }
</style>

<body>
<section>
    <img src="<c:url value="/resources/img/warning.png" />" style="width: 150px">
    <h2>질문 글은 작성자와 관리자만 읽기 가능합니다.</h2>
    <input type="button" class="btn btn-primary" value="돌아가기" onclick="location.href='/accountbook/question/list'">
</section>
</body>
</html>