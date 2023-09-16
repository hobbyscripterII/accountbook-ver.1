<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<jsp:include page="../layout/head.jsp"/>
<jsp:include page="../layout/header.jsp"/>
<body>
<section>
    <h1>${title}</h1>

    <div style="text-align: center; margin: 30px 0 40px 0">
        <div class="btn-group btn-group-lg" role="group" aria-label="Large button group" style="width: 900px">
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='<c:url value="/notice/list" />'">공지사항</button>
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='<c:url value="/free/list" />'">자유 게시판</button>
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='<c:url value="/question/list" />'">질문 게시판</button>
            <button type="button" class="btn btn-outline-secondary" onclick="location.href='<c:url value="/suggest/list" />'">건의 게시판</button>
        </div>
    </div>

    <div class="wrapper-notice-list">
        <div class="notice-list">
            <table class="table">
                <tr style="text-align: center">
                    <td>글 번호</td>
                    <td>제목</td>
                    <td>작성자</td>
                    <td>작성일</td>
                    <c:choose>
                        <c:when test="${boardName eq 'notice' || boardName eq 'question'}">
                        </c:when>
                        <c:otherwise>
                            <td>좋아요</td>
                        </c:otherwise>
                    </c:choose>
                    <td>조회수</td>
                </tr>
                <c:forEach var="c" items="${content}">
                    <c:choose>
                        <c:when test="${c.b_alt eq 'Y'}">
                            <tr style="text-align: center; background-color: lightgray !important;">
                                <td style="font-weight: bold"><c:out value="[공지]"/></td>
                                <td style="text-align: left; font-weight: bold"><a href="<c:url value="list/${c.b_id}" />" style="text-decoration: none; color: black">${c.n_title}</a></td>
                                <td>${c.m_name}</td>
                                <td>${c.n_create_date}</td>
                                <c:choose>
                                    <c:when test="${boardName eq 'notice' || boardName eq 'question'}">
                                    </c:when>
                                    <c:otherwise>
                                        <td>${c.h_cnt } </td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${c.n_view}</td>
                            </tr>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <c:forEach var="c" items="${content}">
                    <tr style="text-align: center">
                        <td><c:out value="${c.b_id}"/></td>
                        <c:choose>
                            <c:when test="${boardName eq 'question'}">
                                <c:choose>
                                    <c:when test="${sessionScope.MEMBER_ID eq '1'}">
                                        <td style="text-align: left"><a href="<c:url value="list/${c.b_id}" />" style="text-decoration: none; color: black">${c.n_title}</a></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td onclick="accessFlag()" style="text-align: left"><a href="<c:url value="list/${c.b_id}" />" style="text-decoration: none; color: black">${c.n_title}</a></td>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <td style="text-align: left"><a href="<c:url value="list/${c.b_id}" />" style="text-decoration: none; color: black">${c.n_title}</a></td>
                            </c:otherwise>
                        </c:choose>
                        <td>${c.m_name}</td>
                        <td>${c.n_create_date}</td>
                        <c:choose>
                            <c:when test="${boardName eq 'notice' || boardName eq 'question'}">
                            </c:when>
                            <c:otherwise>
                                <td>${c.h_cnt} </td>
                            </c:otherwise>
                        </c:choose>
                        <td>${c.n_view}</td>
                    </tr>
                </c:forEach>
            </table>

            <div style="display: flex; justify-content: center">
                <ul class="pagination">
                    <c:if test="${paging.beginPage != 1 }">
                        <li class="page-item">
                            <a class="page-link" href='<c:url value="/${boardName}/list?page=${paging.beginPage -1 }"/>'>&laquo;</a>
                        </li>
                    </c:if>
                    <c:forEach var="p" begin="${paging.beginPage }" end="${paging.endPage }">
                        <li class="page-item">
                            <a class="page-link" href='<c:url value="/${boardName}/list?page=${p }&pageNum=${paging.pageNum }"/>'>${p }</a>
                        </li>
                    </c:forEach>
                    <c:if test="${paging.endPage != paging.totalPage }">
                        <li class="page-item">
                            <a class="page-link" href='<c:url value="/${boardName}/list?page=${paging.endPage +1 }"/>'>&raquo;</a>
                        </li>
                    </c:if>
                </ul>
            </div>

            <c:choose>
                <c:when test="${empty sessionScope.MEMBER_ID}">

                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${boardName eq 'notice'}">
                            <c:if test="${sessionScope.MEMBER_ID eq '1'}">
                                <div style="text-align: right">
                                    <input type="button" class="btn btn-primary" value="작성" onclick="location.href='write'">
                                </div>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <div style="text-align: right">
                                <input type="button" class="btn btn-primary" value="작성" onclick="location.href='write'">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>
<script type="text/javascript">
    function accessFlag() {
        alert("질문글은 작성자와 관리자만 읽기 가능합니다.");
    }
</script>
</body>
</html>