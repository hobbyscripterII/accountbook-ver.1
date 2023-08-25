<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <h1>로그인</h1>
    <div style="display: flex; justify-content: center">
        <form action="login" method="post" style="width: 500px;">
            <label>이메일</label>
            <input type="email" class="form-control" name="email">
            <label>비밀번호</label>
            <input type="password" class="form-control" name="pwd" aria-describedby="pwdHelp">
            <div id="pwdHelp" class="form-text">비밀번호를 입력하세요.</div>
            <div style="display: flex">
                <input type="submit" value="로그인" class="btn btn-success" style="margin: 10px 10px 0 0">
                <div style="display: flex; align-items: center">
                    <a href="#" class="form-text" style="text-decoration: none">이메일 찾기</a> &nbsp;
                    <a href="#" class="form-text" style="text-decoration: none">비밀번호 찾기</a>
                </div>
            </div>
        </form>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"/>
</body>
</html>