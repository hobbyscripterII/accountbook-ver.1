<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value="/resources/css/chart.css?=v3" />">
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
    <div class="account-book" style="display: flex; width: 100%">
        <div class="wrapper-account-book">
            <div class="table-side">
                <form>
                    <div class="wrapper-change-setting">
                        <p class="d-inline-flex gap-1">
                            <button class="btn btn-outline-dark" type="button" data-bs-toggle="modal" data-bs-target="#modal-budget-create" style="font-size: 13px; margin-right: 5px">
                                가계부 예산 추가 및 수정
                            </button>
                        </p>
                        <p class="d-inline-flex gap-1">
                            <button class="btn btn-outline-dark" type="button"  style="font-size: 13px">
                                사용자 정의 카테고리 추가 및 수정
                            </button>
                        </p>
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
                            <c:set var="totalAmountFix" value="0" />
                            <c:set var="totalPercentageFix" value="100" />
                            <c:forEach var="f_" items="${fix}" varStatus="status">
                                <c:set var="totalAmountFix" value="${totalAmountFix + f_.m_amount}" />
                                <c:set var="totalPercentageFix" value="${totalAmountFix}" />
                            </c:forEach>
                            <td><fmt:formatNumber value="${budget.b_fix - totalAmountFix}" pattern="###,###,###원"/></td>
                            <td><fmt:formatNumber value="${totalAmountFix / budget.b_fix * 100}" pattern="0.00" />%</td>
                        </tr>
                        <tr style="text-align: center">
                            <td>비고정지출</td>
                            <c:set var="totalAmountNonFix" value="0" />
                            <c:set var="totalPercentageNonFix" value="100" />
                            <c:forEach var="nf_" items="${nonFix}" varStatus="status">
                                <c:set var="totalAmountNonFix" value="${totalAmountNonFix + nf_.m_amount}" />
                                <c:set var="totalPercentageNonFix" value="${totalAmountNonFix}" />
                            </c:forEach>
                            <td><fmt:formatNumber value="${budget.b_nonfix - totalAmountNonFix}" pattern="###,###,###원"/></td>
                            <td><fmt:formatNumber value="${totalAmountNonFix / budget.b_nonfix * 100}" pattern="0.00" />%</td>
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
                        <c:set var="totalAmount" value="0" />
                        <c:set var="totalPercentage" value="100" />
                        <c:forEach var="i_" items="${income}" varStatus="status">
                            <c:set var="totalAmount" value="${totalAmount + i_.m_amount}" />
                        </c:forEach>
                        <c:forEach var="i" items="${income}" varStatus="status">
                            <tr style="text-align: center">
                                <td><c:out value="${i.c_name}" /></td>
                                <td><fmt:formatNumber value="${i.m_amount}" pattern="###,###,###원"/></td>
                                <td><fmt:formatNumber value="${i.m_amount / totalAmount * 100}" pattern="0.00" />%</td>
                            </tr>
                        </c:forEach>
                        <tr style="text-align: center">
                            <td style="font-weight: bold; text-align: center">합계</td>
                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>
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
                        <c:set var="totalPercentage" value="100" />
                        <c:forEach var="s_" items="${save}" varStatus="status">
                            <c:set var="totalAmount" value="${totalAmount + s_.m_amount}" />
                        </c:forEach>
                        <c:forEach var="s" items="${save}" varStatus="status">
                            <tr style="text-align: center">
                                <td><c:out value="${s.c_name}" /></td>
                                <td><fmt:formatNumber value="${s.m_amount}" pattern="###,###,###원"/></td>
                                <td><fmt:formatNumber value="${s.m_amount / totalAmount * 100}" pattern="0.00" />%</td>
                            </tr>
                        </c:forEach>
                        <tr style="text-align: center">
                            <td style="font-weight: bold; text-align: center">합계</td>
                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>
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
                        <c:set var="totalPercentage" value="100" />
                        <c:forEach var="f_" items="${fix}" varStatus="status">
                            <c:set var="totalAmount" value="${totalAmount + f_.m_amount}" />
                            <c:set var="totalPercentage" value="${totalPercentage}" />
                        </c:forEach>
                        <c:forEach var="f" items="${fix}" varStatus="status">
                            <tr style="text-align: center">
                                <td><c:out value="${f.c_name}" /></td>
                                <td><fmt:formatNumber value="${f.m_amount}" pattern="###,###,###원"/></td>
                                <td><fmt:formatNumber value="${f.m_amount / totalAmount * 100}" pattern="0.00" />%</td>
                            </tr>
                        </c:forEach>
                        <tr style="text-align: center">
                            <td style="font-weight: bold; text-align: center">합계</td>
                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>
                        </tr>
                        </tbody>
                    </table>
                    <!-- 비고정지출 테이블 정보 -->
                    <table class="table">
                        <tr>
                            <th colspan="3" style="text-align: center">비고정지출</th>
                        </tr>
                        <tr>
                            <th scope="col" style="text-align: center">카테고리</th>
                            <th scope="col" style="text-align: center">금액</th>
                            <th scope="col" style="text-align: center">퍼센티지</th>
                        </tr>
                        <c:set var="totalAmount" value="0" />
                        <c:set var="totalPercentage" value="100" />
                        <c:forEach var="nff_" items="${nonFix}" varStatus="status">
                            <c:set var="totalAmount" value="${totalAmount + nff_.m_amount}" />
                        </c:forEach>
                        <c:forEach var="nff" items="${nonFix}" varStatus="status">
                            <tr style="text-align: center">
                                <td><c:out value="${nff.c_name}" /></td>
                                <td><fmt:formatNumber value="${nff.m_amount}" pattern="###,###,###원"/></td>
                                <td><fmt:formatNumber value="${nff.m_amount / totalAmount * 100}" pattern="0.00" />%</td>
                            </tr>
                        </c:forEach>
                        <tr style="text-align: center">
                            <td style="font-weight: bold; text-align: center">합계</td>
                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>
                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>
                        </tr>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center">비고정지출<div style="color:gray">식비</div></th>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th scope="col" style="text-align: center">카테고리</th>--%>
<%--                            <th scope="col" style="text-align: center">금액</th>--%>
<%--                            <th scope="col" style="text-align: center">퍼센티지</th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nff_" items="${nonFixFood}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nff_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nff" items="${nonFixFood}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nff.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nff.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nff.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">생활</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nfl_" items="${nonFixLife}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nfl_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nfl" items="${nonFixLife}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nfl.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nfl.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nfl.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">교통</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nft_" items="${nonFixTraffic}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nft_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nft" items="${nonFixTraffic}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nft.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nft.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nft.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">정기 결제</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nfr_" items="${nonFixRegular}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nfr_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nfr" items="${nonFixRegular}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nfr.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nfr.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nfr.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">패션</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nffa_" items="${nonFixFashion}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nffa_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nffa" items="${nonFixFashion}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nffa.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nffa.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nffa.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">뷰티</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nfb_" items="${nonFixBeauty}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nfb_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nfb" items="${nonFixBeauty}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nfb.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nfb.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nfb.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">문구</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nfp_" items="${nonFixPhrase}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nfp_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nfp" items="${nonFixPhrase}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nfp.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nfp.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nfp.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">교육</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nfe_" items="${nonFixEdu}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nfe_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nfe" items="${nonFixEdu}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nfe.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nfe.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nfe.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">문화</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nfc_" items="${nonFixCulture}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nfc_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nfc" items="${nonFixCulture}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nfc.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nfc.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nfc.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">건강</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nfh_" items="${nonFixHealth}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nfh_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nfh" items="${nonFixHealth}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nfh.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nfh.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nfh.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <th colspan="3" style="text-align: center"><div style="color:gray">기타</div></th>--%>
<%--                        </tr>--%>
<%--                        <c:set var="totalAmount" value="0" />--%>
<%--                        <c:set var="totalPercentage" value="100" />--%>
<%--                        <c:forEach var="nfe_" items="${nonFixEtc}" varStatus="status">--%>
<%--                            <c:set var="totalAmount" value="${totalAmount + nfe_.m_amount}" />--%>
<%--                        </c:forEach>--%>
<%--                        <c:forEach var="nfe" items="${nonFixEtc}" varStatus="status">--%>
<%--                            <tr style="text-align: center">--%>
<%--                                <td><c:out value="${nfe.c_name}" /></td>--%>
<%--                                <td><fmt:formatNumber value="${nfe.m_amount}" pattern="###,###,###원"/></td>--%>
<%--                                <td><fmt:formatNumber value="${nfe.m_amount / totalAmount * 100}" pattern="0.00" />%</td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        <tr style="text-align: center">--%>
<%--                            <td style="font-weight: bold; text-align: center">합계</td>--%>
<%--                            <td><fmt:formatNumber value="${totalAmount}" pattern="###,###,###원"/></td>--%>
<%--                            <td><fmt:formatNumber value="${totalPercentage}" pattern="0.00" />%</td>--%>
<%--                        </tr>--%>
                    </table>
                </form>
            </div>
        </div>

        <div class="wrapper-table-write">
            <h2>월별 가계부</h2>
            <div style="margin-left: 10px; margin-right: 3px">
                <div style="text-align: right; margin-bottom: 5px">
                </div>
                <form action="insert" id="form" method="post" style="overflow: auto; height: 70vh; padding-bottom: 10px">
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
                                <input type="hidden" id="mo_id" name="mo_id" value="${t.mo_id}">
                                <input type="hidden" id="m_id" name="m_id" value="${t.m_id}">
                                <input type="hidden" id="a_id" name="a_id" value="${t.a_id}">
                                <input type="hidden" id="a_code" name="a_code" value="${t.a_code}">
                                <fmt:parseDate var="d_date" value="${t.d_date}" pattern="yyyy-mm-dd" />
                                <td><input type="date" id="d_date" name="d_date" value="<fmt:formatDate value="${d_date}" pattern="yyyy-mm-dd"/>" class="form-control form-control-sm"></td>
                                <td>
                                    <select id="c_code" name="c_code" class="form-control form-control-sm ">
                                        <option value="${t.c_code}">${t.c_name}</option>
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
    </div>
    <jsp:include page="layout/sheet-tap.jsp"/>

    <div class="btn-click" style="display: block; width: 30px">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-caret-left-fill" viewBox="0 0 16 16">
            <path d="m3.86 8.753 5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z"/>
        </svg>
    </div>

    <div class="chart">
        <div style="width: 100%">
            <input type="button" id="btn-compare" class="btn btn-warning" value="내 평균 지출 금액과 다른 사용자의 평균 지출 금액 비교하기" style="width: 100%; margin-bottom: 10px" />
        </div>
        <div id="chart-income" class="chart-top"> </div>
        <div id="chart-save" class="chart-top"> </div>
        <div id="chart-fix" class="chart-top"> </div>
        <div id="chart-nonfix" class="chart-bottom" style="z-index: 99"> </div>
    </div>

    <div class="modal" id="modal-row-delete" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
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
        <div class="modal-dialog modal-dialog-centered">
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
        <div class="modal-dialog modal-dialog-centered">
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

    <div class="modal fade" id="modal-budget-create" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">가계부 예산 추가 및 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <div class="btn-group" role="group" style="display: flex; width: 100%; text-align: center">
                            <input type="radio" class="btn-check" name="b_cover" id="b_cover" value="ALL" autocomplete="off" checked>
                            <label class="btn btn-outline-dark" for="b_cover">기존 예산</label>
<%--                            <input type="radio" class="btn-check" name="b_cover" id="b_cover" autocomplete="off">--%>
<%--                            <label class="btn btn-outline-dark" for="b_cover">특정 예산</label>--%>
                        </div>

                        <div style="display: flex; width: 100%; text-align: center; margin-top: 20px">
                                <span class="span-budget-modal-text">고정 지출</span>
                                <input type="text" class="form-control" name="b_fix" id="b_fix" value="${budget.b_fix}">
                        </div>
                        <div style="display: flex; width: 100%; text-align: center; margin-top: 20px">
                                <span class="span-budget-modal-text">비고정 지출</span>
                                <input type="text" class="form-control" name="b_nonfix" id="b_nonfix" value="${budget.b_nonfix}">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" value="확인" id="budget-flag" class="btn btn-danger">
                    <input type="button" value="취소" class="btn btn-primary" data-bs-dismiss="modal">
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript" src="../../resources/js/month.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script type="text/javascript">
    $(document).on('click', '#budget-flag', function() {
        if(!$('#b_fix').val()) {
            alert('고정지출 예산 금액을 입력하지 않으셨습니다.');
        } else if(!$('#b_nonfix').val()) {
            alert('비고정지출 예산 금액을 입력하지 않으셨습니다.');
        }
        else {
            console.log($('#b_cover').val());
            console.log($('#b_fix').val());
            console.log($('#b_nonfix').val());

            $.ajax({
                type: 'post',
                url: '/accountbook/update-budget',
                data: {'b_cover' : $('#b_cover').val(), 'b_fix' : $('#b_fix').val(), 'b_nonfix' : $('#b_nonfix').val()},
                success: function() {
                    alert('기초 예산 수정이 완료되었습니다.');
                    location.reload();
                },
                error: function(request, status, error) {
                    console.log(request);
                    console.log(status);
                    console.log(error);
                }
            })
        }
    })

    document.getElementById("btn-compare").addEventListener("click", function() {
        const url = "/accountbook/mt/amount-compare";
        window.open(url, " ", "width=1900,height=1500");
    });

    function rowCreate() {
        var dynamic_tr =
            '<tr>' +
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
            '<input type="hidden" id="m_id" name="m_id" value="${accountBook[0].m_id}">' +
            '<input type="hidden" id="a_code" name="a_code" value="${accountBook[0].a_code}">' +
            '</tr>';

        $('.form-table').append(dynamic_tr);
    }

    const income = [
        <c:forEach var="i" items="${income}" varStatus="status">
        {
            category: "${i.c_name}",
            amount: ${i.m_amount}
        },
        </c:forEach>
    ];

    const incomeData = [];
    income.forEach(item => {
        incomeData.push([item.category, item.amount]);
    });

    Highcharts.chart('chart-income', {
        title: {
            text: '수입'
        },
        xAxis: {
            categories: incomeData,
        },
        colors: ['#FF0000', '#FF4500', '#FFD700', '#006400', '#00008B', '#2E0854', '#4B0082'],
        series: [{
            type: 'pie',
            name: '수입',
            allowPointSelect: true,
            data: incomeData,
            showInLegend: true,
            dataLabels: {
                enabled: true,
                formatter: function() {
                    return this.point.name + ': ' + Highcharts.numberFormat(this.y, 0, '', ',') + '₩';
                }
            }
        }],
        tooltip: {
            pointFormatter: function() {
                return '<span style="color:' + this.color + '">\u25CF</span> ' + this.series.name + ':' + Highcharts.numberFormat(this.y, 0, '.', ',') + '￦';
            }
        }
    });

    const save = [
        <c:forEach var="s" items="${save}" varStatus="status">
        {
            category: "${s.c_name}", amount: ${s.m_amount}
        },
        </c:forEach>
    ];

    const saveData = [];
    save.forEach(item => {
        saveData.push([item.category, item.amount]);
    });

    Highcharts.chart('chart-save', {
        title: {
            text: '저축'
        },
        xAxis: {
            categories: saveData,
        },
        colors: ['#00008B', '#006400', '#FFD700', '#FF4500', '#FF0000', '#4B0082', '#2E0854'],
        series: [{
            type: 'pie',
            name: '저축',
            allowPointSelect: true,
            data: saveData,
            showInLegend: true,
            dataLabels: {
                enabled: true,
                formatter: function() {
                    return this.point.name + ': ' + Highcharts.numberFormat(this.y, 0, '', ',') + '₩';
                }
            }
        }],
        tooltip: {
            pointFormatter: function() {
                return '<span style="color:' + this.color + '">\u25CF</span> ' + this.series.name + ':' + Highcharts.numberFormat(this.y, 0, '.', ',') + '￦';
            }
        }
    });

    const fix = [
        <c:forEach var="f" items="${fix}" varStatus="status">
        {
            category: "${f.c_name}",
            amount: ${f.m_amount}
        },
        </c:forEach>
    ];

    const fixData = [];
    fix.forEach(item => {
        fixData.push([item.category, item.amount]);
    });

    Highcharts.chart('chart-fix', {
        title: {
            text: '고정지출'
        },
        xAxis: {
            categories: fixData,
        },
        colors: ['#FF0000', '#FF4500', '#FFD700', '#006400', '#00008B', '#2E0854', '#4B0082'],
        series: [{
            type: 'pie',
            name: '고정지출',
            allowPointSelect: true,
            data: fixData,
            showInLegend: true,
            dataLabels: {
                enabled: true,
                formatter: function() {
                    return this.point.name + ': ' + Highcharts.numberFormat(this.y, 0, '', ',') + '₩';
                }
            }
        }],
        tooltip: {
            pointFormatter: function() {
                return '<span style="color:' + this.color + '">\u25CF</span> ' + this.series.name + ':' + Highcharts.numberFormat(this.y, 0, '.', ',') + '￦';
            }
        }
    });

    const nonFix = [
        <c:forEach var="m" items="${member}" varStatus="status">
        {
            category: "${m.category}",
            amount: ${m.amount}
        },
        </c:forEach>
    ];

    const nonFixCategory = [];
    nonFix.forEach(item => {
        nonFixCategory.push(item.category);
    });
    const nonFixAmount = [];
    nonFix.forEach(item => {
        nonFixAmount.push(item.amount);
    });

    Highcharts.chart('chart-nonfix', {
        title: {
            text: '비고정지출'
        },
        xAxis: {
            categories: nonFixCategory,
        },
        colors: ['#8B0000', '#FF4500', '#FFD700', '#006400', '#00008B', '#2E0854', '#4B0082'],
        series: [{
            type: 'column',
            name: '비고정지출',
            colorByPoint: true,
            allowPointSelect: true,
            data: nonFixAmount,
            showInLegend: false,
            dataLabels: {
                enabled: true,
                formatter: function() {
                    return Highcharts.numberFormat(this.y, 0, '', ',') + '￦';
                }
            }
        }],
        yAxis: {
            labels: {
                formatter: function() {
                    return Highcharts.numberFormat(this.value, 0, '', ',') + '￦';
                }
            }
        },
        tooltip: {
            zIndex: 9999,
            pointFormatter: function() {
                return '<span style="color:' + this.color + '">\u25CF</span> ' + this.series.name + ':' + Highcharts.numberFormat(this.y, 0, '.', ',') + '￦';
            }
        }
    });
</script>
</body>
</html>