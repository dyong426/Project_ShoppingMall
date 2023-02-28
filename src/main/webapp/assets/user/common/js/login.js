Kakao.init('8676dae7b3d994926031dc1e85880115');
console.log(Kakao.isInitialized());


let login_value = document.getElementById('sign_in').value;
let login_status = document.getElementById('sign_in');




function logout() {
	document.querySelector(".sign_up").classList.remove('hidden_visibility');
   	login_value='login';
    login_status.innerText = '로그인';
    kakaoLogout();
 
}

function login() {
	document.querySelector(".sign_up").classList.add('hidden_visibility');
	login_value='logout';
	
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



  function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function (res) {



      })
      .catch(function (err) {
		console.log('에러');
      });
  }

  
  