Kakao.init('8676dae7b3d994926031dc1e85880115');
console.log(Kakao.isInitialized());

show_error_message_login = (error, message) => {

  document.querySelector(".login_error_wrap").classList.remove('hidden_visibility');
  document.getElementById('error_message_login').innerHTML = '<strong>' + error + '</strong>' + message;
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

mySubmit_login = () => {

  const email = document.getElementById('login_email');
  const pw = document.getElementById('login_pw');

  let submit_check = null;

  if (email.value == "") {
    email.focus();
    show_error_message_login('이메일', '을 입력해주세요.');
    submit_check = false;

  } else if (checkEmail(email.value)) {
    show_error_message_login('이메일 주소', '가 틀렸습니다.');
    email.focus();
    submit_check = false;

  } else if (pw.value == "") {
    show_error_message_login('비밀번호','를 입력해주세요.');
    pw.focus();
    submit_check = false;

  } else if (checkEmailPw()) {
    login();
    return true;

  } else {
    pw.focus();
    show_error_message_login('비밀번호','가 틀렸습니다.');
    return false;
  }

	console.log(submit_check);
  return submit_check;

}




function logout() {
  document.querySelector(".login").classList.remove('hidden_visibility');
  login_value = 'login';

  kakaoLogout();

}

function login() {
  
  console.log(document.getElementById('login').innerText);
  
  document.getElementById('login').innerText = '로그아웃';
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


