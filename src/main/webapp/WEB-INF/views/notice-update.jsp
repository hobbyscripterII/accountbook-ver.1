<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <h1>NOTICE MODIFY</h1>

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
                        <input type="text" class="form-control" id="n_title" name="n_title" value="${l.n_title}">
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text" style="width: 100px">내용</span>
                        <textarea class="form-control" id="n_content" name="n_content" style="height: 300px; resize: none">${l.n_content}</textarea>
                    </div>
                </c:forEach>

                    <div style="text-align: right">
                        <input type="button" class="btn btn-primary" value="수정" onclick="upd()">
                        <input type="button" class="btn btn-primary" value="취소" onclick="res()">
                        <input type="button" class="btn btn-primary" value="목록" onclick="location.href='/accountbook/notice/list'">
                    </div>
            </div>
        </form>
    </div>
</section>

<script>
    function res() {
        if(confirm("수정을 취소하시겠습니까?")) {
            location.href ='/accountbook/notice/list/' + $('#n_id').val();
        } else {
        }
    }

    function upd() {
        if(confirm("해당 글을 수정하시겠습니까?")) {
            $.ajax({
                type: 'post',
                url: '/accountbook/notice/update',
                data: {'n_id' : $('#n_id').val(), 'n_title' : $('#n_title').val(), 'n_content' : $('#n_content').val()},
                success(data) {
                    alert("수정이 완료되었습니다.");
                    location.href ='/accountbook/notice/list/' + $('#n_id').val();
                }
            })
        } else {
            alert("게시글 수정이 취소되었습니다.");
        }
    }
</script>
</body>
</html>