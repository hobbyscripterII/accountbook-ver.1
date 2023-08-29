<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="frm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>
<body>
<section>
    <div class="wrapper-account-book">
<%--        <div class="table-side">--%>
<%--            <form>--%>
<%--                <div style="width: 500px; text-align: right; margin-bottom: 5px">--%>
<%--                    <input class="btn btn-primary" type="button" name="modify" value="카테고리 수정">--%>
<%--                    <input class="btn btn-primary" type="button" name="result" value="등록">--%>
<%--                </div>--%>

<%--                <table class="table">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th colspan="3" scope="col" style="text-align: center">예산 측정</th>--%>
<%--                    </tr>--%>
<%--                    <tr style="text-align: center">--%>
<%--                        <th scope="col">카테고리</th>--%>
<%--                        <th scope="col">남은 금액</th>--%>
<%--                        <th scope="col">퍼센티지</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <tr style="text-align: center">--%>
<%--                        <td>고정지출</td>--%>
<%--                        <td></td>--%>
<%--                        <td></td>--%>
<%--                    </tr>--%>
<%--                    <tr style="text-align: center">--%>
<%--                        <td>비고정지출</td>--%>
<%--                        <td></td>--%>
<%--                        <td></td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </form>--%>

<%--            <form>--%>
<%--                <table class="table">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th colspan="3" style="text-align: center; padding-top: 90px">수입</th>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th scope="col" style="text-align: center">카테고리</th>--%>
<%--                        <th scope="col" style="text-align: center">금액</th>--%>
<%--                        <th scope="col" style="text-align: center">퍼센티지</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach var="i" items="${income}">--%>
<%--                        <tr>--%>
<%--                            <td><c:out value="${i.category}"/></td>--%>
<%--                            <td><c:out value="${i.amount}"/></td>--%>
<%--                            <td></td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                    <tr>--%>
<%--                        <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                        <td></td>--%>
<%--                        <td></td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </form>--%>
<%--        </div>--%>

        <div class="wrapper-write">
            <h2>월별 가계부</h2>
            <div style="margin-left: 10px">
            <div style="text-align: right; margin-bottom: 5px">
            </div>
                <form action="insert" id="form" method="post">
<%--                    <input id="submit" class="btn btn-primary" type="button" value="가계부 등록">--%>
                    <table class="table">
                        <thead>
                        <tr>
<%--                            <th scope="col" style="width: 10%; text-align: center">일련코드</th>--%>
                            <th scope="col" style="width: 10%; text-align: center">연도월일</th>
                            <th scope="col" style="width: 15%; text-align: center">카테고리명</th>
                            <th scope="col" style="width: 15%; text-align: center">금액</th>
                            <th scope="col" style="width: 25%; text-align: center">메모</th>
                            <th scope="col" style="width: 10%; text-align: center">추가/수정</th>
                            <th scope="col" style="width: 10%; text-align: center">삭제</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="m" items="${month}">
                        <tr>
                            <input type="hidden" id="m_id" name="m_id" value="${m.m_id}">
                            <input type="hidden" id="a_id" name="a_id" value="${m.a_id}" class="form-control form-control-sm" disabled>
                            <frm:parseDate var="d_date" value="${m.d_date}" pattern="yyyy-mm-dd" />
                            <td><input type="date" id="d_date" name="d_date" value="<fmt:formatDate value="${d_date}" pattern="yyyy-mm-dd" />" class="form-control form-control-sm" disabled></td>
                            <td>
                                <select class="form-control form-control-sm" disabled>
                                        <option id="c_code" name="c_code" value="${m.c_code}">${m.c_name}</option>
                                    <c:forEach var="c" items="${category}">
                                        <option value="${c.c_code}">${c.c_name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input id="m_amount" name="m_amount" type="text" value="${m.m_amount}" class="form-control form-control-sm" disabled></td>
<%--                            <td><input id="m_amount" name="m_amount" type="text" value="<fmt:formatNumber value="${m.m_amount}" pattern="###,###,###원"/>" class="form-control form-control-sm" disabled></td>--%>
                            <td><input id="m_memo" name="m_memo" type="text" value="${m.m_memo}" class="form-control form-control-sm" disabled></td>
                            <td style="text-align: center"><input type="button" id="modify" value="수정" data-bs-toggle="modal" data-bs-target="" class="btn btn-primary btn-sm"></td>
                            <td style="text-align: center"><input type="button" id="delete" value="삭제" data-bs-toggle="modal" data-bs-target="#modal-row-delete" class="btn btn-danger btn-sm"></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
                <div style="text-align: right; margin-bottom: 5px">
                    <input class="btn btn-primary" type="button" value="열 추가" onclick="rowCreate()">
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="modal-row-delete" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">알림</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <p>삭제된 데이터는 복구할 수 없습니다.</p>
                        <p>삭제하시겠습니까?</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="delete-flag" class="btn btn-danger">확인</button>
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="modal-row-create" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">알림</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <p>추가하시겠습니까?</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="create-flag" class="btn btn-danger">확인</button>
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function rowCreate() {
        var dynamic_tr =
            '<tr>' +
            '<input type="hidden" id="m_id" name="m_id" value="1" class="form-control form-control-sm" readonly>' +
            '<input type="hidden" id="a_id" name="a_id" value="202308" class="form-control form-control-sm" readonly>' + // 추후, 가계부 년월 아이디 버튼으로 값 가져오기
            '<td><input type="date" id="d_date" name="d_date" class="form-control form-control-sm"></td>' +
            '<td>' +
            '<select id="c_code" name="c_code" class="form-control form-control-sm">' +
            '<option></option>' +
            '<c:forEach var="c" items="${category}">' +
            '<option value="${c.c_code}">${c.c_name}</option>' +
            '</c:forEach>' +
            '</select>' +
            '</td>' +
            '<td><input id="m_amount" name="m_amount" type="text" class="form-control form-control-sm"></td>' +
            '<td><input id="m_memo" name="m_memo" type="text" value="${m.m_memo}" class="form-control form-control-sm"></td>' +
            '<td style="text-align: center"><input type="button" id="create" value="추가" data-bs-toggle="modal" data-bs-target="#modal-row-create" class="btn btn-primary btn-sm"></td>' +
            '<td style="text-align: center"><input type="button" id="delete" value="삭제" data-bs-toggle="modal" data-bs-target="#modal-row-delete" class="btn btn-danger btn-sm"></td>' +
            '</tr>';

        $('tbody').append(dynamic_tr);
    }

    $(document).on('click', '#create', function() {
        const cre = document.querySelectorAll('#create');
        const row = this.closest('tr');
        const m_id = row.querySelector(`[name = 'm_id']`).value;
        const a_id = row.querySelector(`[name = 'a_id']`).value;
        const d_date = row.querySelector(`[name = 'd_date']`).value;
        const c_code = row.querySelector(`[name = 'c_code']`).value;
        const m_amount = row.querySelector(`[name = 'm_amount']`).value;
        const m_memo = row.querySelector(`[name = 'm_memo']`).value;
        const btn = document.querySelectorAll('#create-flag')

        btn.forEach(btn => {
            btn.addEventListener('click', function() {
                $.ajax({
                    type: 'post',
                    url: 'insert',
                    data: {'m_id' : m_id, 'a_id' : a_id, 'd_date': d_date, 'c_code':c_code ,'m_amount' :m_amount , 'm_memo':m_memo},
                    success(data) {
                        alert('추가가 완료되었습니다.');
                        location.reload();
                    }
                })
            })
        })
    })

    const del = document.querySelectorAll('#delete');
    del.forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            const m_id = row.querySelector(`[name = 'm_id']`).value;
            const btn = document.querySelectorAll('#delete-flag');

            btn.forEach(btn => {
                btn.addEventListener('click', function() {
                    $.ajax({
                        type: 'post',
                        url: 'delete',
                        data: {'m_id' : m_id},
                        success(data) {
                            alert('삭제가 완료되었습니다.');
                            location.reload();
                        }
                    })
                })
            })
        })
    })
</script>
</body>
</html>
