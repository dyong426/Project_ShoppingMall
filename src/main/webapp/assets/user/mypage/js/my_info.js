const resign = document.querySelector('.withdrawal');

resign.addEventListener('click', function () {
    const confirmResign = confirm('정말로 탈퇴하시겠습니까?');

    if (confirmResign) {
        $.ajax({
            url: '/jhc/member/delete-account',
            type: 'POST',
            data: { mem_num: mem_num },
            dataType: 'text',
            success: function (response) {
                alert('회원 탈퇴가 완료 되었습니다.');
                sessionClear();
                location.replace('/jhc/main');
            }


        })
    }

});

function sessionClear() {

    $.ajax({
        url: '/jhc/logout.do',
        type: 'POST',
        success: function (result) {

        },
        error: function (xhr, status, error) {

        }


    });
}

const clickToChangePW = document.querySelector(".btn_change_pw");

clickToChangePW.addEventListener('click', function () {
    const confirmChange = confirm('비밀번호를 변경 링크를 받으시겠습니까?');

    if (confirmChange) {
        $.ajax({

            url: '/jhc/password/change',
            type: 'POST',
            success: function () {
                location.replace('/jhc/password/mail');

            },
            error: function () {
                console.log('비밀번호 변경 중 오류');
            }
        })
    }

});



const myInfo_modify = document.querySelector('.modify');
myInfo_modify.addEventListener('click', function () {
    const myInfo_birth = document.querySelector('#myInfo_birth');
    const myInfo_phone = document.querySelector('#myInfo_phone');
	console.log(myInfo_birth);

    const confirmInfoModify = confirm('정보를 변경하시겠습니까?');

    if (confirmInfoModify) {
        $.ajax({
            url: '/jhc/myInfo/change',
            type: 'POST',
            data: { 'myInfo_birth': myInfo_birth.value, 'myInfo_phone': myInfo_phone.value },
            success: function () {
                alert('성공적으로 저장되었습니다. 다시 로그인 해주세요.');
                
                location.replace('/jhc/info')
            },
            error: function () {
                alert('오류 발생');
            }


        })
    }




});
