$(document).ready(function () {
    $('.btn-click').click(function () {
        $('.account-book').animate({width: 'toggle'}, 500, function () {
            if ($('.account-book').is(':visible')) {
                $('.chart').css('display', 'none');
            } else {
                $('.chart').css('display', 'flex');
            }
        });
    });
});

// bootstrap submenu
$(function() {
    $('[data-submenu]').submenupicker();

    $(document).on('click', '.btn-category', function() {
        const dataId = $(this).data('id');
        const dataName = $(this).data('name');
        const btnTest = $(this).closest('td').find('.btn-test');
        btnTest.text(dataName).attr('data-id', dataId);
        console.log('사용자가 선택한 카테고리 식별코드 = {' + btnTest.attr('data-id') + '}');
    });
});

// 가게부 예산 수정
$(document).on('click', '#budget-flag', function() {
    if(!$('#b_fix').val()) {
        alert('고정지출 예산 금액을 입력하지 않으셨습니다.');
    } else if(!$('#b_nonfix').val()) {
        alert('비고정지출 예산 금액을 입력하지 않으셨습니다.');
    }
    else {
        $.ajax({
            type: 'post',
            url: '/accountbook/update-budget',
            data: {'b_cover' : $('#b_cover').val(), 'b_fix' : $('#b_fix').val(), 'b_nonfix' : $('#b_nonfix').val()},
            success: function() {
                alert('기초 예산 수정이 완료되었습니다.');
                location.reload();
            }
        })
    }
})

$(document).on('click', '#create', function () {
    document.querySelectorAll('#create');
    const row = this.closest('tr');
    const m_id = row.querySelector(`[name = 'm_id']`).value;
    const a_id = row.querySelector(`[name = 'a_id']`).value;
    const a_code = row.querySelector(`[name = 'a_code']`).value;
    const d_date = row.querySelector(`[name = 'd_date']`).value;
    const c_code = $(this).closest('tr').find('.btn-test').attr('data-id'); // submenu
    console.log('사용자가 등록할 카테고리 식별코드 = {' + c_code + '}');
    const m_amount = row.querySelector(`[name = 'm_amount']`).value;
    const m_memo = row.querySelector(`[name = 'm_memo']`).value;
    const btn = document.querySelectorAll('#create-flag');

    btn.forEach(btn => {
        btn.addEventListener('click', function () {
            $.ajax({
                type: 'post',
                url: '/accountbook/mw/insert',
                data: {
                    'm_id': m_id,
                    'a_id': a_id,
                    'a_code': a_code,
                    'd_date': d_date,
                    'c_code': c_code,
                    'm_amount': m_amount,
                    'm_memo': m_memo
                },
                success() {
                    alert('추가가 완료되었습니다.');
                    location.reload();
                }, error() {
                    alert("추가가 취소되었습니다. 잠시 후 다시 이용해주세요.");
                }
            })
        })
    })
});

$(document).on('click', '#update', function () {
    const row = this.closest('tr');
    const mo_id = row.querySelector(`[name='mo_id']`).value;
    const d_date = row.querySelector(`[name='d_date']`).value;
    const c_code = $(this).closest('tr').find('.btn-test').attr('data-id'); // submenu
    console.log('사용자가 수정할 카테고리 식별코드 = {' + c_code + '}');
    const m_amount = row.querySelector(`[name='m_amount']`).value;
    const m_memo = row.querySelector(`[name='m_memo']`).value;

    // btn 클릭 이벤트 핸들러 내에서 변수 사용
    const btn = document.querySelectorAll('#update-flag');
    btn.forEach(btnElement => {
        btnElement.addEventListener('click', function () {
            $.ajax({
                type: 'post',
                url: '/accountbook/mw/update',
                data: {'mo_id': mo_id, 'd_date': d_date, 'c_code': c_code, 'm_amount': m_amount, 'm_memo': m_memo},
                success() {
                    alert("수정이 완료되었습니다.");
                    location.reload();
                },
                error() {
                    alert('수정이 취소되었습니다. 잠시 후 다시 이용해주세요.');
                }
            });
        });
    });
});

const del = document.querySelectorAll('#delete');
del.forEach(btn => {
    btn.addEventListener('click', function () {
        const row = this.closest('tr');
        const mo_id = row.querySelector(`[name = 'mo_id']`).value;
        console.log(mo_id);
        const btn = document.querySelectorAll('#delete-flag');

        btn.forEach(btn => {
            btn.addEventListener('click', function () {
                $.ajax({
                    type: 'post',
                    url: '/accountbook/mw/delete',
                    data: {'mo_id': mo_id},
                    success() {
                        alert('삭제가 완료되었습니다.');
                        location.reload();
                    }, error() {
                        alert("삭제가 취소되었습니다. 잠시 후 다시 이용해주세요.");
                    }
                })
            })
        })
    })
})

// 차트
document.getElementById("btn-compare").addEventListener("click", function() {
    const url = "/accountbook/mt/amount-compare";
    window.open(url, " ", "width=1900,height=1500");
});