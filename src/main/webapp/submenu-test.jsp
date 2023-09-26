<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="WEB-INF/views/layout/head.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-submenu/3.0.1/css/bootstrap-submenu.min.css">

<div class="col-sm-5 mb-3">
    <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" data-submenu>Dropdown</button>
    <div class="dropdown-menu">
        <div class="dropdown dropright dropdown-submenu">
            <button class="dropdown-item dropdown-toggle" type="button" data-toggle="dropdown">Action</button>
            <div class="dropdown-menu">
                <button class="dropdown-item" type="button">Sub action</button>
                <div class="dropdown dropright dropdown-submenu">
                </div>
                <button class="dropdown-item" type="button">Something else here</button>
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
    });
</script>
</body>
</html>
