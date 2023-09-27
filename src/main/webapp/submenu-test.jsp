<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="WEB-INF/views/layout/head.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-submenu/3.0.1/css/bootstrap-submenu.min.css">

<body>
<div class="col-sm-5 mb-3">
    <button class="btn btn-secondary dropdown-toggle btn-test" type="button" data-toggle="dropdown" data-submenu>테스트</button>
    <div class="dropdown-menu">
        <div class="dropdown dropright dropdown-submenu">
            <button class="dropdown-item dropdown-toggle" type="button" data-toggle="dropdown">수입</button>
            <div class="dropdown-menu">
                <button class="dropdown-item btn-category" type="button" data-id="A01" data-name="기본급">기본급</button>
                <div class="dropdown dropright dropdown-submenu">
                </div>
                <button class="dropdown-item btn-category" type="button" data-id="A02" data-name="상여금">상여금</button>
<%--                <button class="dropdown-item" type="button" disabled>Disabled action</button>--%>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.3.slim.js" defer></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-submenu/3.0.1/js/bootstrap-submenu.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.js" defer></script>
<script type="text/javascript">
    $(function() {
        $('[data-submenu]').submenupicker();

        $('.btn-category').on('click', function() {
            console.log($(this).data('id'));
            $('.btn-test').text($(this).data('name'));
        });
    });
</script>
</body>
</html>