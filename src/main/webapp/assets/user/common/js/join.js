show_error_message_join = (error, error_message) => {

    document.getElementById('error_message_join').classList.remove('hidden_visibility');
    document.getElementById('error_message_join').innerHTML = '<strong>' +error +'</strong>' + error_message;

}

function join_check() {
    const mem_email = document.getElementById('mem_email');
    const mem_name = document.getElementById('mem_name');
    const mem_pw = document.getElementById('mem_pw');
    const mem_pw_rck = document.getElementById('mem_pw_recheck');



    if (mem_email.value == "") {
        mem_email.focus();
        show_error_message_join('이메일 주소','를 입력해주세요.');

    } else if (mem_name.value == "") {
        mem_name.focus();
        show_error_message_join('이름','을 입력해주세요.');

    } else if (mem_pw.value == "") {
        mem_name.focus();
        show_error_message_join('비밀번호','를 입력해주세요.');

    } else if (mem_pw_rck.value == "") {
        mem_pw_rck.focus();
        show_error_message_join('비밀번호를 한번 더',' 입력해주세요.');
    }

}


function mySubmit_join() {

    const mem_email = document.getElementById('mem_email');
    const mem_name = document.getElementById('mem_name');
    const mem_pw = document.getElementById('mem_pw');
    const mem_pw_rck = document.getElementById('mem_pw_recheck');

    const getEmailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    const getNameCheck = /^[가-힣|a-z|A-Z]{2,10}/;
    const getPwCheck = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;

    let submit_check = true;
    if (!checkEmail(mem_email.value)) {
        mem_email.focus();
        show_error_message_join('이미 존재하는 계정','입니다. (이메일 주소 중복)');
        submit_check = false;

    } else if (!getEmailCheck.test(mem_email.value)) {
        mem_email.focus();

        show_error_message_join('유효하지 않은 이메일 주소','입니다.');
        submit_check = false;

    } else if (!getNameCheck.test(mem_name.value)) {
        mem_name.focus();
        show_error_message_join('유효하지 않은 이름','입니다.');
        submit_check = false;

    } else if (!getPwCheck.test(mem_pw.value)) {
        mem_pw.focus();
        show_error_message_join('유효하지 않은 비밀번호','입니다.');
        submit_check = false;

    } else if (!(mem_pw.value === mem_pw_rck.value)) {
        mem_pw_rck.focus();
        show_error_message_join('재입력한 비밀번호','가 다릅니다.');
        submit_check = false;

    } else if (!($('#join_agree').is(':checked'))) {
        join_agree.focus();
        show_error_message_join('개인 정보 취급 및 이용 약관 동의','는 필수입니다.');
        submit_check = false;

    }




    return submit_check;
}


function checkEmail(mem) {

    let isTrue = true;

    $.ajax({
        url: '/jhc/emailCheck',
        type: 'POST',
        async: false,
        dataType: 'json',
        data: { 'mem_email': mem},
        success: function (cnt) {
	
            isTrue = cnt == 0 ? true : false;
        },

        error: function () {
            console.log('에러발생');
        }
    })

    //true는 계정없음, false는 계정있음

    return isTrue;

}