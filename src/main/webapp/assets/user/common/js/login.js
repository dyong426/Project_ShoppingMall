<!-- 정수정, 로그인 기능 -->

Kakao.init('8676dae7b3d994926031dc1e85880115');

show_error_message_login = (error, message) => {

  document.querySelector(".login_error_wrap").classList.remove('hidden_visibility');
  document.getElementById('error_message_login').innerHTML = '<strong>' + error + '</strong>' + message;
}

checkEmailPw = () => {
  var email = $('#login_email').val();
  var pw = $('#login_pw').val();

  pw = encoder(pw);
  console.log(pw);

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

function encoder(password) {
  var encoded = "";

  $.ajax({
    url: "/jhc/encrypt.do",
    type: 'POST',
    async: false,
    data: { password: password },
    success: function (data) {
      encoded = data;
    },
    error: function (xhr, ajaxOptions, thrownError) {
      alert(xhr.status);
      alert(thrownError);
    }

  });

  console.log(encoded);
  return encoded;


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
    show_error_message_login('비밀번호', '를 입력해주세요.');
    pw.focus();
    submit_check = false;

  } else if (checkEmailPw()) {
    login();
    return true;

  } else {
    pw.focus();
    show_error_message_login('비밀번호', '가 틀렸습니다.');
    return false;
  }

  console.log(submit_check);
  return submit_check;

}





function kakaoJoin() {
  Kakao.Auth.login({
    success: function (response) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (response) {

          $.ajax({
            url: '/jhc/kakao/join',
            type: 'POST',
            dataType: 'text',
            data: { kakao_id: response.id, kakao_name: response.kakao_account.profile.nickname },
            success: function (result) {
              console.log(result);
              if (result === 'true') {
              } else {
                console.log(result);
                alert('이미 가입된 계정입니다. 로그인 해주세요.');
                location.replace('/jhc/main');
              }
            },
            error: function (error) {
            }
          })
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

function kakaoLogin() {
  Kakao.Auth.login({
    success: function (response) {
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (response) {
          $.ajax({
            url: '/jhc/login.do',
            type: 'POST',
            data: { mem_email: response.id },
            success: function () {
              console.log('로그인성공');
              location.reload('/jhc/main');
            }
          })
        },
        fail: function (error) {
          console.log(error)
        },
      })
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


const loginBtn = document.getElementById('loginBtn');
const logoutBtn = document.getElementById('logoutBtn');
const joinBtn = document.getElementById('joinBtn');
const user_welcome = document.getElementById('user_welcome_text');

// 로그인 <-> 로그아웃
isLoggedIn(function (loggedIn) {
  if (loggedIn) {
    joinBtn.classList.add('hidden_visibility');
    loginBtn.classList.add('hidden_visibility');
    logoutBtn.classList.remove('hidden_visibility');
    user_welcome.classList.remove('hidden_visibility');
  } else {

    joinBtn.classList.remove('hidden_visibility');
    logoutBtn.classList.add('hidden_visibility');
    loginBtn.classList.remove('hidden_visibility');
    user_welcome.classList.add('hidden_visibility');
  }
});


logoutBtn.addEventListener('click', function () {
  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/jhc/logout.do', true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      window.location.href = '/jhc/main';
    }
  };
  xhr.send();


});