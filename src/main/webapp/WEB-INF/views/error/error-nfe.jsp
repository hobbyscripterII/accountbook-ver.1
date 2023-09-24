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
    <img src="<c:url value="/resources/img/icon/icon_warning.png" />" style="width: 150px">
    <h2>잘못된 접근입니다.</h2>
    <h2>잠시 후 다시 이용해주세요.</h2>
</section>
</body>
</html>