Kakao.init('8676dae7b3d994926031dc1e85880115');
console.log(Kakao.isInitialized());


let text = document.getElementById('sign_in');

function changeStatusToLogin() {
  text.innerText='로그아웃';
  
}

function logout(){

if(text === '로그아웃'){
  text.innerText='로그인';
}

}
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	 close_join();
            changeStatusToLogin();
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
      .then(function(res) {
        console.log(JSON.stringify(res));
        close_join();
        
        
      })
      .catch(function(err) {

      });
  }
