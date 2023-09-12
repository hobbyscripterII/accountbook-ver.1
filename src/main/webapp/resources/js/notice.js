/** notice-write **/


/** notice-read **/
function del() {
    if(confirm("삭제된 글은 복구할 수 없습니다. 정말로 삭제하시겠습니까?")) {
        // 확인 분기문
        $.ajax({
            type: 'post',
            url: '/accountbook/notice/delete',
            data: {'n_id' : $('#n_id').val()},
            success(data) {
                alert("해당 게시글이 삭제되었습니다.");
                location.href='/accountbook/notice/list';
            }
        })
    } else {
        // 취소 분기문
        alert("게시글 삭제가 취소되었습니다.");
    }
}

 /** notice-update **/
 function res() {
     if(confirm("수정을 취소하시겠습니까?")) {
         location.href ='/accountbook/notice/list/' + $('#n_id').val();
     } else {
     }
 }

function upd() {
    if(confirm("해당 글을 수정하시겠습니까?")) {
        $.ajax({
            type: 'post',
            url: '/accountbook/notice/update',
            data: {'n_id' : $('#n_id').val(), 'n_title' : $('#n_title').val(), 'n_content' : $('#n_content').val()},
            success(data) {
                alert("수정이 완료되었습니다.");
                location.href ='/accountbook/notice/list/' + $('#n_id').val();
            }
        })
    } else {
        alert("게시글 수정이 취소되었습니다.");
    }
}