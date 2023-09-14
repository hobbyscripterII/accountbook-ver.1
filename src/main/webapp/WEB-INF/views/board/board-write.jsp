<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="../layout/head.jsp"/>
<jsp:include page="../layout/header.jsp"/>
<body>
<section>
    <h1>${title} 작성</h1>

    <div class="wrapper-notice-write">
        <form id="f" method="post">
            <div class="notice-write">
                <c:forEach var="n" items="${name}">
                    <input type="hidden" class="form-control" name="m_id" value="${n.m_id}" readonly>
                    <input type="hidden" class="form-control" value="${n.m_name}" readonly>

                    <div class="input-group mb-3">
                        <span class="input-group-text" style="width: 100px">작성일자</span>
                        <input type="text" class="form-control" name="n_create_date" value="${n.n_create_date}" readonly>
                    </div>
                </c:forEach>

                <div class="input-group mb-3">
                    <span class="input-group-text" style="width: 100px">제목</span>
                    <input type="text" class="form-control" name="n_title">
                </div>

                <div class="input-group mb-3">
                    <span class="input-group-text" style="width: 100px">내용</span>
                    <textarea class="form-control" name="n_content" style="height: 300px; resize: none"></textarea>
                </div>

                <div style="text-align: right">
                    <input type="button" class="btn btn-primary" value="등록" onclick="check()">
                    <input type="button" class="btn btn-primary" value="취소" onclick="location.href='list'">
                </div>
            </div>
        </form>
    </div>
</section>
<script type="text/javascript">
    function check() {
        if(!f.n_create_date.value) {
            alert("작성일자가 입력되지 않았습니다.");
            f.n_create_date.focus();
            return false;
        } else if(!f.n_title.value) {
            alert("제목이 입력되지 않았습니다.");
            f.n_title.focus();
            return false;
        } else if(!f.n_content.value) {
            alert("내용이 입력되지 않았습니다.");
            f.n_content.focus();
            return false;
        } else {
            alert("공지사항 등록이 완료되었습니다.");
            f.submit();
            return true;
        }
    }
</script>
</body>
</html>