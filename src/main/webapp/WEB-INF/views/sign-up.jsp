<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.min.css" rel="stylesheet">

<style>
    section {
        height: 81% !important;
    }

    .wrapper-sign-up {
        display: flex;
        justify-content: center;
    }

    .label-sign-up {
        margin: 15px 0 5px 0;
    }

    .text-errors {
        color: red;
    }

    .form-errors {
        width: 500px;
        border: 1px solid #D50000;
    }
</style>

<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <h1>이메일 회원가입</h1>
    <div class="wrapper-sign-up">
        <div class="wrapper-form-sign-up">
            <form:form id="f" modelAttribute="signUpDto" action="sign-up" method="post" style="width: 500px;">
            <textarea class="form-control" style="width: 500px; resize: none" disabled>이용약관 개인정보 수집 및 이용, 마케팅 활용 선택에 어쩌고 저쩌고 이래서 이렇게 할 것입니다.</textarea>
            <div style="margin: 10px 0 10px 0">
                <input type="checkbox" id="m_accept" name="m_accept" value="Y" class="form-check-input" style="margin-right: 5px">이용약관 개인정보 수집 및 이용, 마케팅 활용 선택에 모두 동의합니다.
                <div style="height: 30px; padding-left: 21px"><form:errors path="m_accept" cssClass="text-errors" /></div>
            </div>

                <label class="label-sign-up">이메일</label>
                <form:errors path="m_email" cssClass="text-errors" />
                <form:input type="email" path="m_email" class="form-control" id="m_email" name="m_email" cssErrorClass="form-errors form-control" />
                <label class="label-sign-up">비밀번호</label>
                <form:errors path="m_pwd" cssClass="text-errors" />
                <form:input type="password" path="m_pwd" class="form-control" id="m_pwd" name="m_pwd" cssErrorClass="form-errors form-control" />
                <label class="label-sign-up">닉네임</label>
                <form:errors path="m_name" cssClass="text-errors" />
                <form:input type="text" path="m_name" class="form-control" id="m_name" name="m_name" cssErrorClass="form-errors form-control" />
                <input type="button" id="login" value="회원가입" class="btn btn-primary" style="width: 100%; margin: 10px 0 0 0">
            </form:form>
        </div>
    </div>
</section>
<jsp:include page="layout/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.28/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">
    $(document).on('click', '#login', function() {
        const email = $('#m_email').val();
        const pwd = $('#m_pwd').val();
        const name = $('#m_name').val();

        if(m_accept.checked == false) {
            Swal.fire({
                icon: 'error',
                title: '알림',
                text: '이용약관에 체크하지 않으셨습니다.'
            })
            m_accept.focus();
        } else if(!email) {
            Swal.fire({
                icon: 'error',
                title: '알림',
                text: '이메일을 입력하지 않으셨습니다.'
            })
            email.focus();
        } else if(!pwd) {
            Swal.fire({
                icon: 'error',
                title: '알림',
                text: '비밀번호를 입력하지 않으셨습니다.'
            })
            pwd.focus();
        } else if(!name) {
            Swal.fire({
                icon: 'error',
                title: '알림',
                text: '닉네임을 입력하지 않으셨습니다.'
            })
        } else {
            f.submit();
        }
    });
</script>
</body>
</html>