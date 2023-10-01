<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>
<div class="div-account-book-list">
    <div class="btn-group dropup" role="group" style="margin: 2px">
        <button type="button" class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            가계부 관리
        </button>

        <ul class="dropdown-menu">
            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modal-month-create" style="text-align: center">가계부 추가</a></li>
            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modal-month-delete" style="text-align: center">가계부 삭제</a></li>
        </ul>
    </div>
    <c:forEach var="l" items="${list}">
        <input type="hidden" name="m_id" value="${l.m_id}">
        <input type="button" class="btn btn-dark" name="a_code" value="${l.a_code}" onclick="location.href = `/accountbook/mt/${l.m_id}/${l.a_code}`">
    </c:forEach>
</div>

<div class="modal" id="modal-month-create" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">알림</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <p>추가할 가계부의 년월을 입력해주세요.</p>
                    <input type="text" class="form-control" id="a_code_create" name="a_code_create" pattern="[0-9]{6}" placeholder="'-' 생략한 6자리 년월 (202309)" />
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="month-create-flag" class="btn btn-danger">확인</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal-month-delete" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">알림</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <p>삭제할 가계부의 년월을 선택해주세요.</p>
                    <select class="form-control" id="a_code_delete">
                        <option class="form-control" value="null"> </option>
                        <c:forEach var="l" items="${list}">
                            <option value="${l.a_code}">${l.a_code}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="month-delete-flag" class="btn btn-danger" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-custom-class="custom-tooltip" data-bs-title="신중히 선택하세요.">확인</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
</body>

<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

    $(document).on('click', '#month-create-flag', function() {
        if(confirm('생성할 가계부 코드는 [' + $('#a_code_create').val() + ']입니다. 확인 버튼을 눌러주세요.')) {
            $.ajax({
                type: 'post',
                url: '/accountbook/ac/insert',
                data: {'a_code' : $('#a_code_create').val()},
                success(data) {
                    alert('추가가 완료되었습니다.');
                    location.reload();
                }
            })
        } else {
            alert('등록이 취소되었습니다.');
        }
    })

    $(document).on('click', '#month-delete-flag', function() {
        if($('#a_code_delete').val() == 'null') {
            alert('삭제할 가계부가 선택되지 않았습니다.');
        } else {
            if(confirm('삭제할 가계부 코드는 [' + $('#a_code_delete').val() + ']입니다. 확인 버튼을 눌러주세요.')) {
                $.ajax({
                    type: 'post',
                    url: '/accountbook/ac/delete',
                    data: {'a_code' : $('#a_code_delete').val()},
                    success(data) {
                        alert('삭제가 완료되었습니다.');
                        location.reload();
                    }
                })
            } else {
                alert('삭제가 취소되었습니다.');
            }
        }
    })
</script>
</html>
