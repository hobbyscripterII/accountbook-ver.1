<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css" rel="stylesheet">

<style>
    section {
        height: 81% !important;
        text-align: center;
    }
</style>

<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <h1>이메일 회원가입 완료</h1>
    <div style="margin-top: 80px">
        <img src="<c:url value="/resources/img/img/img_businessman.png" />">
        <div style="width: 100%; margin-top: 20px">
            <input type="button" value="로그인하러 가기" class="btn btn-primary" onclick="location.href='/accountbook/login'" style="margin-top: 15px">
        </div>
    </div>
</section>
<jsp:include page="layout/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">
    $(function () {
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: '회원가입이 완료되었습니다!',
            showConfirmButton: false,
            timer: 3000
        })
    });
</script>
</body>
</html>
