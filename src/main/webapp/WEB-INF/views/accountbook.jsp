<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div style="text-align: right; margin-bottom: 5px">
                <input class="btn btn-primary" type="button" name="modify" value="가계부 등록">
            </div>
            <div style="margin-left: 10px">
                <form>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" style="width: 10%; text-align: center">연도월일</th>
                            <th scope="col" style="width: 15%; text-align: center">카테고리명</th>
                            <th scope="col" style="width: 15%; text-align: center">금액</th>
                            <th scope="col" style="width: 25%; text-align: center">메모</th>
                            <th scope="col" style="width: 10%; text-align: center">삭제</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="i" items="${income}">
                        <tr>
                            <td><input type="date" class="form-control form-control-sm"></td>
                            <td>
                                <select name="category" class="form-control form-control-sm">
                                    <option>${i.category}</option>
                                    <c:forEach var="i" items="${income}">
                                        <option>${i.category}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input type="text" name="amount" value="${i.amount}" class="form-control form-control-sm"></td>
                            <td><input type="text" name="memo" class="form-control form-control-sm"></td>
                            <td style="text-align: center"><input type="button" value="삭제" class="btn btn-danger btn-sm"></td>
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
</section>

<script>
    function rowCreate() {
        alert('!');
    }
</script>
</body>
</html>
