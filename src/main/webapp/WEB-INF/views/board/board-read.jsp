<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="../layout/head.jsp"/>
<jsp:include page="../layout/header.jsp"/>
<body>
<section>
    <h1>${title}</h1>

    <div class="wrapper-notice-write">
        <div class="notice-write">
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
                    <input type="text" class="form-control" value="${l.n_view}" style="" disabled>
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

            <c:choose>
                <c:when test="${boardName eq 'free'}">
                    <c:choose>
                        <c:when test="${heart eq 0}">
                            <div class="wrapper-board-like">
                                    <img id="non-heart" src="<c:url value="/resources/img/nonhearts-icon.png" />" style="cursor: pointer">
                                    <div style="font-size: 14px; font-weight: bold; color: gray">${cnt }</div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="wrapper-board-like">
                                    <img id="heart" src="<c:url value="/resources/img/hearts-icon.png" />" style="cursor: pointer">
                                    <div style="font-size: 14px; font-weight: bold; color: gray">${cnt }</div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>

            <div style="text-align: right">
                <c:if test="${sessionScope.MEMBER_ID eq flag.m_id}">
                    <input type="button" class="btn btn-primary" value="수정" onclick="location.href='/accountbook/${boardName}/update/${flag.b_id}'">
                    <input type="button" class="btn btn-primary" value="삭제" onclick="del()">
                </c:if>

                <input type="button" class="btn btn-primary" value="목록" onclick="location.href='/accountbook/${boardName}/list'">
            </div>

            <c:choose>
            <c:when test="${boardName eq 'notice'}">
            </c:when>
            <c:otherwise>
            <div style="margin-bottom: 20px">
                <h4>댓글</h4>

                <table class="table"> <!-- table-bordered -->
                    <c:choose>
                        <c:when test="${empty comment}">
                            작성된 댓글이 없습니다.
                        </c:when>
                        <c:otherwise>

                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="c" items="${comment}">
                    <input type="hidden" name="c_id" id="c_id" value="${c.c_id}">
                    <tr style="font-size: 11px; font-weight: bold">
                        <td style="width: 15%">${c.m_name}</td>
                        <td style="width: 75%">${c.c_create_date}</td>
                        <td style="width: 45px; text-align: center">
                            <c:if test="${sessionScope.MEMBER_ID eq c.m_id}">
                                <a onclick="window.open('<c:url value='/cmt/update/${c.c_id}' />', '댓글 수정', 'width = 500, height = 500'); return false;" style="cursor: pointer; text-decoration: none; color: gray">수정</a>
                            </c:if>
                        </td>
                        <td style="width: 45px; text-align: center; color: gray">

                            <c:if test="${sessionScope.MEMBER_ID eq c.m_id}">
                                <a id="btn-cmt-delete" style="cursor: pointer; text-decoration: none; color: gray">삭제</a>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">${c.c_content}</td>
                        </c:forEach>
                    </tr>
                </table>
            </div>

            <h4>댓글 작성</h4> <!-- b_id, m_id, , c_create_date -->
            <form id="f">
                <table class="table"> <!-- table-bordered -->
                    <c:forEach var="n" items="${name}">
                        <input type="hidden" value="${n.m_id}">
                        <tr style="font-size: 11px; font-weight: bold">
                            <td style="width: 15%"><c:out value="${n.m_name}" /></td>
                            <td style="width: 75%">${n.n_create_date}</td>
                            <td style="width: 45px; text-align: center"><a id="comment-create" style="cursor: pointer; text-decoration: none; color: gray">등록</a></td>
                            <td style="width: 45px; text-align: center; color: gray"> </td>
                        </tr>
                        <tr>
                            <td colspan="4"><textarea name="c_content" id="c_content" class="form-control" style="height: 100px; resize: none"></textarea></td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
        </c:otherwise>
        </c:choose>
    </div>
</section>

<script type="text/javascript">
    $(document).on('click', '#non-heart', function() {
        $.ajax({
            type: 'post',
            url: '/accountbook/like-insert',
            data: {'b_id' : $('#b_id').val()},
            success(data) {
                location.reload();
            }
        })
    })

    $(document).on('click', '#heart', function() {
        $.ajax({
            type: 'post',
            url: '/accountbook/like-delete',
            data: {'b_id' : $('#b_id').val()},
            success(data) {
                location.reload();
            }
        })
    })

    $(document).on('click', '#comment-create', function() {
        if(!$('#c_content').val()) {
            alert("내용을 작성해주세요.");
        } else {
            if(confirm("댓글을 등록하시겠습니까?")) {
                $.ajax({
                    type: 'post',
                    url: '/accountbook/cmt/insert',
                    data: {'b_id' : $('#b_id').val(), 'c_content' : f.c_content.value},
                    success(data) {
                        alert("댓글이 등록되었습니다.");
                        location.reload();
                    }
                })
            } else {
                alert("등록을 취소하셨습니다.");
            }
        }
    })

    document.querySelectorAll('#btn-cmt-delete').forEach(btn => {
        btn.addEventListener('click', function() {
            if(confirm("삭제된 댓글은 복구할 수 없습니다. 정말로 삭제하시겠습니까?")) {
                const row = this.closest('table');
                const c_id = row.querySelector(`[name = 'c_id']`).value;
                $.ajax({
                    type: 'post',
                    url: '/accountbook/cmt/delete',
                    data: {'c_id' : c_id},
                    success(data) {
                        alert("해당 댓글이 삭제되었습니다.");
                        location.href='/accountbook/${boardName}/list/' + $('#b_id').val();
                    }
                })
            } else {
                alert("댓글 삭제가 취소되었습니다.");
            }
        })
    })

    function del() {
        if(confirm("삭제된 글은 복구할 수 없습니다. 정말로 삭제하시겠습니까?")) {
            // 확인 분기문
            $.ajax({
                type: 'post',
                url: '/accountbook/${boardName}/delete',
                data: {'b_id' : $('#b_id').val()},
                success(data) {
                    alert("해당 게시글이 삭제되었습니다.");
                    location.href='/accountbook/${boardName}/list';
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