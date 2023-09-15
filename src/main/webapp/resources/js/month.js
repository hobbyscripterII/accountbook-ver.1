$(document).ready(function () {
    $('.btn-click').click(function () {
        $('.account-book').animate({ width: 'toggle' }, 500, function () {
            if ($('.account-book').is(':visible')) {
                $('.chart').css('display', 'none');
            } else {
                $('.chart').css('display', 'flex');
            }
        });
    });
});

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
                },  error() {
                    alert("추가가 취소되었습니다. 잠시 후 다시 이용해주세요.");
                }
            })
        })
    })
})

$(document).on('click', '#update', function() {
    const row = this.closest('tr');
    const m_id = row.querySelector(`[name='m_id']`).value;
    const d_date = row.querySelector(`[name='d_date']`).value;
    const c_code = row.querySelector(`[name='c_code']`).value;
    const m_amount = row.querySelector(`[name='m_amount']`).value;
    const m_memo = row.querySelector(`[name='m_memo']`).value;

    // btn 클릭 이벤트 핸들러 내에서 변수 사용
    const btn = document.querySelectorAll('#update-flag');
    btn.forEach(btnElement => {
        btnElement.addEventListener('click', function() {
            $.ajax({
                type: 'post',
                url: '/accountbook/mw/update',
                data: {
                    'm_id': m_id,
                    'd_date': d_date,
                    'c_code': c_code,
                    'm_amount': m_amount,
                    'm_memo': m_memo
                },
                success(data) {
                    alert('수정이 완료되었습니다.');
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
                        alert("삭제가 취소되었습니다. 잠시 후 다시 이용해주세요.");
                    }
                })
            })
        })
    })
})