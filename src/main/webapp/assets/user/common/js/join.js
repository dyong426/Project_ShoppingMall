join_check = () => {

    const email = document.getElementById("mem_email");
    const name = document.getElementById("mem_name");
    const pw = document.getElementById("mem_pw");
    const pw_rck = document.getElementById("mem_pw_recheck");

    if (email.value == "") {
        
        email.focus();
        document.getElementById('error_message_join').innerHTML = '<strong>이메일</strong>을 입력해주세요.';
        show_error_message_join();
        return false;
    }

    if (name.value == "") {

        document.getElementById('error_message_join').innerHTML = '<strong>이름</strong>을 입력해주세요.';
        name.focus();
        show_error_message_join();
        return false;
    }

    if (pw.value == "") {

        document.getElementById('error_message_join').innerHTML = '<strong>비밀번호</strong>를 입력해주세요.';
        show_error_message_join();
        pw.focus();
        return false;
    }

    if (pw_rck.value == "") {
        document.getElementById('error_message_join').innerHTML = '<strong>비밀번호</strong>를 한번 더 입력해주세요.';
        show_error_message_join();
        pw_rck.focus();
        return false;
    }

    
}

show_error_message_join = () => {

    document.querySelector(".join_error_wrap").classList.remove('hidden_visibility');
}

function please_insert(num) {
    if (num === 1) {
        
    } else if (num === 2) {
        
    } else if (num === 3) {
        
    } else if (num === 4) {
        
    }
    show_error_message();



}

mySubmit_join = () => {

    if (!checkEmail()) {
        document.getElementById('error_message_join').innerHTML = '이미 존재하는 계정입니다. (이메일 주소 중복)';

        show_error_message_join();
        return false;
    }

    let submit_mem_email = $('#mem_email').val();
    let submit_mem_name = $('#mem_name').val();
    let submit_mem_pw = $('#mem_pw').val();
    let submit_mem_pw_rck = $('#mem_pw_recheck').val();

    const getEmailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    const getPwCheck = /([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/;
    const getNameCheck = /^[가-힣]+$/;

    let submit_check = true;


    if (!getEmailCheck.test(submit_mem_email)) {
        document.getElementById('error_message_join').innerHTML = '유효하지 않은 이메일 주소입니다.';

        submit_check = false;
    } else if (!getNameCheck.test(submit_mem_name)) {

        document.getElementById('error_message_join').innerHTML = '유효하지 않은 이름입니다.';
        submit_check = false;
    } else if (!getPwCheck.test(submit_mem_pw)) {

        document.getElementById('error_message_join').innerHTML = '유효하지 않은 비밀번호입니다.';
        submit_check = false;
    } else if (!(submit_mem_pw === submit_mem_pw_rck)) {

        document.getElementById('error_message_join').innerHTML = '재입력한 비밀번호가 다릅니다.';
        submit_check = false;
    } else if (!($('#join_agree').is(':checked'))) {
        console.log($('#join_agree').is(':checked'));
        document.getElementById('error_message_join').innerHTML = '개인 정보 취급 및 이용 약관 동의는 필수입니다.';
        submit_check = false;

    }


console.log(submit_check);

    if (!submit_check) {
        show_error_message_join();
        return false;
    } else {
        return true;
    }
}

function checkEmail (){
    var email = $('.mem_email').val();

    var isTrue = true;
    $.ajax({
        url: '/jhc/emailCheck',
        type: 'POST',
        async: false,
        dataType: 'json',
        data: { 'mem_email': email },
        success: function (cnt) {
            isTrue = cnt == 0 ? true : false;

        },

        error: function () {
            console.log('에러발생');
        }
    })
    
    return isTrue;

}