<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="../layout/head.jsp"/>
<jsp:include page="../layout/header.jsp"/>
<body>
<section>
    <h1>${title} 수정</h1>

    <div class="wrapper-notice-write">
        <form id="f" method="post">
            <div class="notice-write">
                <c:if test="${sessionScope.MEMBER_ID eq '1'}">
                    <div style="display: flex; font-size: 12px; margin-bottom: 5px; align-items: center">
                        고정글 여부
                        <select id="b_alt" name="b_alt" class="form-select form-select-sm" style="margin-left: 3px">
                            <option value="N">미등록</option>
                            <option value="Y">등록</option>
                        </select>
                    </div>
                </c:if>

                <c:forEach var="l" items="${list}">
                    <input type="hidden" class="form-control" id="b_id" name="b_id" value="${l.b_id}">
                    <input type="hidden" class="form-control" id="m_id" name="m_id" value="${l.m_id}" readonly>
                    <input type="hidden" class="form-control" value="${l.m_name}" readonly>
                    <input type="hidden" class="form-control" name="n_create_date" value="${l.n_create_date}" readonly>

                    <div class="input-group mb-3">
                        <span class="input-group-text" style="width: 100px">작성자</span>
                        <input type="text" class="form-control" value="${l.m_name}" style="width: 100px" disabled>
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
                        <input type="button" class="btn btn-warning" value="완료" onclick="upd()">
                        <input type="button" class="btn btn-warning" value="취소" onclick="res()">
                        <input type="button" class="btn btn-warning" value="목록" onclick="location.href='/accountbook/${boardName}/list'">
                    </div>
            </div>
        </form>
    </div>
</section>

<script type="text/javascript">
    function res() {
        if(confirm("수정을 취소하시겠습니까?")) {
            location.href ='/accountbook/${boardName}/list/' + $('#b_id').val();
        } else {
        }
    }

    function upd() {
        console.log($('#b_alt').val());
        if(confirm("해당 글을 수정하시겠습니까?")) {
            $.ajax({
                type: 'post',
                url: '/accountbook/${boardName}/update',
                data: {'b_id' : $('#b_id').val(), 'n_title' : $('#n_title').val(), 'n_content' : $('#n_content').val(), 'b_alt' : $('#b_alt').val()},
                success(data) {
                    alert("수정이 완료되었습니다.");
                    location.href ='/accountbook/${boardName}/list/' + $('#b_id').val();
                }
            })
        } else {
            alert("게시글 수정이 취소되었습니다.");
        }
    }
</script>
</body>
</html>