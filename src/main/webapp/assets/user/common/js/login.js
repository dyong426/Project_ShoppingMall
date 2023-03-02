Kakao.init('8676dae7b3d994926031dc1e85880115');
console.log(Kakao.isInitialized());

show_error_message_login = () => {

  document.querySelector(".login_error_wrap").classList.remove('hidden_visibility');
}

checkEmailPw = () => {
  var email = $('#login_email').val();
  var pw = $('#login_pw').val();

  var isTrue = true;
  $.ajax({
    url: '/jhc/checkEmailPw',
    type: 'POST',
    async: false,
    dataType: 'json',
    data: { 'mem_pw': pw, 'mem_email': email },
    success: function (match) {
      isTrue = match == 1 ? true : false;
    },
    error: function () {
      console.log('에러발생');
    }
  })

  return isTrue;

}

show_error_message_login = () => {

  document.querySelector(".login_error_wrap").classList.remove('hidden_visibility');
}

mySubmit_login = () => {

  var mem_email = $('#mem_email').val();
  const getEmailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
  var submit_check = true;

  if (!getEmailCheck.test(mem_email)) {
    document.getElementById('error_message_login').innerHTML = '유효하지 않은 이메일 주소입니다.';
    submit_check = false;

  }	
	
    console.log(checkEmailPw());
  if (!submit_check) {
    show_error_message_login();
    return false;
  } else if (checkEmailPw()) {
    return true;
  } else {
  	return true;
  }
  
}



login_check = () => {

  const email = document.getElementById("login_email");
  const pw = document.getElementById("login_pw");

  if (email.value == "") {

    document.getElementById('error_message_login').innerHTML = '<strong>이메일</strong>을 입력해주세요.';
    show_error_message_login();
    email.focus();
    return false;
  }
  
  if (checkEmail()) {
    document.getElementById('error_message_login').innerHTML = '<strong>이메일 주소</strong>가 틀렸습니다.';
    email.focus();
    return false;
  }

  if (pw.value == "") {

    document.getElementById('error_message_login').innerHTML = '<strong>비밀번호</strong>를 입력해주세요.';
    show_error_message_login();
    pw.focus();
    return false;
  }

  if (checkEmailPw()) {
    console.log('로그인');

    return true;

  } else {
    document.getElementById('error_message_login').innerHTML = '<strong>비밀번호</strong>가 틀렸습니다.';
    show_error_message_login();
    pw.focus();
    return false;
  }

  
}


let login_value = document.getElementById('login').value;
let login_status = document.getElementById('login');


function logout() {
  document.querySelector(".login").classList.remove('hidden_visibility');
  login_value = 'login';
  login_status.innerText = '로그인';
  kakaoLogout();

}

function login() {
  document.querySelector(".logout").classList.add('hidden_visibility');
  login_value = 'logout';

  login_status.innerText = '로그아웃';
}

function kakaoLogin() {
  Kakao.Auth.login({
    success: function (response) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (response) {
          login();
          close_login();
          close_join();

        },
        fail: function (error) {
          console.log(error)
        },
      })
    },
    fail: function (error) {
      console.log(error)
    },
  })
}

function kakaoLogout() {
  if (Kakao.Auth.getAccessToken()) {
    Kakao.API.request({
      url: '/v1/user/unlink',
      success: function (response) {
        console.log(response)
      },
      fail: function (error) {
        console.log(error)
      },
    })
    Kakao.Auth.setAccessToken(undefined)
  }
}


