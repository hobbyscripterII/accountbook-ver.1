<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="layout/head.jsp"/>
<jsp:include page="layout/header.jsp"/>

<style>
    section {
        display: flex;
    }
</style>

<body>
<section>
    <div class="div-account-book-list">
        <input class="btn btn-dark" type="button" name="" value="가계부 추가">
            <c:forEach var="l" items="${list}">
                    <input type="hidden" name="m_id" value="${l.m_id}">
                    <input type="button" class="btn btn-primary" name="a_code" value="${l.a_code}" onclick="location.href = `/accountbook/mt/${l.m_id}/${l.a_code}`">
            </c:forEach>
    </div>

    <div class="wrapper-account-book">
        <div class="table-side">
            <form>
                <div style="width: 500px; text-align: right; margin-bottom: 5px">
<%--                    <input class="btn btn-primary" type="button" name="modify" value="카테고리 수정">--%>
<%--                    <input class="btn btn-primary" type="button" name="result" value="등록">--%>
                </div>

                <table class="table">
                    <thead>
                    <tr>
                        <th colspan="3" scope="col" style="text-align: center">예산 측정</th>
                    </tr>
                    <tr style="text-align: center">
                        <th scope="col">카테고리</th>
                        <th scope="col">남은 금액</th>
                        <th scope="col">퍼센티지</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr style="text-align: center">
                        <td>고정지출</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr style="text-align: center">
                        <td>비고정지출</td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </form>

            <form>
                <!-- 수입 테이블 정보 -->
                <table class="table">
                    <thead>
                    <tr>
                        <th colspan="3" style="text-align: center">수입</th>
                    </tr>
                    <tr>
                        <th scope="col" style="text-align: center">카테고리</th>
                        <th scope="col" style="text-align: center">금액</th>
                        <th scope="col" style="text-align: center">퍼센티지</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="totalAmount" value="0" /> <!-- 변수 초기화 -->
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="i" items="${income}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${i.c_name}" /></td>
                            <td><fmt:formatNumber value="${i.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${i.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + i.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + i.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    </tbody>
                </table>
                <!-- 저축 테이블 정보 -->
                <table class="table">
                    <thead>
                    <tr>
                        <th colspan="3" style="text-align: center">저축</th>
                    </tr>
                    <tr>
                        <th scope="col" style="text-align: center">카테고리</th>
                        <th scope="col" style="text-align: center">금액</th>
                        <th scope="col" style="text-align: center">퍼센티지</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="s" items="${save}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${s.c_name}" /></td>
                            <td><fmt:formatNumber value="${s.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${s.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + s.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + s.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    </tbody>
                </table>
                <!-- 고정지출 테이블 정보 -->
                <table class="table">
                    <thead>
                    <tr>
                        <th colspan="3" style="text-align: center">고정지출</th>
                    </tr>
                    <tr>
                        <th scope="col" style="text-align: center">카테고리</th>
                        <th scope="col" style="text-align: center">금액</th>
                        <th scope="col" style="text-align: center">퍼센티지</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="f" items="${fix}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${f.c_name}" /></td>
                            <td><fmt:formatNumber value="${f.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${f.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + f.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + f.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    </tbody>
                </table>
                <!-- 비고정지출 테이블 정보 -->
                <table class="table">
                    <tr>
                        <th colspan="3" style="text-align: center">비고정지출<div style="color:gray">식비</div></th>
                    </tr>
                    <tr>
                        <th scope="col" style="text-align: center">카테고리</th>
                        <th scope="col" style="text-align: center">금액</th>
                        <th scope="col" style="text-align: center">퍼센티지</th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nff" items="${nonFixFood}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nff.c_name}" /></td>
                            <td><fmt:formatNumber value="${nff.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nff.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nff.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nff.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">생활</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nfl" items="${nonFixLife}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nfl.c_name}" /></td>
                            <td><fmt:formatNumber value="${nfl.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nfl.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nfl.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nfl.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">교통</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nft" items="${nonFixTraffic}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nft.c_name}" /></td>
                            <td><fmt:formatNumber value="${nft.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nft.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nft.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nft.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">정기 결제</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nfr" items="${nonFixRegular}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nfr.c_name}" /></td>
                            <td><fmt:formatNumber value="${nfr.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nfr.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nfr.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nfr.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">패션</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nffa" items="${nonFixFashion}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nffa.c_name}" /></td>
                            <td><fmt:formatNumber value="${nffa.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nffa.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nffa.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nffa.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">뷰티</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nfb" items="${nonFixBeauty}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nfb.c_name}" /></td>
                            <td><fmt:formatNumber value="${nfb.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nfb.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nfb.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nfb.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">문구</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nfp" items="${nonFixPhrase}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nfp.c_name}" /></td>
                            <td><fmt:formatNumber value="${nfp.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nfp.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nfp.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nfp.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">교육</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nfe" items="${nonFixEdu}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nfe.c_name}" /></td>
                            <td><fmt:formatNumber value="${nfe.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nfe.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nfe.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nfe.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">문화</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nfc" items="${nonFixCulture}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nfc.c_name}" /></td>
                            <td><fmt:formatNumber value="${nfc.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nfc.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nfc.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nfc.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">건강</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nfh" items="${nonFixHealth}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nfh.c_name}" /></td>
                            <td><fmt:formatNumber value="${nfh.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nfh.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nfh.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nfh.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                    <tr>
                        <th colspan="3" style="text-align: center"><div style="color:gray">기타</div></th>
                    </tr>
                    <c:set var="totalAmount" value="0" />
                    <c:set var="totalPercentage" value="0" />
                    <c:forEach var="nfe" items="${nonFixEtc}" varStatus="status">
                        <tr style="text-align: center">
                            <td><c:out value="${nfe.c_name}" /></td>
                            <td><fmt:formatNumber value="${nfe.m_amount}" pattern="###,###,###원"/></td>
                            <td><c:out value="${nfe.m_percentage}" />%</td>
                        </tr>
                        <c:set var="totalAmount" value="${totalAmount + nfe.m_amount}" />
                        <c:set var="totalPercentage" value="${totalPercentage + nfe.m_percentage}" />
                    </c:forEach>
                    <tr style="text-align: center">
                        <td style="font-weight: bold; text-align: center">합계</td>
                        <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                        <td><c:out value="${totalPercentage}" />%</td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

        <div class="wrapper-table-write">
            <h2>월별 가계부</h2>
            <div style="margin-left: 10px">
            <div style="text-align: right; margin-bottom: 5px">
            </div>
                <form action="insert" id="form" method="post">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col" style="width: 10%; text-align: center">연도월일</th>
                            <th scope="col" style="width: 15%; text-align: center">카테고리명</th>
                            <th scope="col" style="width: 15%; text-align: center">금액</th>
                            <th scope="col" style="width: 25%; text-align: center">메모</th>
                            <th scope="col" style="width: 10%; text-align: center">추가/수정</th>
                            <th scope="col" style="width: 10%; text-align: center">삭제</th>
                        </tr>
                        </thead>
                        <tbody class="form-table">
                        <c:forEach var="t" items="${table}">
                        <tr>
                            <input type="hidden" id="m_id" name="m_id" value="${t.m_id}">
                            <input type="hidden" id="me_id" name="me_id" value="${t.me_id}">
                            <input type="hidden" id="a_id" name="a_id" value="${t.a_id}">
                            <input type="hidden" id="a_code" name="a_code" value="${t.a_code}">
                            <fmt:parseDate var="d_date" value="${t.d_date}" pattern="yyyy-mm-dd" />
                            <td><input type="date" id="d_date" name="d_date" value="<fmt:formatDate value="${d_date}" pattern="yyyy-mm-dd"/>" class="form-control form-control-sm"></td>
                            <td>
                                <select id="category" class="form-control form-control-sm">
                                        <option id="c_code" name="c_code" value="${t.c_code}">${t.c_name}</option>
                                    <c:forEach var="c" items="${category}">
                                        <option value="${c.c_code}">${c.c_name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input id="m_amount" name="m_amount" type="text" value="${t.m_amount}" class="form-control form-control-sm"></td>
<%--                            <td><input id="m_amount" name="m_amount" type="text" value="<fmt:formatNumber value="${m.m_amount}" pattern="###,###,###원"/>" class="form-control form-control-sm" disabled></td>--%>
                            <td><input id="m_memo" name="m_memo" type="text" value="${t.m_memo}" class="form-control form-control-sm"></td>
                            <td style="text-align: center"><input type="button" id="update" value="수정" data-bs-toggle="modal" data-bs-target="#modal-row-update" class="btn btn-primary btn-sm"></td>
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

    <div class="modal" id="modal-row-update" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">알림</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <p>수정된 데이터는 복구할 수 없습니다.</p>
                        <p>수정하시겠습니까?</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="update-flag" class="btn btn-danger">확인</button>
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

<script type="text/javascript">
    $(document).on('click', '#create', function() {
        const cre = document.querySelectorAll('#create');
        const row = this.closest('tr');
        const me_id = row.querySelector(`[name = 'me_id']`).value;
        const a_id = row.querySelector(`[name = 'a_id']`).value;
        const a_code = row.querySelector(`[name = 'a_code']`).value;
        const d_date = row.querySelector(`[name = 'd_date']`).value;
        const c_code = row.querySelector(`[name = 'c_code']`).value;
        const m_amount = row.querySelector(`[name = 'm_amount']`).value;
        const m_memo = row.querySelector(`[name = 'm_memo']`).value;
        const btn = document.querySelectorAll('#create-flag')

        btn.forEach(btn => {
            btn.addEventListener('click', function() {
                $.ajax({
                    type: 'post',
                    url: '/accountbook/mw/insert',
                    data: {'me_id' : me_id, 'a_id' : a_id, 'a_code' : a_code, 'd_date': d_date, 'c_code': c_code ,'m_amount' :m_amount , 'm_memo':m_memo},
                    success(data) {
                        alert('추가가 완료되었습니다.');
                        location.reload();
                    }
                })
            })
        })
    })

    $(document).on('click', '#update', function() {
        // $('#d_date').attr('disabled', false);
        // $('#category').attr('disabled', false);
        // $('#m_amount').attr('disabled', false);
        // $('#m_memo').attr('disabled', false);

        const mod = document.querySelectorAll('#update');
        const row = this.closest('tr');
        const m_id = row.querySelector(`[name = 'm_id']`).value;
        const me_id = row.querySelector(`[name = 'me_id']`).value;
        const d_date = row.querySelector(`[name = 'd_date']`).value;
        const c_code = row.querySelector(`[name = 'c_code']`).value;
        const m_amount = row.querySelector(`[name = 'm_amount']`).value;
        const m_memo = row.querySelector(`[name = 'm_memo']`).value;
        const btn = document.querySelectorAll('#update-flag')

        btn.forEach(btn => {
            btn.addEventListener('click', function() {
                $.ajax({
                    type: 'post',
                    url: '/accountbook/mw/update',
                    data: {'m_id' : m_id, 'me_id' : me_id, 'd_date': d_date, 'c_code':c_code ,'m_amount' :m_amount , 'm_memo':m_memo},
                    success(data) {
                        alert('수정이 완료되었습니다.');
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
                        url: '/accountbook/mw/delete',
                        data: {'m_id' : m_id},
                        success(data) {
                            alert('삭제가 완료되었습니다.');
                            location.reload();
                        }, error() {

                        }
                    })
                })
            })
        })
    })

    function rowCreate() {
        var dynamic_tr =
            '<tr>' +
            // '<input type="hidden" id="m_id" name="m_id" value="1" class="form-control form-control-sm" readonly>' +
            // '<input type="hidden" id="a_id" name="a_id" value="202308" class="form-control form-control-sm" readonly>' + // 추후, 가계부 년월 아이디 버튼으로 값 가져오기
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
            '<td><input id="m_memo" name="m_memo" type="text" class="form-control form-control-sm"></td>' +
            '<td style="text-align: center"><input type="button" id="create" value="추가" data-bs-toggle="modal" data-bs-target="#modal-row-create" class="btn btn-primary btn-sm"></td>' +
            '<td style="text-align: center"><input type="button" id="delete" value="삭제" data-bs-toggle="modal" data-bs-target="#modal-row-delete" class="btn btn-danger btn-sm"></td>' +
            '<input type="hidden" id="a_id" name="a_id" value="${accountBook[0].a_id}">' +
            '<input type="hidden" id="me_id" name="me_id" value="${accountBook[0].m_id}">' +
            '<input type="hidden" id="a_code" name="a_code" value="${accountBook[0].a_code}">' +
            '</tr>';

        $('.form-table').append(dynamic_tr);
    }
</script>
</body>
</html>