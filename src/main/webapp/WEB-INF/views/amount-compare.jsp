<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="layout/head.jsp"/>
<body>
<section>
    <h1>평균 비고정지출 비교 차트</h1>
    <div style="display:flex; justify-content: center; align-items: center">
        <img src="<c:url value="/resources/img/alert-icon.png" />" style="width: 60px">
        <div style="color:gray; font-weight: bold;">${name}님의 평균 비고정지출 금액과 다른 회원님들의 평균 비고정지출 금액을 비교합니다.</div>
    </div>
    <div id="chart"></div>
</section>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script type="text/javascript">
    const member = [
        <c:forEach var="m" items="${member}" varStatus="status">
        {
            category: "${m.category}",
            amount: ${m.amount}
        },
        </c:forEach>
    ];

    const notMember = [
        <c:forEach var="nm" items="${notMember}" varStatus="status">
        {
            amount: ${nm.amount}
        },
        </c:forEach>
    ];

    const category = [];
    member.forEach(item => {
        category.push([item.category]);
    });

    const memberAmount = [];
    member.forEach(item => {
        memberAmount.push([item.amount]);
    });

    const notMemberAmount = [];
    notMember.forEach(item => {
        notMemberAmount.push([item.amount]);
    });

    Highcharts.chart('chart', {
        chart: {
            type: 'column'
        },
        title: {
            text: ' '
        },
        xAxis: {
            categories: category,
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: '금액'
            },
            labels: {
                formatter: function () {
                    return Highcharts.numberFormat(this.value, 0, '', ',') + '￦';
                }
            }
        },
        plotOptions: {
            column: {
                pointWidth: 45
            }
        },
        series: [
            {
                name: '${name}님',
                data: memberAmount,
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                        return Highcharts.numberFormat(this.y, 0, '', ',') + '￦';
                    }
                },
            }, {
                name: '기타 회원',
                data: notMemberAmount,
                dataLabels: {
                    enabled: true,
                    formatter: function () {
                        return Highcharts.numberFormat(this.y, 0, '', ',') + '￦';
                    }
                },
            }],
        tooltip: {
            zIndex: 9999,
            pointFormatter: function () {
                return '<span style="color:' + this.color + '">\u25CF</span> ' + this.series.name + ':' + Highcharts.numberFormat(this.y, 0, '.', ',') + '￦';
            }
        }
    });
</script>
</body>
</html>