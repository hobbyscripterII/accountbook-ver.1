<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="../layout/head.jsp"/>
<jsp:include page="../layout/header.jsp"/>

<body>
<section>
    <h1>${title} 작성</h1>

    <div class="wrapper-notice-write">
        <form id="f" action="/accountbook/${boardName}/write" method="post">
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
                    <input type="button" id="btn-register" class="btn btn-warning" value="등록">
                    <input type="button" class="btn btn-warning" value="취소" onclick="location.href='list'">
                </div>
            </div>
        </form>
    </div>
</section>
<script type="text/javascript">
    $(document).on('click', '#btn-register', function() {
        if (!f.n_create_date.value) {
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
            alert("게시글 등록이 완료되었습니다.");
            f.submit();
            return true;
        }
    });
</script>
</body>
</html>