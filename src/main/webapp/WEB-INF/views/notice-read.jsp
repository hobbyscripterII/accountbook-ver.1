<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <h1>NOTICE READ</h1>

    <div class="wrapper-notice-write">
        <form id="f" method="post">
            <div class="notice-write">
                <c:forEach var="l" items="${list}">
                    <input type="hidden" class="form-control" id="n_id" name="n_id" value="${l.n_id}">
                    <input type="hidden" class="form-control" id="m_id" name="m_id" value="${l.m_id}" readonly>
                    <input type="hidden" class="form-control" value="${l.m_name}" readonly>
                    <input type="hidden" class="form-control" name="n_create_date" value="${l.n_create_date}" readonly>

                    <div class="input-group mb-3">
                        <span class="input-group-text" style="width: 100px">작성일자</span>
                        <input type="text" class="form-control" value="${l.n_create_date}" style="width: 210px" disabled>
                        <span class="input-group-text" style="width: 100px">조회수</span>
                        <input type="text" class="form-control" value="${l.n_view}" style="text-align: center" disabled>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text" style="width: 100px">제목</span>
                        <input type="text" class="form-control" id="n_title" name="n_title" value="${l.n_title}" disabled>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text" style="width: 100px">내용</span>
                        <textarea class="form-control" id="n_content" name="n_content" style="height: 300px; resize: none" disabled>${l.n_content}</textarea>
                    </div>
                </c:forEach>

                    <div style="text-align: right">
                <c:if test="${sessionScope.MEMBER_ID eq flag.m_id}">
                        <input type="button" class="btn btn-primary" value="수정" onclick="location.href='/accountbook/notice/update/${flag.n_id}'">
                        <input type="button" class="btn btn-primary" value="삭제" onclick="del()">
                </c:if>
                        <input type="button" class="btn btn-primary" value="목록" onclick="location.href='/accountbook/notice/list'">
                    </div>
            </div>
        </form>
    </div>
</section>

<script>
    function del() {
        if(confirm("삭제된 글은 복구할 수 없습니다. 정말로 삭제하시겠습니까?")) {
            // 확인 분기문
            $.ajax({
                type: 'post',
                url: '/accountbook/notice/delete',
                data: {'n_id' : $('#n_id').val()},
                success(data) {
                    alert("해당 게시글이 삭제되었습니다.");
                    location.href='/accountbook/notice/list';
                }
            })
        } else {
            // 취소 분기문
            alert("게시글 삭제가 취소되었습니다.");
        }
    }
</script>
</body>
</html>