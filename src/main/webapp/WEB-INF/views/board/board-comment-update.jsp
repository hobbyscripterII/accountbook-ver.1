<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="../layout/head.jsp"/>

<style>
    section {
        padding-top: 0;
    }
</style>

<body>
<section>
    <div style="background-color: darkblue">
        <h4 style="color: white; padding: 5px 0 5px 5px">댓글 수정</h4>
    </div>
    <div style="margin: 5px 0 5px 5px; width: 98vw;">
            <input type="hidden" id="c_id" name="c_id" value="${comment.c_id}">
            <textarea id="c_content" name="c_content" class="form-control" style=" height: 300px; resize: none">${comment.c_content}</textarea>
            <div style="text-align: right; margin-top: 5px">
                <input type="button" id="comment-update" class="btn btn-primary" value="수정">
            </div>
    </div>
</section>

<script>
    $(document).on('click', '#comment-update', function() {
        if(confirm("댓글을 수정하시겠습니까?")) {
            $.ajax({
                type: 'post',
                url: '/accountbook/cmt/update',
                data: {'c_id' : $('#c_id').val(), 'c_content' : $('#c_content').val()},
                success(data) {
                    alert("댓글이 수정되었습니다.");
                    window.close();
                    opener.location.reload();
                }
            })
        } else {
            alert("수정을 취소하셨습니다.");
            window.close();
        }
    })
</script>
</body>
</html>