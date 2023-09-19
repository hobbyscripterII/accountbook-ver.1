<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <h1>로그인</h1>
    <div style="display: flex; justify-content: center">
        <form id="f" action="login" method="post" style="width: 500px;">
            <label>이메일</label>
            <input type="email" class="form-control" id="m_email" name="m_email">
            <label>비밀번호</label>
            <input type="password" class="form-control" id="m_pwd" name="m_pwd" aria-describedby="pwdHelp">
            <div id="pwdHelp" class="form-text">비밀번호를 입력하세요.</div>
            <div style="display: flex">
            </div>
                <input type="submit" id="login" value="로그인" class="btn btn-success" style="margin: 10px 0 0 0">
                <img onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=cb038f5f9a3ebddca7cc97a4d8f6d398&redirect_uri=http://localhost:8080/accountbook/kakao-login&response_type=code'" src="<c:url value="/resources/img/kakao_login_medium_narrow.png"/>" style="cursor: pointer; height: 40px; margin-top: 10px">
                <img onclick="location.href='https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?client_id=27694742700-um9dmdl7pt1iuig3fnj0sg3k1l9164sf.apps.googleusercontent.com&redirect_uri=http://localhost:8080/accountbook/google-login&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile&service=lso&o2v=1&flowName=GeneralOAuthFlow'" src="<c:url value="/resources/img/btn_google_signin_dark_focus_web.png"/>" style="cursor: pointer; height: 40px; margin-top: 10px">
                <div style="display: flex; align-items: center">
                    <a href="#" class="form-text" style="text-decoration: none">이메일 찾기</a> &nbsp;
                    <a href="#" class="form-text" style="text-decoration: none">비밀번호 찾기</a>
                </div>
        </form>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>